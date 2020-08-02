<template>
  <v-container>
    <h2 class="page-title">
      教材編集
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
            <v-text-field v-model="item.title" label="教材名" required />
          </v-col>
          <v-col cols="12">
            <v-text-field v-model="item.url" label="URL" required />
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-btn @click="updateItem(item)">
              更新
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-container>
</template>

<script>
import Errors from '@/components/shared/Errors'
import updateItem from '~/apollo/mutations/updateItem'
import item from '~/apollo/queries/item'

export default {
  middleware: 'auth',
  components: {
    Errors
  },
  data () {
    return {
      item: {
        title: '',
        url: ''
      },
      errors: []
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
            id: this.$route.params.item
          }
        })
        this.item = res.data.item
        this.user = res.data.item.user
        this.reviews = res.data.item.reviews
      } catch (e) {
        console.log(e)
      }
    },
    async updateItem (item) {
      try {
        const res = await this.$apollo.mutate({
          mutation: updateItem,
          variables: {
            id: this.$route.params.item,
            title: item.title,
            url: item.url
          }
        })
        if (res.data.updateItem.errors.length !== 0) {
          this.errors = res.data.updateItem.errors
        } else {
          console.log('ok■■■■■■')
          this.$toast.info('教材が編集されました。')
          this.$router.go(-1)
        }
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
