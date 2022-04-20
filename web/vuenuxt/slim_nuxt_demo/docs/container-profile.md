# Container Profiles

With Slim.AI, you can get detailed analysis of both public and private container images using our suite of container development tools.

To get started with profiles, just find a container image you want to inspect either through searching public registries or choosing an image from a [**connected registry**](https://www.slim.ai/docs/connectors.html).

Doing so will bring you to the Container Profile screen.

## Profile

Before deep diving into your container internals, you'll find a profile screen that lists basic metadata about the repository, available versions of that container image (i.e., `latest` and `stable`), and lists any documentation found in the image repo.

### Available Versions

![](app/static/blog//docs_container_diff_avail_versions.png)

The available versions screen provides you with information and options for each tag in an image repository. As a reminder, an image tag is synonymous with a "version tag" and notes, most commonly, an updated or alternate version of the image.

**View Version -** This option scans the image and brings you to the Version Detail page. Generally, clicking anywhere on the row/card will bring you to this view.

**Add to Favorites -** This will add the image version to your [**Favorites**](./favorites.md) collection.

**Compare Versions -** This option allows you to choose two versions of the same image and compare them using our [**Diff**](https://www.slim.ai/docs/container-diff.html) feature. If available, you may find the Alpine Linux version or any maintainer supported “slim” versions that have already been optimized by the maintainers. These images may be more appropriate to your use case, but keep in mind that starting with a bare-bones image may cause headaches later in development.

## Detail Screen

Choosing to view a version of the image will run the Slim scanning tools on that image. This process may take a short time as we build and assess the container image.

![](app/static/blog//docs_profiles_scanning.png)

Results from the scan are found on the container image detail screen.

### File System

The File System view provides a file-level view of the container in a clean and familiar UI. Files can be viewed in a Tree or Flat structure, and various filters are provided to understand when and where files are added, deleted, or modified during the build process.

In the Explorer tab, you’ll be able to see exactly how an image builds a container.

Understanding container construction is the single most important step for following container best practices. Optimizing this construction leads to smaller containers with shorter build times, with has long-term benefits for any developer workflow.

Containers have three main elements: **Layers**, **Files**, and **Instructions**. These three elements interact during the build process and ultimately determine what exists inside the final container. Generally, the more layers, files, and instructions your build process containers, the larger, slower, and less secure your resulting container will be.

[For more on Layers, Files, and Instructions, check out this video on the DockerSlim X-ray feature.](https://community.slim.ai/t/analyze-the-structure-of-a-docker-container-with-dockerslim-xray-report/22)

### Overview

In the Overview section, you find more advanced metadata about the image—including when it was last updated, which user it runs as, and what the Base OS is—along with variables and configurations that represent the image's **attack surface**.

Here, you can find the metadata relating to the image, including pull commands, OS version, recent updates, entrypoints, executables, and image size.

**Other Versions -** Similar to the version list on the Profile page, this list allows you to compare over versions of the image, and use the Diff tool to see file-level differences between versions.

**Shells -** A common pain point in container development is knowing which shell (or shells) are available in your container. This section lists available shells along with their versions and paths for easy interaction. You can also click the **Diff** icon to diff the currently viewed version with the version listed in that row.

**Files with Special Permissions -** Nefarious attacks often exploit file permissions to gain access to container files or processes. This section shows which files are granted special permissions and may present security concerns.

**Certs -** This information shows whether a container has any security certs installed and where those keys live. 

**Environmental Variables -** A common mistake among newer container devs is to store sensitive information in a container's environment variables. Knowing what environmental defaults are set in variables is also useful in debugging.

**Volumes -** If the container relies on a persistent storage volume — this is common in many Data Storage containers like PostgreSQL or MongoDB — you will see them listed in this section. This is a good indication as to whether the container will persist data upon rebuild or whether it will be erased. Knowing the path to the volume is useful for direct access.

Next, we’ll take a deeper look at the container by clicking the Explorer tab.

### **File Explorer**

In the Explorer tab, you can see the order in which files are created when building a container from the image. Expanding one of the layer nodes gives you a view of the files generated during the build of that image. Files can be filtered by Layer or Type.

Knowing which files are created in each layer gives you a basic understanding of how efficiently the image is built. Efficient containers will usually have their operating systems and core libraries installed in the early stages, with application code, which is more likely to change, coming in later stages.

Clicking a file will open metadata about that file. For text files, you can also click the **File Contents** tab to see the plain text contents of any file in your container.

![](app/static/blog//qs_explorer_filecontentstab_lg.png)

### **Layers**

Layers are listed in pills across the top of the tab, allowing you to quickly see large image layers and the order in which files and instructions are created in the image.

### **Instruction**

![](app/static/blog//fileexplorer-instructions.png)

Instruction panel provides a view of the container build process that shows which instructions in the Dockerfile created which layers and files. This is useful for understanding which commands created which layers when debugging a Dockerfile.

The panel also containers the container startup files (often entrypoints or commands for the container) that indicate what executes when the container is started. These are useful for knowing how to interact with the container.

### **Dockerfile**

As a final step, the Slim Developer Platform will provide you with a generated Dockerfile. This generated Dockerfile is provided to for context only. In most cases, it cannot be used to create a valid profile image. It can, however, help you better understand how the image is constructed by showing various INSTRUCTIONS that determine how layers are created.

![](app/static/blog//dockerfile_view.png)