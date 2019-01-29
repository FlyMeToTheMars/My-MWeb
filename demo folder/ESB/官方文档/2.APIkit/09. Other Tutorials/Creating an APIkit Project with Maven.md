# Creating an APIkit Project with Maven

**You can add APIkit components to an existing maven project**, for example a legacy project that you want to modernize using RAML and APIkit by using Maven commands. You need to have [Apache Maven](http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html) installed on your local system.

Familiarity with the following topics is recommended:

- mvn man page or [mvn help page](http://www.manpagez.com/man/1/mvn/)
- [Using Maven with Mule](https://docs.mulesoft.com/mule-runtime/3.8/using-maven-with-mule)

## Maven Settings File

You need a Maven `settings.xml` file in the `.m2` directory that includes the Mule repositories. If you do not have a `settings.xml` file, create one that points to Mule Repositories. Add the following content to your `settings.xml` file.

```xml
<settings>
    <pluginGroups>
        <pluginGroup>org.mule.tools</pluginGroup>
    </pluginGroups>
    <profiles>
        <profile>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <id>mule-repositories</id>
            <repositories>
                <repository>
                    <id>mulesoft-releases</id>
                    <name>MuleSoft Releases Repository</name>
                    <url>http://repository.mulesoft.org/releases/</url>
                </repository>
                <repository>
                    <id>mulesoft-snapshots</id>
                    <name>MuleSoft Snapshots Repository</name>
                    <url>http://repository.mulesoft.org/snapshots/</url>
                </repository>
            </repositories>
            <pluginRepositories>
                <pluginRepository>
                    <id>mulesoft-releases</id>
                    <name>MuleSoft Releases</name>
                    <url>http://repository.mulesoft.org/releases/</url>
                </pluginRepository>
                <pluginRepository>
                    <id>mulesoft-snapshots</id>
                    <name>MuleSoft Snapshots</name>
                    <url>http://repository.mulesoft.org/snapshots/</url>
                </pluginRepository>
            </pluginRepositories>
        </profile>
    </profiles>

</settings>
```

## Maven Archetype Command

You use the `mvn archetype` command to create [APIkit parts](https://docs.mulesoft.com/apikit/3.x/apikit-basic-anatomy) for the project. Maven stores the instructions for building the project and associated settings in a template called an *archetype.* APIkit provides a specialized Maven archetype tailored to the needs of creating APIkit projects. It is hosted in Mule’s public repositories so you don’t need to download it; you can simply reference its virtual address in your Maven commands.

The `mvn archetype` command creates a new project, directory structure, and an empty `api.raml` file. The command sets up required dependencies.

### mvn archetype parameters

The `mvn archetype` parameters define where to find the archetype.

| Parameter             | Value                                     |
| --------------------- | ----------------------------------------- |
| `archetypeGroupId`    | `org.mule.tools`                          |
| `archetypeArtifactId` | `apikit-archetype`                        |
| `archetypeVersion`    | `3.8.3`                                   |
| `archetypeRepository` | `http://repository.mulesoft.org/releases` |

The archetype version is the APIKit project archetype and the APIKit version used for the generated artifact.

You can include the following parameters in the `mvn archetype` command, using values specific to your project.

| Parameter    | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| `groupId`    | The standard Maven group Id for the project.                 |
| `artifactId` | The file name Maven will give to your project.               |
| `package`    | The Java package under which the message processor will live. |
| `version`    | The version of the new project.                              |

If you don’t include these parameters, Maven prompts you for values upon execution.

## Generating a New Project

To generate a new project in Studio:

1. In a terminal, navigate to the directory where you want to create the project, then run the following Maven generation command from within your Anypoint Studio workspace folder, for example `C:\Users\Aaron\workspace`.

   ```
   mvn archetype:generate -DarchetypeGroupId=org.mule.tools -DarchetypeArtifactId=apikit-archetype -DarchetypeVersion=3.8.3 -DarchetypeRepository=http://repository.mulesoft.org/releases -DgroupId=org.mule.tools -DartifactId=APIKit-project -Dpackage=package-name -Dversion=1.0
   ```

   Maven stores the project files in the Studio workspace.

2. Maven prompts you to ensure that the parameters listed above are correct. Type **Y**, then press **enter** to confirm. 

   Maven generates a new project in the specified directory that includes the latest Mule runtime available. To use an earlier runtime, open the pom.xml file and change the contents of the `<mule.version>` XML tag.

## Preparing a RAML File

The [`api.raml`](https://docs.mulesoft.com/apikit/3.x/apikit-basic-anatomy) file in `src/main/api` is initially empty. To populate the file, complete one of the following tasks:

- Edit the `api.raml` file to define your API.

- Use the provided [sample RAML file](https://docs.mulesoft.com/apikit/3.x/_attachments/sample_RAML.raml) as an example.

- If you have a RAML file defines your API:

  - Replace the contents of the default `api.raml` file with your description
    OR

  - Edit the `mule-config.xml` file to point to the file that contains your RAML description.

    In the `apikit:config` tag, the attribute `raml` specifies the file from which to acquire the API definition. Replace the default value, `api.raml`, with the path to the RAML file, as follows.

    ```xml
    <apikit:config name="apiConfig" raml="CUSTOM FILE NAME" consoleEnabled="true" consolePath="console" />
    ```

## Generating Backend Flows

You need to generate [backend flows](https://docs.mulesoft.com/apikit/3.x/apikit-basic-anatomy#backend-flows) for each resource-action pairing in the RAML you create.

1. From the command line, navigate to the newly-created folder that contains your project.

2. Run the following Maven command:

   ```text
   mvn org.mule.tools:apikit-maven-plugin:create
   ```

   From the information in `api.raml`, the plugin creates the backend flows.

## Importing the Project into Anypoint Studio

After creating the basic structure for a project, import the project into Anypoint Studio, and then enhance the backend flows to map RAML resources to actions.

1. In Studio, under the **File** menu, select **Import**.

2. In the Import wizard, expand the **Mule** folder, then select `Maven-based Mule project from pom.xml`.

   ![import maven](https://docs.mulesoft.com/apikit/3.x/_images/import-maven.png)

3. Complete the remaining steps in the wizard to identify the **name** and **location** of your project’s `pom.xml` on your local drive, then click **Finish** to import the project.

4. [Enhance backend flows](https://docs.mulesoft.com/apikit/3.x/apikit-using#backend-first-design-process).





# 使用Maven创建APIkit项目

您可以将APIkit组件添加到现有的maven项目，例如，您希望使用Maven命令使用RAML和APIkit进行现代化的旧项目。您需要在本地系统上安装[Apache Maven](http://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)。

建议您熟悉以下主题：

- mvn手册页或[mvn帮助页面](http://www.manpagez.com/man/1/mvn/)
- [使用Maven和Mule](https://docs.mulesoft.com/mule-runtime/3.8/using-maven-with-mule)

## Maven设置文件

您需要包含Mule存储库`settings.xml`的`.m2`目录中的Maven 文件。如果您没有`settings.xml`文件，请创建一个指向Mule存储库的文件。将以下内容添加到您的`settings.xml`文件中。

```xml
<settings>
    <pluginGroups>
        <pluginGroup>org.mule.tools</pluginGroup>
    </pluginGroups>
    <profiles>
        <profile>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <id>mule-repositories</id>
            <repositories>
                <repository>
                    <id>mulesoft-releases</id>
                    <name>MuleSoft Releases Repository</name>
                    <url>http://repository.mulesoft.org/releases/</url>
                </repository>
                <repository>
                    <id>mulesoft-snapshots</id>
                    <name>MuleSoft Snapshots Repository</name>
                    <url>http://repository.mulesoft.org/snapshots/</url>
                </repository>
            </repositories>
            <pluginRepositories>
                <pluginRepository>
                    <id>mulesoft-releases</id>
                    <name>MuleSoft Releases</name>
                    <url>http://repository.mulesoft.org/releases/</url>
                </pluginRepository>
                <pluginRepository>
                    <id>mulesoft-snapshots</id>
                    <name>MuleSoft Snapshots</name>
                    <url>http://repository.mulesoft.org/snapshots/</url>
                </pluginRepository>
            </pluginRepositories>
        </profile>
    </profiles>

</settings>
```

## Maven Archetype命令

您可以使用该`mvn archetype`命令为项目创建[APIkit部件](https://docs.mulesoft.com/apikit/3.x/apikit-basic-anatomy)。Maven在称为*原型*的模板中存储用于构建项目和相关设置的指令*。*APIkit提供了专门针对创建APIkit项目需求的Maven原型。它托管在Mule的公共存储库中，因此您无需下载它; 您可以在Maven命令中简单地引用其虚拟地址。

该`mvn archetype`命令创建一个新项目，目录结构和一个空`api.raml`文件。该命令设置所需的依赖项。

### mvn原型参数

该`mvn archetype`参数定义在哪里可以找到原型。

| 参数                  | 值                                        |
| --------------------- | ----------------------------------------- |
| `archetypeGroupId`    | `org.mule.tools`                          |
| `archetypeArtifactId` | `apikit-archetype`                        |
| `archetypeVersion`    | `3.8.3`                                   |
| `archetypeRepository` | `http://repository.mulesoft.org/releases` |

原型版本是APIKit项目原型和用于生成的工件的APIKit版本。

您可以`mvn archetype`使用特定于项目的值在命令中包含以下参数。

| 参数         | 描述                          |
| ------------ | ----------------------------- |
| `groupId`    | 项目的标准Maven组ID。         |
| `artifactId` | 文件名Maven将提供给您的项目。 |
| `package`    | 消息处理器所在的Java包。      |
| `version`    | 新项目的版本。                |

如果您不包含这些参数，Maven会在执行时提示您输入值。

## 生成一个新项目

要在Studio中生成新项目：

1. 在终端中，导航到要创建项目的目录，然后从Anypoint Studio工作区文件夹中运行以下Maven生成命令`C:\Users\Aaron\workspace`。

   ```
   mvn archetype：generate -DarchetypeGroupId = org.mule.tools -DarchetypeArtifactId = apikit-archetype -DarchetypeVersion = 3.8.3 -DarchetypeRepository = http：//repository.mulesoft.org/releases -DgroupId = org.mule.tools -DartifactId = APIKit -project -Dpackage = package-name -Dversion = 1.0
   ```

   Maven将项目文件存储在Studio工作区中。

2. Maven会提示您确保上面列出的参数正确无误。类型**Y**，然后按**输入**键确认。

   Maven在指定目录中生成一个新项目，其中包含可用的最新Mule运行时。要使用较早的运行时，请打开pom.xml文件并更改`<mule.version>`XML标记的内容。

## 准备RAML文件

该[`api.raml`](https://docs.mulesoft.com/apikit/3.x/apikit-basic-anatomy)文件`src/main/api`最初是空的。要填充文件，请完成以下任务之一：

- 编辑`api.raml`文件以定义API。

- 使用提供的[示例RAML文件](https://docs.mulesoft.com/apikit/3.x/_attachments/sample_RAML.raml)作为示例。

- 如果您有一个RAML文件定义您的API：

  - `api.raml`用您的描述
    OR 替换默认文件的内容

  - 编辑`mule-config.xml`文件以指向包含RAML描述的文件。

    在`apikit:config`标记中，该属性`raml`指定从中获取API定义的文件。将默认值替换为`api.raml`RAML文件的路径，如下所示。

    ```xml
    <apikit:config name="apiConfig" raml="CUSTOM FILE NAME" consoleEnabled="true" consolePath="console" />
    ```

## 生成后端流

您需要为您创建的RAML中的每个资源 - 操作配对生成[后端流](https://docs.mulesoft.com/apikit/3.x/apikit-basic-anatomy#backend-flows)。

1. 从命令行，导航到包含项目的新创建的文件夹。

2. 运行以下Maven命令：

   ```text
   mvn org.mule.tools:apikit-maven-plugin:create
   ```

   根据信息`api.raml`，插件创建后端流。

## 将项目导入Anypoint Studio

在为项目创建基本结构之后，将项目导入Anypoint Studio，然后增强后端流以将RAML资源映射到操作。

1. 在Studio中，在“ **文件”**菜单下，选择“ **导入”**。

2. 在导入向导中，展开**Mule**文件夹，然后选择`Maven-based Mule project from pom.xml`。

   ![进口maven](https://docs.mulesoft.com/apikit/3.x/_images/import-maven.png)

3. 完成向导中的其余步骤以确定项目在本地驱动器上的**名称**和**位置**`pom.xml`，然后单击“ **完成”**以导入项目。

4. [增强后端流量](https://docs.mulesoft.com/apikit/3.x/apikit-using#backend-first-design-process)。