<template>
  <v-container>
    <h2 class="page-title">
      教材投稿
    </h2>
    <nuxt-link
      :to="`/categories/${this.$route.params.category}/items`">
      教材一覧へ戻る
    </nuxt-link>
    <v-form>
      <v-container class="mt-10">
        <Errors :errors="errors" />
        <v-row>
          <v-col cols="12">
            <v-text-field v-model="newItem.title" label="教材名" required />
          </v-col>
          <v-col cols="12">
            <v-text-field v-model="newItem.url" label="URL" required />
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-btn @click="createItem(newItem)">
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
import createItem from '~/apollo/mutations/createItem'

export default {
  middleware: 'auth',
  components: {
    Errors
  },
  data () {
    return {
      newItem: {
        title: '',
        url: ''
      },
      errors: []
    }
  },
  methods: {
    async createItem (Item) {
      try {
        const res = await this.$apollo.mutate({
          mutation: createItem,
          variables: {
            title: Item.title,
            url: Item.url,
            categoryId: this.$route.params.category
          }
        })
        if (res.data.createItem.errors) {
          this.errors = res.data.createItem.errors
        } else {
          this.$toast.info('教材が追加されました。')
          this.$router.go(-1)
        }
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
