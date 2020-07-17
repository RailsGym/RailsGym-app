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
  async created () {
    await this.fetchCategory(this.$route.params.id)
  },
  methods: {
    async fetchCategory (categoryId) {
      try {
        const res = await this.$apollo.query({
          query: category,
          variables: {
            id: parseInt(categoryId, 10)
          }
        })
        this.category = res.data.category
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>
