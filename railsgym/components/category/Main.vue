<template>
  <div>
    <h1>
      技術から探す
    </h1>

    <v-row align-content="center">
      <v-col v-for="category in categories" :key="category.id" cols="4">
        <v-btn
          class="category-box"
          nuxt
          :to="{ name: 'categories-category-items', params: { category: category.id }}">
          {{ category.name }}
        </v-btn>
      </v-col>
    </v-row>
  </div>
</template>

<script>
import categories from '~/apollo/queries/categories'

export default {
  data () {
    return {
      categories: {}
    }
  },
  apollo: {
    categories: {
      query: categories
    }
  }
}
</script>
