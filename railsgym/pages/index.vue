<template>
  <v-container>
    <Introduction />
    <Technologies />
  </v-container>
</template>

<script>
import Introduction from '@/components/top/Introduction'
import Technologies from '@/components/technology/Main'

export default {
  components: {
    Introduction,
    Technologies
  }
}
</script>
