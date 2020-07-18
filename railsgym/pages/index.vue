<template>
  <v-container>
    <Introduction />
    <Categories />
  </v-container>
</template>

<script>
import Introduction from '@/components/top/Introduction'
import Categories from '@/components/category/Main'

export default {
  components: {
    Introduction,
    Categories
  }
}
</script>
