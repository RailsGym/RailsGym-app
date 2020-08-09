<template>
  <v-container>
    <h2 class="page-title">
      レビュー編集
    </h2>
    <nuxt-link
      :to="`/categories/${this.$route.params.category}/items/${review.item.id}`">
      教材へ戻る
    </nuxt-link>
    <v-form>
      <v-container class="mt-10">
        <Errors :errors="errors" />
        <v-row>
          <v-col cols="12">
            <v-textarea v-model="review.content" label="レビュー内容" required />
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-btn @click="updateReview">
              更新
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-container>
</template>

<script>
import review from '~/apollo/queries/review'
import Errors from '@/components/shared/Errors'
import updateReview from '~/apollo/mutations/updateReview'

export default {
  middleware: 'auth',
  components: {
    Errors
  },
  data () {
    return {
      review: {
        content: '',
        item: {
          id: null
        }
      },
      errors: []
    }
  },
  async created () {
    await this.fetchReview()
  },
  methods: {
    async fetchReview () {
      try {
        const res = await this.$apollo.query({
          query: review,
          variables: {
            id: this.$route.params.review
          }
        })
        this.review = res.data.review
      } catch (e) {
        console.log(e)
      }
    },
    async updateReview () {
      try {
        const res = await this.$apollo.mutate({
          mutation: updateReview,
          variables: {
            content: this.review.content,
            id: this.$route.params.review
          }
        })
        if (res.data.updateReview.errors.length !== 0) {
          this.errors = res.data.updateReview.errors
        } else {
          this.$toast.info('レビューが編集されました。')
          this.$router.push({
            name: 'categories-category-items-id',
            params: {
              category: this.$route.params.category,
              id: this.review.item.id
            }
          })
        }
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
