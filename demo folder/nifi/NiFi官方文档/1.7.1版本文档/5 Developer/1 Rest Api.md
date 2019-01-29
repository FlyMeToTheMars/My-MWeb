/nifi-api

[NiFi Rest Api 1.7.1](https://nifi.apache.org/docs.html)

The Rest Api provides programmatic access to command and control a NiFi instance in real time. Start and stop processors, monitor queues, query provenance data, and more. Each endpoint below includes a description, definitions of the expected input and output, potential response codes, and the authorizations required to invoke each service.

Access

User authentication and token endpoints



Controller

Get controller configuration, Manage the cluster, Create reporting tasks



Controller Services

Manage controller services, Update controller service references



Reporting Tasks

Manage reporting tasks



Counters

Get counters, Reset counters



Flow

Get the data flow, Obtain component status, Query history



Process Groups

Create components, Instantiate a template, Upload a template



Processors

Create a processor, Set properties, Schedule



Connections

Create a connection, Set queue priority, Update connection destination



FlowFile Queues

View queue contents, Download flowfile content, Empty queue



Input Ports

Create an input port, Set remote port access control



Output Ports

Create an output port, Set remote port access control



Remote Process Groups

Create a remote group, Enable transmission



Labels

Create a label, Set label style



Funnels

Manage funnels



Provenance

Query provenance, Search event lineage



Provenance Events

Download content, Replay



Tenants

Add users and group, Group users



Policies

Get policies, Create policies



Resources

Get resources



Site to Site

Get available ports, Get peers



Data Transfer

Send data, Receive data



Snippets

Create a snippet, Move a snippet, Delete a snippet



Templates

Download a template, Delete a template



System Diagnostics

Get system diagnostics



Versions

Manage versions of process groups