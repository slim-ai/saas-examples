<template>
  <v-app dark>
    <v-navigation-drawer
      v-model="drawer"
      :mini-variant="miniVariant"
      :clipped="clipped"
      fixed
      app
    >
      <v-list>
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          :to="item.to"
          router
          exact
        >
          <v-list-item-action>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title v-text="item.title" />
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar
      :clipped-left="clipped"
      fixed
      app
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer" />
      <v-btn
        icon
        @click.stop="miniVariant = !miniVariant"
      >
        <v-icon>mdi-{{ `chevron-${miniVariant ? 'right' : 'left'}` }}</v-icon>
      </v-btn>
      <v-btn
        icon
        @click.stop="clipped = !clipped"
      >
        <v-icon>mdi-application</v-icon>
      </v-btn>
      <v-btn
        icon
        @click.stop="fixed = !fixed"
      >
        <v-icon>mdi-minus</v-icon>
      </v-btn>
      <v-toolbar-title v-text="title" />
      <v-spacer />
      <v-btn
        icon
        @click.stop="rightDrawer = !rightDrawer"
      >
        <v-icon>mdi-menu</v-icon>
      </v-btn>
    </v-app-bar>
    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>
    <v-navigation-drawer
      v-model="rightDrawer"
      :right="right"
      temporary
      fixed
    >
      <v-list>
        <v-list-item @click.native="right = !right">
          <v-list-item-action>
            <v-icon light>
              mdi-repeat
            </v-icon>
          </v-list-item-action>
          <v-list-item-title>Switch drawer (click me)</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-footer
      :absolute="!fixed"
      app
    >
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  name: 'DefaultLayout',
  data () {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: 'mdi-trophy-variant',
          title: 'Success',
          to: '/'
        },
        {
          title: 'SLIM.AI DOCS',
          to: ''
        },
        {
          icon: 'mdi-play',
          title: 'Getting Started',
          to: '/blog/quickstart'
        },
        
        {
          icon: 'mdi-school',
          title: 'Slimming 101',
          to: '/blog/slimming'
        },
        {
          icon: 'mdi-list-status',
          title: 'Optimization (Basic)',
          to: '/blog/container-optimization-basic'
        },
        {
          icon: 'mdi-application-braces-outline',
          title: 'Container Profiles',
          to: '/blog/container-profile'
        },
        {
          icon: 'mdi-vector-difference',
          title: 'Container Diff',
          to: '/blog/container-diff'
        },
        {
          icon: 'mdi-link-box-variant',
          title: 'Connectors',
          to: '/blog/connectors'
        },
        {
          icon: 'mdi-heart-plus',
          title: 'Favorites',
          to: '/blog/favorites'
        },
        {
          icon: 'mdi-pen',
          title: 'Testing',
          to: '/blog/quickstart'
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Slim.AI Demo Container'
    }
  }
}
</script>
