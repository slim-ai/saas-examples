# Favorites
Managing containers and containerized workflows is no easy job. The Slim Developer Platform’s Collections feature is designed to make it easier to share, store, and track container images and artifacts for individuals and teams.

Every account starts with the **Favorites** collection. This is a great place to store images you need to reference all the time, such as your app starter kits or your personal images. You can access your Favorites from the link the global navigation.

![](../../static/blog//1-favorites-global-nav.png)

## Creating a Collection

_Custom Collections are currently in development and only available to design partners. Email us at **partners@slim.ai** for more information._ 

## Adding Images to a Collection

You can add an image to your Favorites in one of three ways.

From the image profile page ([example](https://portal.slim.dev/home/profile/dockerhub%3A%2F%2Fdockerhub.public%2Flibrary%2Fnode%3Alatest)), you will see an entry point for a submenu at the end of the row for each available version. Expanding that menu presents you with the option to `Add to Favorites`. Doing so will add that specific version to your Favorites collection.

![screenshot of overview page with Add to Favorites button](../../static/blog//2-addtofavorites-overview.png)

If you’ve already scanned a specific image version, such as `latest` or `stable`, you will see an `+ Add to Favorites` button beneath the Pull Commands section. Simply click that button and wait for the success confirmation. This will add this specific version tag to your Favorites.

![screenshot of favorites scan page](../../static/blog//2-addtofavorites-scanpage.png)

Finally, if you’ve connected registries to the Slim Developer Platform, you can add images from those registries using the [Registry Explorer](https://portal.slim.dev/registriesexplorer) screen. Check the images you want to add and then click the `Add to Favorites` link in the title bar.

![](../../static/blog//3-registryexplorer-1.png)

## Adding additional artifacts

_Coming soon, add additional artifacts to collections, such as Docker Compose files, DockerSlim reports, and image manifests._

## Managing a Collection

Managing your favorites is easy. From the Favorites tab, you can see a list of containers in your Favorites collection. These containers are pinned to a specific version tag, including the `latest`.

You can quickly visit the profile page for that image, which lists available version tags and metadata. Selecting the image or “View version” from the side menu will scan the image and bring you to the image overview page.

Finally, you can remove an image version from a collection using the sub-menu in the corresponding image entry.

## Sharing a Collection

_Coming soon; this feature is still in development._

## Deleting a Collection

_You cannot delete the Favorites collection. You will be able to delete custom collections that you own once that functionality is available._

::: tip
## Feedback Request
Have thoughts on our features and roadmap? We want to hear 'em! [**Join our Discord channel**](https://discord.com/invite/uBttmfyYNB) and let us know what you'd like to see us build.
:::