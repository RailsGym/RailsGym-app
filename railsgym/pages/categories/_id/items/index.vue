<template>
  <div>
    <p>教材一覧 {{ category.name }}</p>
    <v-col v-for="item in category.items" :key="item.id">
      <p>{{ item.title }}</p>
    </v-col>
  </div>
</template>

<script>
import category from '~/apollo/queries/category'

export default {
  data () {
    return {
      category: {}
    }
  },
  apollo: {
    category: {
      query: category
    }
  }
}
</script>
