<template>
    <v-row no-gutters>
      <v-col>
        <v-card>
          <v-img contain max-width="400" src="/images/codi_trophy.png"/>
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
.codi-logo {
  height: 180px;
}
</style>
