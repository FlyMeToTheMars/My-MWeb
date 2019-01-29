[APACHE NIFI](https://pierrevillard.com/category/apache-nifi/)

# List/Fetch pattern and Remote Process Group in Apache NiFi

[FEBRUARY 23, 2017](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/) [PVILLARD31](https://pierrevillard.com/author/pvillard31/)[14 COMMENTS](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comments)

I do see a lot of questions about how is working the List[X]/Fetch[X] processors and how to load balance the data over the nodes of a NiFi cluster once the data is already in the cluster. Since the question comes up quite often, let’s discuss the subject and let’s try to understand how things are working here.

I will assume that you are running a NiFi cluster since there is no problem about data balancing with a standalone instance 

## Two Thing To Understand

### which node will be the primary node

The first thing to understand is: when running a cluster, one of the node is randomly designated as the “Primary node”. The election takes place when the cluster starts, and there is no way to decide which node will be the primary node. OK… you could force things when your cluster starts but there is no point to do such a thing if you want real high availability. So short line is: all nodes may have to be the Primary node at one point and don’t assume that the Primary node will be a given node in particular.

### the data no balanced over the nodes

Second thing to understand is: the flow that you are designing on your canvas is running on all the nodes independently. Each node of the cluster is responsible of its own data and a relationship between two processors does not mean that the data going into this relationship will be balanced over the nodes. Unless you use a Remote Process Group (see below) the data will remain on the same node from the beginning to the end of the flow.

I will use a the following example to illustrate my explanations: I want to get files from a remote SFTP server and put the files into HDFS.

## GetSFTP -> PutHDFS

- **First idea (bad idea!) / GetSFTP -> PutHDFS**

![Screen Shot 2017-02-23 at 11.04.42 AM.png](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-11-04-42-am.png?w=809)

The first option could be the pattern Get/Put which is perfectly fine with a standalone instance. However this will cause issues if you have a NiFi cluster. Remember? The flow is running on all hosts of your cluster. Problem is that you will have concurrent accesses from your nodes to the same files on the SFTP server… and if the processor is configured to delete the file once retrieved (default behavior) you will have errors showing up. Conclusion: always have in mind that a processor is running on all the nodes and can cause concurrent access errors depending on the remote system.

## GetSFTP on Primary Node -> PutHDFS

- **Second idea (not efficient!) / GetSFTP on Primary Node -> PutHDFS**

The second option is to configure the GetSFTP processor to only run on the Primary Node (in the Scheduling tab of the processor configuration):

![Screen Shot 2017-02-23 at 11.10.12 AM.png](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-11-10-12-am.png?w=809)

This way, you will solve the concurrent accesses since only one node of your cluster (the Primary node) will run the GetSFTP processor.

Brief aside: remember, the flow is running on all the nodes, however if the processor is configured to run on the primary node only, the processor won’t be scheduled on nodes not being the primary node. That’s all.

With this approach the problem is that it’s not efficient at all. First reason is that you get data from only one node (this does not scale at all), and, in the end, only the primary node of your cluster is actually handling the data. Why? Because, unless you explicitly use a remote process group, the data will remain on the same node from the beginning to the end. In this case, only the primary node will actually get data from SFTP server and push it into HDFS.

## ListSFTP -> RPG / Input Port -> FetchSFTP -> PutHDFS

- **Recommended pattern : ListSFTP -> RPG / Input Port -> FetchSFTP -> PutHDFS**

To solve the issues, the List/Fetch pattern has been developed and widely used for a lot of processors. The idea is the following: the List processor will only list the data to retrieve on the remote system and get the associated metadata (it will not get the data itself). For each listed item, a flow file (with no content) will be generated and attributes will be populated with the metadata. Then the flow file is sent to the Fetch processor to actually retrieved the data from the remote system based on the metadata (it can be the path of the file on the remote system for example). Since each flow file contains the metadata of a specific item on the remote system, you won’t have concurrent accesses even if you have multiple Fetch processors running in parallel.

Obviously the List processor is meant to be run on the Primary node only. Then you have to balance the generated flow files over the nodes so that the Fetch processor on each node is dealing with flow files. For this purpose you have to use a Remote Process Group.

### Remote Process Group.

A Remote Process Group is an abstract object used to connect two NiFi setup together (the communication between the two NiFi is what we call Site-to-Site or S2S). It can be a MiNiFi instance to a NiFi cluster, a NiFi cluster to another NiFi cluster, a NiFi standalone to a NiFi cluster, etc. And *<u>**it can also be used to connect a NiFi cluster to itself !**</u>* This way the flow files will be balanced over all the nodes of the cluster. Few things to know with a Remote Process Group:

1. You need to have an input port on the remote instance you are connecting to (in our case, you need a remote input port on your canvas).
2. The address you give when configuring your remote process group does not matter in terms of high availability: once the connection is established with one of the nodes of the remote instance, the remote process group will be aware of all the nodes of the remote instance and will manage the case where the node specified in the address goes down.
3. Your instances need to be configured to allow remote access. The required properties are:

> \# Site to Site properties
> nifi.remote.input.host=
> nifi.remote.input.secure=
> nifi.remote.input.socket.port=
> nifi.remote.input.http.enabled=
> nifi.remote.input.http.transaction.ttl=

In the case of our SFTP example, it looks like:

![Screen Shot 2017-02-23 at 11.47.40 AM.png](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-11-47-40-am.png?w=809)

Let’s try to understand what is going on from a cluster perspective. Here is what we have in the case of a 3-nodes NiFi cluster with ListSFTP running on the primary node only:

![Screen Shot 2017-02-23 at 12.03.22 PM.png](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-12-03-22-pm.png?w=809)

### ListSFTP 

The ListSFTP when scheduled is going to list the three files on my remote SFTP server and will generate one flow file for each remote file. Each flow file won’t have any content but will have attributes with metadata of the remote files. In the case of ListSFTP, I’ll have ([check the documentation at the “Write attributes” paragraph](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi.processors.standard.ListSFTP/)):

| Name                  | Description                                                  |
| --------------------- | ------------------------------------------------------------ |
| sftp.remote.host      | The hostname of the SFTP Server                              |
| sftp.remote.port      | The port that was connected to on the SFTP Server            |
| sftp.listing.user     | The username of the user that performed the SFTP Listing     |
| file.owner            | The numeric owner id of the source file                      |
| file.group            | The numeric group id of the source file                      |
| file.permissions      | The read/write/execute permissions of the source file        |
| file.lastModifiedTime | The timestamp of when the file in the filesystem waslast modified as ‘yyyy-MM-dd’T’HH:mm:ssZ’ |
| filename              | The name of the file on the SFTP Server                      |
| path                  | The fully qualified name of the directory on the SFTP Server from which the file was pulled |

The ListSFTP processor will generate 3 flow files and, for now, all flow files are only on the primary node:

![Screen Shot 2017-02-23 at 1.59.43 PM.png](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-1-59-43-pm.png?w=809)

Now the Remote Process Group has been configured to connect to the cluster itself, and I set the relationship going from ListSFTP to the Remote Process Group to connect with the input port I created (you may have multiple input ports in the remote system to connect with and you can choose the input port to connect to, that’s up to your needs). When the RPG (Remote Process Group) has the communication enabled, the RPG is aware of the three nodes and will balance the data to each remote node (be aware that there is a lot of parameters for Site-to-Site to improve efficiency). In my case that would give something like:

![Screen Shot 2017-02-23 at 1.59.55 PM.png](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-1-59-55-pm.png?w=809)

*Note: that would be an ideal case in terms of balancing but, for efficiency purpose, the Site-to-Site mechanism might send batch of flow files to the remote node. In the above example, with only 3 flow files, I would probably not end up with one flow file per node.*

Now, since we have everything in the attributes of our flow files, we need to use the [Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html) to set the properties of the FetchSFTP processor to use the attributes of the incoming flow files:

![screen-shot-2017-02-23-at-1-55-13-pm](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-1-55-13-pm.png?w=809)

This way, each instance of the FetchSFTP processor will take care of its own file (to actually fetch the content of the remote data) and there won’t be any concurrent access:

![Screen Shot 2017-02-23 at 2.00.12 PM.png](https://pierrevillarddotcom.files.wordpress.com/2017/02/screen-shot-2017-02-23-at-2-00-12-pm.png?w=809)

All your nodes are retrieving data and you really can scale up your cluster depending on your requirements. Note also that the PutHDFS won’t be an issue neither since each node will write its own file.

As I said previously a lot of processors are embracing this pattern (and this is recommended way to use such processors with a NiFi cluster), and I’d strongly encourage you to do the same when developing your custom processors.

As always questions/comments are welcome.



[APACHE NIFI](https://pierrevillard.com/tag/apache-nifi/), [CLUSTER](https://pierrevillard.com/tag/cluster/), [DATA](https://pierrevillard.com/tag/data/), [FLOW](https://pierrevillard.com/tag/flow/), [PROCESSING](https://pierrevillard.com/tag/processing/)

## Post navigation



PREVIOUS POST

Debugging Hadoop WebHDFS API

NEXT POST

Monitoring NiFi – Introduction



## 14 thoughts on “List/Fetch pattern and Remote Process Group in Apache NiFi”

1. ![img](https://secure.gravatar.com/blavatar/bdbf236982b124895b980b8dcbe5540e?s=50)**Last week in Stream Processing & Analytics – 27.02.2017 | Enjoy IT - SOA, Java, Event-Driven Computing and Integration** says:

   [FEBRUARY 27, 2017 AT 7:00 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-437)

   […] List/Fetch pattern and Remote Process Group in Apache NiFi by Pierre Villard […]

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=437#respond)

2. ![img](https://2.gravatar.com/avatar/5f4ef51d03761f243bd1384f723813c7?s=50&d=identicon&r=G)**Chandan Gaur** says:

   [APRIL 26, 2017 AT 2:29 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-514)

   thanks.. great explaination

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=514#respond)

3. ![img](https://2.gravatar.com/avatar/8baec79fc06b13ab54aff60687a1ab43?s=50&d=identicon&r=G)**Matt** says:

   [JUNE 12, 2017 AT 7:57 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-644)

   The ListSFTP has a Component State which sets and stores the listing and processed time stamp values. Is there a way to set these states when deploying the processor from one environment to another?

   Example: we update an existing template in development to include a new ‘RouteOnAttribute’ processor then save the template for export into Production. This template has been running in Production for some time and has the appropriate listing and processed time stamps stored in our ListSFTP processor but when importing the new template we find this overwrites / removes the existing state values of the ListSFTP process. How can we update these states to not reprocess everything on the SFTP directory?

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=644#respond)

   - ![img](https://0.gravatar.com/avatar/003589c4e4f72837f2677dab74c63297?s=50&d=identicon&r=G)**pvillard31** says:

     [JUNE 13, 2017 AT 8:06 AM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-652)

     At this time, manually setting values for the state of the processor is not possible, but an improvement could be performed to optionally export the state of the processor within a template. Would it answer your need? If yes, I can file a JIRA and have a look at the implementation of it.

     Like

     [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=652#respond)

4. ![img](https://2.gravatar.com/avatar/8baec79fc06b13ab54aff60687a1ab43?s=50&d=identicon&r=G)**Matt** says:

   [JUNE 13, 2017 AT 5:40 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-653)

   Yes, being able to export the state of the processor would be of benefit. I’d also find benefit to being able to set that processor state with unix timestamp values, if possible. But at the least being able to export the state would help when deploying between environments.

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=653#respond)

   - ![img](https://0.gravatar.com/avatar/003589c4e4f72837f2677dab74c63297?s=50&d=identicon&r=G)**pvillard31** says:

     [JUNE 13, 2017 AT 6:21 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-655)

     I created NIFI-4067 – Provide an interface to manually set/update the state of a processor (<https://issues.apache.org/jira/browse/NIFI-4067>). Feel free to add your comments/use cases on the JIRA or weight in to have this implemented.

     Like

     [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=655#respond)

5. ![img](https://0.gravatar.com/avatar/63a570f6819417300542b051e7e5140c?s=50&d=identicon&r=G)**jr ryan** says:

   [NOVEMBER 28, 2017 AT 5:31 AM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1157)

   Hi Pierre,

   Thanks for the article, it is very helpful.
   Could we set number of threads for each node in nifi cluster? because I have three nodes which 3rd node is more powerful than the others two nodes. Or the nifi cluster will auto-distribute more jobs to 3rd node?

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1157#respond)

   - ![img](https://0.gravatar.com/avatar/003589c4e4f72837f2677dab74c63297?s=50&d=identicon&r=G)**pvillard31** says:

     [DECEMBER 4, 2017 AT 2:08 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1167)

     Hi,

     This is not possible at the moment. The number of threads in the pool for each NiFi node (managed in Controller settings menu) is managed globally. You can’t set it per node. I know there are some discussions around this kind of stuff but this is not going to happen anytime soon IMO.

     Like

     [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1167#respond)

6. ![img](https://2.gravatar.com/avatar/27c0d54563d3e87b430356a9794ace97?s=50&d=identicon&r=G)**satish** says:

   [DECEMBER 21, 2017 AT 6:33 AM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1188)

   Nice Article. I have facing problem in my current workflow which is running on clustered NiFi. My workflow is LISTSFTP->GETSFTP->PUTHDFS->CREATE_HIVE_EXTERNAL_TABLE-> INSERT_INTO_MANAGED_TABLE. Everything is fine until PUTHDFS. But I have facing problem in creating the external table in hive, as I need to wait all PUTHDFS processes ( which are spanned across cluster) have completed before triggering external table processor. How can I achieve thi?

   Whether wait and notify processes can resolve this issue or else I need to implement using RPG?

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1188#respond)

   - ![img](https://0.gravatar.com/avatar/003589c4e4f72837f2677dab74c63297?s=50&d=identicon&r=G)**pvillard31** says:

     [DECEMBER 21, 2017 AT 5:14 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1193)

     I’m not sure to understand your use case. Why do you need to wait after all the PutHDFS to complete before creating your Hive table? IMO you create one single external table on top of each file you put in HDFS, then you “insert into select * from ” and you delete your external table (and file in HDFS if you want to).

     Like

     [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1193#respond)

7. ![img](https://0.gravatar.com/avatar/37c5d3498b178f8b56c6c7c09b4c2929?s=50&d=identicon&r=G)**Henrik Olsen** says:

   [MAY 29, 2018 AT 8:42 AM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1518)

   Thanks, Pierre. Now trying to figure out how to utilize this across multiple different flows (using different SFTP sources).
   As I use hierarchical Process Groups (PG) to organize flows, I don’t like to pollute root canvas (where I understand at least input/output ports needs to be for RPGs). Ideas on how to not make a mess out of this technique?
   If I call a RPG from deep down a PG path, can I make the RPG return asap via an outport port (e.g. after FetchSFTP) and continue path deep down in the original PG calling the RPG? So I have ListSFTP (PG1) => FetchSFTP (RPG) => [continued flow] (PG1), where the [continued flow] is now load balanced as the intermediate RPG call ensured that?
   As ListSFTP don’t pass along passwords/passphrases (to my knowledge) to FetchSFTP, if using many SFTP sources across projects/PGs, will I need one FetchSFTP for each source on root canvas, with manually entered password/passphrase?

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1518#respond)

   - ![img](https://0.gravatar.com/avatar/003589c4e4f72837f2677dab74c63297?s=50&d=identicon&r=G)**pvillard31** says:

     [MAY 29, 2018 AT 3:06 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1522)

     Hi Henrik. At the moment, unfortunately, this is not possible, meaning you have to set input/output ports at root level for S2S. However, this is something the community is working on, and I’d imagine this constraint to go away for NiFi 1.8.0 (just an assumption based on the discussions in the community, not a commitment :)). One idea would be to have a checkbox at connection configuration level to say “load balance across cluster” and you’d not have to use RPG at all, the framework would do it for you.

     Regarding the use of a single FetchSFTP to fetch data from multiple servers, that’s technically possible since username/password/hostname are evaluated against FFs attributes (if you’re using a recent version of NiFi) but I see two downsides: 1) the password will be cleartext as a flow file attribute (you can set proper authorizations to mask it but that’s clearly not great), 2) you’ll probably have a small performance hit since the FetchSFTP will close the connection and open a new one each time you fetch from a different server IIRC. IMO, I’d rather use one pair List/Fetch per remote server. If you have a lot of it, I’d look at the REST API to script the creation of all the workflows you need.

     Hope this helps a bit!

     Like

     [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1522#respond)

8. ![img](https://i1.wp.com/pbs.twimg.com/profile_images/850249950185181184/bhXylmri_normal.jpg?resize=50%2C50)**Arancha Ocana (@arancha_ocana)** says:

   [MAY 29, 2018 AT 6:18 PM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1524)

   Hi, Could you give us some feedback using Kafka such as source and following this pattern? Thanks !

   Like

   [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1524#respond)

   - ![img](https://0.gravatar.com/avatar/003589c4e4f72837f2677dab74c63297?s=50&d=identicon&r=G)**pvillard31** says:

     [MAY 30, 2018 AT 8:20 AM](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/#comment-1527)

     Hi Arancha,
     When it comes to Kafka, you don’t need to follow this pattern because everything is nicely handled for you in the background. I recommend you this great post to have more details: <https://bryanbende.com/development/2016/09/15/apache-nifi-and-apache-kafka>

     Like

     [REPLY](https://pierrevillard.com/2017/02/23/listfetch-pattern-and-remote-process-group-in-apache-nifi/?replytocom=1527#respond)

### Leave a Reply