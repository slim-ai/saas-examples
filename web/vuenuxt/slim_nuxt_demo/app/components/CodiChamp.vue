<template>
    <v-row no-gutters>
      <v-col>
        <v-card class="congrats-card">
          <v-img contain width="700" src="/images/minify_illustration.png"/>
        </v-card>
      </v-col>
    </v-row>
</template>
<script>
export default {
  name: 'CodiChamp',
  props: {
    msg: String
  },
  data () {
    return {
    }
  }
}
</script>

<style scoped>
.congrats-card {
 background:none;
 box-shadow:none !important;
}
</style>