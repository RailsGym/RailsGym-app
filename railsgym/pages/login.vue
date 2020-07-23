<template>
  <v-container>
    <h2 class="page-title">
      ログイン
    </h2>
    <v-form>
      <v-container class="mt-10">
        <v-row>
          <v-col cols="8">
            <Errors :errors="errors" />
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="8">
            <v-text-field v-model="email" label="メールアドレス" required />
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="8">
            <v-text-field v-model="password" type="password" label="パスワード" required />
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            <v-btn
              color="orange"
              dark
              @click="login()">
              ログイン
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-container>
</template>

<script>
import Errors from '@/components/shared/Errors'

export default {
  middleware ({ store, redirect }) {
    if (store.state.auth.loggedIn) {
      return redirect('/')
    }
  },
  components: {
    Errors
  },
  data () {
    return {
      email: '',
      password: '',
      errors: []
    }
  },
  methods: {
    async login () {
      try {
        await this.$auth.loginWith('local', {
          data: {
            auth: {
              email: this.email,
              password: this.password
            }
          }
        })
        await this.$apolloHelpers.onLogin(this.$auth.getToken('local').match(/^Bearer[ ]+([^ ]+)[ ]*$/i)[1])
        this.$toast.info('ログインしました')
        this.$router.push('/')
      } catch (e) {
        this.errors = ['メールアドレスまたはパスワードが正しくありません。']
        console.log(e)
      }
    }
  }
}
</script>
