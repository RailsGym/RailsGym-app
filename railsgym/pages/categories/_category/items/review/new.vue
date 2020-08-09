<template>
  <v-container>
    <h2 class="page-title">
      レビュー投稿
    </h2>
    <nuxt-link
      :to="`/categories/${this.$route.params.category}/items/${this.$route.params.id}`">
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
            <v-btn @click="createReview(review.content)">
              登録
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-container>
</template>

<script>
import Errors from '@/components/shared/Errors'
import item from '~/apollo/queries/item'
import createReview from '~/apollo/mutations/createReview'

export default {
  middleware: 'auth',
  components: {
    Errors
  },
  data () {
    return {
      review: {
        content: ''
      },
      errors: []
    }
  },
  methods: {
    async createReview (reviewContent) {
      try {
        const res = await this.$apollo.mutate({
          mutation: createReview,
          variables: {
            content: reviewContent,
            itemId: this.$route.params.id
          },
          refetchQueries: [{
            query: item,
            variables: {
              id: this.$route.params.id
            }
          }]
        })
        if (res.data.createReview.errors.length !== 0) {
          this.errors = res.data.createReview.errors
        } else {
          this.$toast.info('レビューが投稿されました。')
          this.$router.go(-1)
        }
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
