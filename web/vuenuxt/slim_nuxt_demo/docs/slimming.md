---
title: Container Slimming 101
summary: ''
date: 2021-06-21T00:00:00.000+00:00
bannerimage: ''
tags: []
videoUrl: https://www.youtube.com/embed/8nuh5-DRngI
sidebar: false

---
# Container Slimming 101

**The how, what, and why of making smaller, safer, more performant containers.**

If you're like many deveopers first getting into Docker, containers, and cloud-native architecture, you were really excited when you containerized you first app and got it working. Then you went to push it to a registry... and some annoyingly non-trivial amount of time later, the push process completed. "What took so long?" you ask, and you look at your images, only to find that your simple `Hello World` container weighs in at around 1GB. Oof.

As developers and DevOps pros have gotten more atuned to containers over the years, they find ways to optimize, rebuild, and harden those containers as they move to production. The process can be overly manual, but the core concepts of [**Container Best Practices**](https://www.slim.ai/blog/why-don’t-we-practice-container-best-practices.html) haven't changed.

This tutorial introduces the basic concepts of what we mean by **container slimming,** and teaches you how to approach slimming your own containers to make them lighter, faster, and more secure.

## What is Container Slimming?

**What it's not:** Container slimming is not the same as **compressing** containers. Compressing is done automatically via the container runtime, and is a process similar to zipping or creating a tarball of a file.

> Simply making the container smaller is one of the benefits of slimming, but not the core objective.

![](../../static/blog//slim_vs_compressed_final-1.png)

**What it is:** Container Slimming at the highest level can be thought of as "making your containerized application ready for production." It's an optimization process that can be done in one of many ways (or many of many ways) to achieve the following objectives:

1. Ensure only the files needed for production exist within the container
2. Reduce the attack surface of the container by removing unnecessary attack vectors in the container, such as shells, bad environment variables, or privileged files
3. Maintaining a repeatable process for transforming a `dev` container to a `prod` container, and tracking what's inside each container.

## Why Slim Your Containers?

### Dev vs. Prod

Containers are often used _like_ a local operating system or a virtual machine (VM). Developers work in containers while building and shipping apps, and expect certain tools, utilities, and libraries to be available when developing or debugging an application microservice. Developers often prefer larger, more fully featured container images like `ubuntu:latest` when developing apps.

But containers are _not_ local environments nor VMs. They are meant to be purpose-built for the service that's running inside them. Once an application is ready to ship and put inside a container, the package managers, dev tools, and non-critical libraries can all be removed. This is the realm of slimming.

### Reducing Attack Surface

Simply shipping your dev container into production leaves you open to multiple known exploits and even more unknown ones (i.e., Day 0 events). And a containers attack surface isn't just about vulnerabilities. There are tons of great container vulnerability scanners out there—Snyk, Grype, and Twistlock to name a few—but getting a long list of vulnerabilities won't make your application any safer. (And may even densensitize your org on critical vulnerabilities).

Attack surface is also the removal of access points to would-be attackers. This includes:

* Shells
* Environment Variables
* Open Ports
* Files with Special Permissions

There's no "one size fits all" approach to these items, so being aware of them and removing or closing what you can is critical to your application security.

### Speed Wins

Smaller containers are simply faster to get from place A to place B in your cloud infrastructure. While storage costs are fairly minimal ("storage is cheap these days" as our infra friends tell us), developer time is perhaps the most precious resource available to modern software organizations. Large containers take longer to push, pull, scan, verify, and inspect, and for dev teams working with dozens of containers at a time, those inefficiencies add up quickly.

## Container Slimming Techniques

Many solutions have arisen through the years for container slimming, all with varying levels of adoption and varying trade-offs developers and ops teams need to make to ensure a productive developer experience while reducing the risk of bloated, vulnerable containers being shipped to production.

### DockerSlim

Not surprisingly, our own open source project is our personal favorite here at Slim. DockerSlim, created by Slim co-founder Kyle "Q" Quest in 2016, seeks to automatically detect what's needed by the application in the container, and rebuilds a functionally equivalent "slim" version of that container to use in production. In doing so, it produces AppArmor and SecComp profiles along with a trove of additional metadata.

DockerSlim users praise it for its results—often creating containers that are 30x smaller and with very few vulnerabilities left inside—and that it can be automated in a CI pipeline. While DockerSlim works well for common web and API frameworks (the NodeJS family, Python, Rails), some more complex use cases (complex Java containers; data science containers) can require some tinkering.

[Try DockerSlim on your container project. ](https://github.com/docker-slim/docker-slim)

There are a number of other approaches to slimming containers. These are some of the most common alternatives out there today:

### Manual optimization

Container experts can simply use clever Dockerfiles or build containers by hand using the `FROM scratch` base image, hand-tuning each and every dependency in their container tightly. **Pros:** Lots of oversight and customization. DevOps pros become experts over their own infrastructure. **Cons:** Just about everything else: It's incredibly labor intensive to build and maintain. Updates are a pain. And doing this can create a culture of "tribal knowledge" in an organization, where a select few individuals are the only ones who know how to make changes to a container. Think "Brett" from [_The Phoenix Project_](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiouJbUy_f0AhUZjIkEHSyHBsQQFnoECBcQAQ&url=https%3A%2F%2Fitrevolution.com%2Fthe-phoenix-project%2F&usg=AOvVaw00F7udrOk06R6pW3ILBiiv).

### Alpine Base Images

The "quickest" way to slim a container is simply to use a base image built from the popular Alpine Linux project. Many of the popular images have an `:alpine` variant (or several) that can be used as base images. The downside of this approach is with the Alpine distro itself. Notoriously, it uses a different version of the C compiler (`musl`) than most developers are used to (`libc`), occasionally causing hard-to-debug, low-level errors. Its package manager (`apk`) is less familar than `apt` and the Alpine community is smaller than comparable Linux distros like Debian or Ubuntu.

### Multistage Builds

This process, developed and supported by the Docker Community, essentially creates two Docker images in a single Dockerfile. The first is often called the `builder` image and can server as a development container. It builds all the necessary packages, binaries, and file systems needed to create a successful container. The second set of instructions creates a new image `FROM scratch`—that is, an empty container shell— and copies only what's necessary from the `builder` image to that empty shell. In theory, you have a minimal container with nothing extra, and your build times are faster thanks to Docker's layer caching system. The challenge with this approach is often knowing what to copy into the new image: Copy too much, and you're carrying extra bloat and potential vulnerabilities; copy too little and you might miss core pieces of the operating system.

### Cloud-Native Buildpacks

While this concept goes back almost as far as Docker, a recent push from the CNCF and companies like Google, Heroku, and VMWare are breathing new energy into this approach. Cloud-Native Buildpacks (CNB for short) seek to understand the kind of application or microservice you want to containerize, and build an optimized, performant container around that application. There are multiple flavors of CNB builders and a strong community behind the project. However, like any automated technique, there's a bit of a learning curve to debugging builds, and highly specialized applications may not work "out of the box."

## How can I get started with container slimming?

Starting is easy. First, you can [get a free account on the Slim Developer Platform](https://portal.slim.dev/login?invitecode=invite.1ua3zgxhhokfmDbtOLJH8jD6ooR). However you are working with containers, our platform provides an easy web UI for discovering and finding containers.

Second, [join the Slim.AI Discord](https://discord.gg/uBttmfyYNB), where you'll find other container slimming enthusiasts of all experience levels. It's a safe and friendly place where you can ask questions, get advice, and share tips.