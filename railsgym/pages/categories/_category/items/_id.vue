<template>
  <v-container>
    <h2 class="page-title">
      教材詳細
    </h2>
    <div>
    <nuxt-link
      :to="`/categories/${this.$route.params.category}/items`">
      教材一覧へ戻る
    </nuxt-link>
    <span v-if="$auth.loggedIn && !stocked" @click="createStock" class="group pa-2 teal stock-icon">
      <v-icon medium dark>folder_open</v-icon>
    </span>
    </div>
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
    <h3 class="mt-4 mb-4">
      レビュー一覧
    </h3>
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
        <p v-html="nl2br(review.content)" />
      </v-card-text>
      <div v-if="$auth.loggedIn && $auth.user.id == review.user.id" class="d-flex pb-4 pr-4">
        <div class="ml-auto">
          <v-btn
            color="success"
            :to="{ name: 'categories-category-items-review-edit', params: { category: $route.params.category, id: review.id }}">
            編集
          </v-btn>
          <v-btn
            color="red"
            dark>
            削除
          </v-btn>
        </div>
      </div>
    </v-card>
  </v-container>
</template>

<script>
import item from '~/apollo/queries/item'
import createStock from '~/apollo/mutations/createStock'
export default {
  data () {
    return {
      item: {},
      user: {},
      reviews: [],
      stocked: false
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
    async createStock () {
      try {
        const res = await this.$apollo.mutate({
          mutation: createStock,
          variables: {
            userId: this.$auth.user.id,
            itemId: this.$route.params.id
          }
        })
        if (res.data.createStock.errors.length !== 0) {
          this.errors = res.data.createStock.errors
        } else {
          this.$toast.info('ストックしました。')
          this.stocked = true
        }
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>
