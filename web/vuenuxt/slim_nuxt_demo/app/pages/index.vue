<template>
  <v-row class="congrats-row" :column="$vuetify.breakpoint.mdAndDown">
    <v-col cols="12" md="6">
      <v-card class="congrats-card congrats-headline">
        <v-card-title class="headline congrats-text-wrap">
          Congratulations on Slimming your first container!
        </v-card-title>
        <v-card-text>
          <p class="congrats-text">You reduced this container from <strong>1.3 GB</strong> to <strong>318 MB</strong>! That's amazing! Get access to Slim to start using your new container.</p>
          
        </v-card-text>
        <v-card-actions>
          <v-btn depressed class="congrats-btn"
            color="white"
            nuxt
            to="/blog/quickstart"
          >
            Get started with Slim &nbsp; &nbsp; &#9656;
          </v-btn>
        </v-card-actions>
        <v-card-text>
          <p class="learn-text">
            <a class="access-link"
              href="https://slim.ai/docs/quickstart.html"
              target="_blank"
              rel="noopener noreferrer"
            >
              Documentation
            </a>
        </p>
        <p class="learn-text">
            <a class="access-link"
              href="https://discord.gg/uBttmfyYNB"
              target="_blank"
              rel="noopener noreferrer"
              title="chat"
            >
              Discord
            </a>
        </p>
        <p class="learn-text">
            <a class="access-link"
              href=""
              target="_blank"
              rel="noopener noreferrer"
              title="contribute"
            >
              Report bug
            </a>
        </p>
          <a class="access-link learn-text"
            href="https://dockersl.im/"
            target="_blank"
            rel="noopener noreferrer"
          >
            DockerSlim Home
          </a>
          <span>&#183;</span>
          <a class="access-link learn-text"
            href="https://github.com/docker-slim"
            target="_blank"
            rel="noopener noreferrer"
          >
            DockerSlim GitHub
          </a>
        </v-card-text>
      </v-card>
    </v-col>

    <v-col cols="12" md="6">
      <v-card class="logo py-6 d-flex justify-center congrats-card">
      <CodiChamp/>
    </v-card>
    </v-col>
  </v-row>



</template>

<script>
export default {
  name: 'IndexPage',
  data () {
    return {
      name: 'Codi'
    }
  }
}
</script>

<style lang="scss">
@import url("https://cdn.jsdelivr.net/npm/@xz/fonts@1/serve/hk-grotesk.min.css");

.application {
  font-family: 'HK Grotesk', sans-serif;
}
</style>

<style scoped>
.congrats-headline {
  padding: 60px 0 60px 0;
  margin:0px auto;
  max-width: 80%;
  font-family: 'HK Grotesk', sans-serif;
}

.congrats-text {
  color:white;
  font-size:16px;
  font-weight:medium;
  font-family: 'HK Grotesk', sans-serif;
}

.congrats-text-wrap {
  word-break: break-word;
}

.congrats-card {
 background:none;
 box-shadow:none !important;
 background-color: #1F6BF1 !important;
}

.congrats-text-wrap{
  font-weight: bold;
  font-size: 2.0rem !important;
  line-height:2.6rem;
  font-family: 'HK Grotesk', sans-serif !important;
}

.access-card {
  text-align: left;
}

.access-link {
  color:white;
}

.learn-header {
  font-size:1.1rem;
}

.learn-text {
  font-size:.8rem;
}

.congrats-row {
  background: #1F6BF1 !important;
  position:absolute;
  height:100%;
  overflow:hidden;
}

.access-links {
  background:#121212;
  padding-top:80px;
}

.congrats-btn {
  color:#1F6BF1;
  background-color: white;
  margin-left:8px;
  font-weight:bold;
  text-transform: none;
  padding:30px 40px !important;
  font-size:1rem;
}



@media (min-width: 1264px)
.container {
    max-width: 100%;
}


</style>