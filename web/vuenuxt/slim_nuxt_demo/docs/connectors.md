# Connectors

**Analyzing and optimizing your own images**

Understanding your public containers is great at the start of a project or when you are upgrading from one base image to another, but most developers want to understand and optimize their own images. On the Slim Developer Platform, you can do this using **Connectors**. 

## What are connectors? 
Connectors create a **secure** link between external container registries (public or private) and the Slim platform. Currently, connectors are available to: **DockerHub**, **Amazon Web Services Elastic Container Registry** (AWS ECR), **Google Container Registry** (GCR), and **RedHat Quay**. More connections are planned in future releases. 

::: tip
Looking to connect to a specific platform? [Let us know.](https://portal.feedback.us.pendo.io/app/#/user/dashboard?currentProductId=509bf0db-892d-4cf6-a747-aad9cce6b8d9)
::: 

## How do connectors work? 

Connectors create a secure connection between the Slim platform and an external registry in one of several ways depending on the platform you are connecting to. Often, it is in the form of a secure API token generated via the registry's UI or command-line interface and then uploaded to 

## Creating a connector 

To create a connection to your own repository, click on the `Connectors` tab in the global navigation of the Slim portal. 

Instructions for how to connect to a specific registry are provided on the registry connection pages. For ease of use, we recommend provided a specific name for each connection/registry (i.e., `Codi's Private AWS Account`). 

Once the connection is successfully established, you'll find images from your connected registeries in the `Connected Registies` tab on the product homepage. 

![product homepage - connected registries tab selected](../../static/blog//docs_connected_registries_homepage.png)

## Finding images from connected registries 
Once connected and authenticated, images will appear in two places in the Slim Developer Platform. 

### Browse
On the `Connected Registries` tab on the product homepage, existing connections will be grouped by platform and listed in a tree structure. Each connection can list multiple image repositories, and each image can have one or many version tags.

```bash
Platform 
|- Connector Name 
|-- Image Repository
|--- Image Version
```

Clicking the down arrown (:arrow_down_small:) will open a parent folder exposing the layer beneath. For example, expanding an Image Repository will show all Image Versions in that Image Repository. 


### Search 
Images from connected registries will also appear if relevant to a search query. For instance, if you have an Image Repository with the keyword term `python` in it, performing a search on `python` will return that image repository. 

![search UI highlighting private library images](../../static/blog//docs_connectors_search.png)

<figcaption>Example of search results returning images from both public and connected registries.</figcaption>

Images from Connected Registries show up at the top of search results, highlighted in <span style="color:red">red</span>. 

Clicking on an image version while browsing or in search results will bring you to the [Container Profile](./container-profile.md) page for that image.  

## Analyzing and Diffing Container Images from Connected Registries 

# Removing a Connection
You can permanently remove an existing connection simply by navigating to the Connectors tab in the global navigation and clicking the `Trash` icon for the Connector you'd like to remove. We permanatently remove the connector and all related metadata, including API keys.


# Can I push images to my registry? 

Currently, you can only pull (read) data from your connected registries. Push (write) functionality is on our roadmap for the future. 

