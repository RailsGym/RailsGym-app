<template>
  <v-container>
    <p>topページ</p>
  </v-container>
</template>

<script>
import tasks from '~/apollo/queries/tasks'
import createTask from '~/apollo/mutations/createTask'
import deleteTask from '~/apollo/mutations/deleteTask'
import updateTask from '~/apollo/mutations/updateTask'

export default {
  data () {
    return {
      tasks: {},
      newTask: {
        title: '',
        description: ''
      }
    }
  },
  methods: {
    async createTask (task) {
      try {
        await this.$apollo.mutate({
          mutation: createTask,
          variables: {
            id: task.id,
            title: task.title,
            description: task.description
          },
          refetchQueries: [{
            query: tasks
          }]
        })
        this.newTask = { title: '', description: '' }
      } catch (e) {
        window.console.log(e)
      }
    },
    async deleteTask (task) {
      try {
        await this.$apollo.mutate({
          mutation: deleteTask,
          variables: {
            id: task.id
          },
          refetchQueries: [{
            query: tasks
          }]
        })
      } catch (e) {
        window.console.log(e)
      }
    },
    async updateTask (task) {
      try {
        await this.$apollo.mutate({
          mutation: updateTask,
          variables: {
            id: task.id,
            completed: !task.completed
          },
          refetchQueries: [{
            query: tasks
          }]
        })
      } catch (e) {
        window.console.log(e)
      }
    }
  },
  apollo: {
    tasks: {
      query: tasks
    }
  }
}
</script>
