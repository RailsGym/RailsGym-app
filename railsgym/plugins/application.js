import moment from 'moment'
import Vue from 'vue'

Vue.mixin({
  methods: {
    ymdhms (datetime) {
      return moment(datetime).format('YYYY/MM/DD HH:mm:ss')
    }
  }
})
