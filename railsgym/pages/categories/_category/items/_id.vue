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
    <h3 class="mt-4 mb-4">レビュー一覧</h3>
    <v-card
      v-for="review in reviews"
      :key="review.id"
      class="mb-4"
      outlined>
      <v-card-text>
        <div class="d-flex pb-4">
          <div>
            {{ review.user.username }}
          </div>
          <div class="ml-auto">
            {{ ymdhms(review.createdAt) }}
          </div>
        </div>
        <p v-html="nl2br(review.content)"/>
      </v-card-text>
      <div class="d-flex pb-4 pr-4">
        <div class="ml-auto">
          <v-btn
            color="success"
            :to="{ name: 'categories-category-items-review-edit', params: { category: $route.params.category, id: review.id }}">編集</v-btn>
          <v-btn
            @click="deleteReview(review)"
            color="red"
            dark>
            削除</v-btn>
        </div>
      </div>
    </v-card>
  </v-container>
</template>

<script>
import item from '~/apollo/queries/item'
import deleteReview from '~/apollo/mutations/deleteReview'

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
    },
    async deleteReview (review) {
      if (!confirm('削除します。本当によろしいですか？')) {
        return
      }
      try {
        await this.$apollo.mutate({
          mutation: deleteReview,
          variables: {
            id: review.id
          },
          refetchQueries: [{
            query: item,
            variables: {
              id: this.$route.params.id
            }
          }]
        })
        this.fetchItem()
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
