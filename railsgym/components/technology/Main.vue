<template>
  <div>
    <h1>
      技術から探す
    </h1>

    <v-row align-content="center">
      <v-col v-for="technology in technologies" :key="technology.id" cols="4">
        <v-btn class="technology-box" :href="'technologies/' + technology.id">
          {{ technology.name }}
        </v-btn>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import technologies from '~/apollo/queries/technologies'

export default {
  data () {
    return {
      technologies: {}
    }
  },
  apollo: {
    technologies: {
      query: technologies
    }
  }
}
</script>
