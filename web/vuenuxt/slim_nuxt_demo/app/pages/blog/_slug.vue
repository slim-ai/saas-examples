<template>
    <nuxt-content :document="article" />
</template>
<script>
export default { 
    async asyncData({$content, params}) {
        const article = await $content('articles',params.slug).fetch()

        const slug = params.slug
        return { slug, article } 
    }
}
</script>
