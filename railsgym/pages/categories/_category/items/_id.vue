<template>
  <v-container>
    <h2 class="page-title">
      教材詳細
    </h2>
    <nuxt-link
      :to="`/categories/${this.$route.params.category}/items`">
      教材一覧へ戻る
    </nuxt-link>
    <h3 class="mt-7">
      投稿者：{{ user.username }}
    </h3>
    <h2 class="my-3">
      {{ item.title }}
    </h2>
    <p right>
      {{ ymdhms(item.createdAt) }}
    </p>
    <hr>
    <v-card v-for="review in reviews" :key="review.id">
      <v-btn
        color="success"
        :to="{ name: 'categories-category-items-review-edit', params: { category: $route.params.category, id: review.id }}">編集</v-btn>
      <v-btn
        color="red"
        dark>
        削除</v-btn>
      <p>{{ review.user.username }}</p>
      <p v-html="nl2br(review.content)" />
      <p>{{ ymdhms(review.createdAt) }}</p>
    </v-card>
    <div v-if="$auth.loggedIn" class="d-flex flex-row-reverse mt-6 mr-6">
      <v-btn
        :to="{ name: 'categories-category-items-review-new', params: { category: $route.params.category, id: item.id }}"
        color="success"
        nuxt
        dark>
        レビューする
        <v-icon dark right>
          mdi-plus
        </v-icon>
      </v-btn>
    </div>
  </v-container>
</template>

<script>
import item from '~/apollo/queries/item'

export default {
  data () {
    return {
      item: {},
      user: {},
      reviews: []
    }
  },
  async created () {
    await this.fetchItem()
  },
  methods: {
    async fetchItem () {
      try {
        const res = await this.$apollo.query({
          query: item,
          variables: {
            id: this.$route.params.id
          }
        })
        this.item = res.data.item
        this.user = res.data.item.user
        this.reviews = res.data.item.reviews
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>
