<template>
  <v-container>
    <p>教材投稿</p>
    <v-form>
      <v-container>
        <v-row>
          <v-col cols="8">
            <v-text-field v-model="newItem.title" label="教材名" required />
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="8">
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
import createItem from '~/apollo/mutations/createItem'

export default {
  data () {
    return {
      newItem: {
        title: '',
        url: ''
      }
    }
  },
  methods: {
    async createItem (Item) {
      try {
        await this.$apollo.mutate({
          mutation: createItem,
          variables: {
            title: Item.title,
            url: Item.url,
            categoryId: this.$route.params.category
          }
        })
        this.$toast.info('教材が追加されました。')
        this.$router.go(-1)
      } catch (e) {
        window.console.log(e)
      }
    }
  }
}
</script>
