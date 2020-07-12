<template>
  <v-container>
    <div>
      <h1>
        教材一覧 {{ $route.params.id }}
      </h1>
    </div>
  </v-container>
</template>

<script>
import learningMaterials from '~/apollo/queries/learning_materials'

export default {
  data () {
    return {
      learningMaterials: {}
    }
  },
  apollo: {
    learningMaterials: {
      query: learningMaterials,
      technologyId: this.$route.params.id
    }
  }
}
</script>
