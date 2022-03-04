# slim-demo-container
Slim.AI Tutorial Container - Nuxt-Based

## Project Goal
Create a demo container that can serve as a tutorial for minification. Should be a relatively common Nuxt pattern that is easy and instructive for users. 

Key elements: 
- "Teaching moments" to show users the how and why of minification
- Guarantee specific outcomes (i.e., working container)
- Celebrate user minification success
- Provide users with starting point for future minification needs
- Use Container Best Practices in Dockerfile, etc

## To Do's 
1. Get markdown files rendering in the app
2. Improve Dockerfile for best practices
3. Test minification 
4. Iterate 

## Current app
```
-/ 
|- app 
|-- assets
|--- docs //home of Slim How To .md files 
|-- components
|--- CodiChamp.vue // new home screen
|--- MarkdownReader // TODO: component for markdown rendering
|-- pages 
|-- static
|--- images // we add images here that DockerSlim would remove
Dockerfile 
README.md //this file
```

Nuxt configuartion:
- Vuetify
- Axios
- SSR
- NightwatchJS Testing
- GitHub Actions
 
 