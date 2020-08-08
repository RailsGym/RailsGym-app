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
    </div>
    <h3 class="mt-7">
      投稿者：{{ item.user.username }}
    </h3>
    <div class="d-flex pb-4 pr-4">
      <h2 class="my-3">
        {{ item.title }}
      </h2>
      <div class="ml-auto">
        <span v-if="$auth.loggedIn && !stock.id" @click="createStock" class="group pa-2 blue stock-icon">
          <v-icon medium dark>folder_open</v-icon>
        </span>
        <span v-if="$auth.loggedIn && stock.id" @click="deleteStock" class="group pa-2 blue stock-icon">
          <v-icon medium dark>folder</v-icon>
        </span>
      </div>
    </div>
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
      v-for="review in item.reviews"
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
            :to="{ name: 'categories-category-items-review-review-edit', params: { category: $route.params.category, review: review.id }}">
            編集
          </v-btn>
          <v-btn
            @click="deleteReview(review)"
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
import stock from '~/apollo/queries/stock'
import createStock from '~/apollo/mutations/createStock'
import deleteStock from '~/apollo/mutations/deleteStock'
import deleteReview from '~/apollo/mutations/deleteReview'

export default {
  data () {
    return {
      item: {
        user: {},
        reviews: []
      },
      stock: { id: null }
    }
  },
  apollo: {
    item: {
      query: item,
      variables () {
        return { id: this.$route.params.id }
      }
    }
  },
  async created () {
    if (this.$auth.loggedIn) {
      await this.fetchStock()
    }
  },
  methods: {
    async fetchStock () {
      try {
        const res = await this.$apollo.query({
          query: stock,
          variables: {
            itemId: this.$route.params.id
          }
        })
        this.stock = res.data.stock
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
          this.stock = res.data.createStock.stock
        }
      } catch (e) {
        console.log(e)
      }
    },
    async deleteStock () {
      try {
        const res = await this.$apollo.mutate({
          mutation: deleteStock,
          variables: {
            id: this.stock.id
          }
        })
        if (res.data.deleteStock.errors.length !== 0) {
          this.errors = res.data.deleteStock.errors
        } else {
          this.$toast.info('ストックからはずしました。')
          this.stock = { id: null }
        }
      } catch (e) {
        console.log(e)
      }
    },
    async deleteReview (review) {
      if (!confirm('削除します。本当によろしいですか？')) {
        return
      }
      try {
        const res = await this.$apollo.mutate({
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
        if (res.data.deleteReview.errors.length !== 0) {
          this.$toast.error(res.data.deleteReview.errors)
        } else {
          this.$toast.info('レビューを削除しました。')
        }
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
