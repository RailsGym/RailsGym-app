<template>
  <v-app>
    <v-card
      color="grey lighten-4"
      flat
      tile
    >
      <v-toolbar dense>
        <v-app-bar-nav-icon />
        <v-toolbar-title v-text="title" />
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
    <v-footer center>
      <v-layout justify-center>
        <span>&copy; RailsGym. All Rights Reserved.</span>
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
