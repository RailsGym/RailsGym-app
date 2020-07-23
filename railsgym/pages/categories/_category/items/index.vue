<template>
  <v-container>
    <h2 class="page-title">
      「{{ category.name }}」 教材一覧
    </h2>
    <div v-if="$auth.loggedIn" class="d-flex flex-row-reverse mb-6">
      <v-btn
        :to="{ name: 'categories-category-items-new', params: { category: $route.params.category }}"
        color="orange"
        nuxt
        dark>
        投稿する
        <v-icon dark right>
          mdi-plus
        </v-icon>
      </v-btn>
    </div>
    <v-card
      v-for="item in category.items"
      :key="item.id"
      :to="{ name: 'categories-category-items-id', params: { category: $route.params.category, id: item.id }}"
      class="mt-6"
      outlined
      nuxt>
      <v-card-text>
        <div class="d-flex pb-4">
          <div>
            {{ item.user.username }}
          </div>
          <div class="ml-auto">
            {{ ymdhms(item.createdAt) }}
          </div>
        </div>
        <h3>{{ item.title }}</h3>
      </v-card-text>
    </v-card>
  </v-container>
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
    await this.fetchCategory(this.$route.params.category)
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
