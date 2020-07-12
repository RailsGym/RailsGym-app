<template>
  <v-app>
    <v-card
      color="grey lighten-4"
      flat
      tile
    >
      <v-toolbar dense class="primary" :dark="true">
        <v-app-bar-nav-icon />
        <v-toolbar-title>
          <router-link to="/" class="toolbar-title" v-text="title" />
        </v-toolbar-title>
        <v-spacer />
        <v-btn icon>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>

        <v-btn icon>
          <v-icon>mdi-heart</v-icon>
        </v-btn>

        <v-btn icon>
          <v-icon>mdi-dots-vertical</v-icon>
        </v-btn>
      </v-toolbar>
    </v-card>
    <v-content>
      <nuxt />
    </v-content>
    <v-footer center class="primary">
      <v-layout justify-center>
        <span class="text-white">&copy; RailsGym. All Rights Reserved.</span>
      </v-layout>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      title: 'RailsGym'
    }
  }
}
</script>
