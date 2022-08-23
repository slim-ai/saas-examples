<template>
  <v-layout>
    <v-row class="justify-center">
      <v-card width="500" elevation="12">
        <v-row class="justify-center">
          <div class="text-h2 grey--text mt-4">Todo</div>
        </v-row>
        <v-row>
          <v-col cols="1">
            <v-tooltip bottom>
              <template v-slot:activator="{ on }">
                <v-checkbox class="ml-5" v-on="on" v-model="complete"></v-checkbox>
              </template>
              <p>Check todo item as complete</p>
            </v-tooltip>
          </v-col>
          <v-col cols="11">
            <v-text-field
              class="ml-5 mr-5"
              v-model="todoText"
              label="What needs to be done?"
              @change="todoTextChanged"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-list>
          <v-list-item v-for="item in items" :key="item._id">
            <v-list-item-action>
              <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                  <v-checkbox
                    class="ml-5"
                    v-on="on"
                    v-model="item.complete"
                    @click="updateTodo(item)"
                  ></v-checkbox>
                </template>
                <span>Check todo item as complete</span>
              </v-tooltip>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title v-text="item.todotext"></v-list-item-title>
            </v-list-item-content>
            <v-list-item-icon>
              <v-icon @click="deleteTodo(item)" color="grey">mdi-delete</v-icon>
            </v-list-item-icon>
          </v-list-item>
        </v-list>
      </v-card>
    </v-row>
  </v-layout>
</template>

<script>
export default {



  data: () => ({
    todoText: '',
    complete: false,
    items: [],
    apiUrlBase:  (process.browser)
                   ? (location.origin.split(":")[1] === "//localhost")
                       ? 'http://localhost:9000/api'
                       : location.origin.split(":")[0]+":"+location.origin.split(":")[1]+"/api"
                   : 'http://localhost:9000/api' ,
  }),
  mounted() {
    this.getTodoList()
  },
  methods: {
    todoTextChanged() {
      if (this.todoText !== '') {
        const todoText = this.todoText
        const complete = this.complete
        this.complete = false
        this.todoText = ''
        this.createTodo(todoText, complete)
      }
    },
    async updateTodo(item) {
      console.log('updateTodo')
      const url = this.apiUrlBase + '/' + item._id
      try {
        const result = await this.$axios.$put(url, item)
        console.log(result)
        this.getTodoList()
      } catch (err) {
        console.log(err)
      }
    },
    async deleteTodo(item) {
      console.log('deleteTodo')
      const url = this.apiUrlBase + '/' + item._id
      try {
        const result = await this.$axios.$delete(url)
        console.log(result)
        this.getTodoList()
      } catch (err) {
        console.log(err)
      }
    },
    async createTodo(todoText, complete) {
      console.log('changed')
      const reqParams = {
        todotext: todoText,
        complete: complete,
      }
      const url = this.apiUrlBase + '/'
      try {
        const result = await this.$axios.$post(url, reqParams)
        console.log(result)
        this.getTodoList()
      } catch (err) {
        console.log(err)
      }
    },
    formatJSON(obj) {
      return JSON.stringify(obj, null, 2)
    },
    async getTodoList() {
      console.log('getTodoList')
      console.log("base url",this.apiUrlBase)
      const url = this.apiUrlBase + '/'
      try {
        const result = await this.$axios.$get(url)
        console.log(result)
        this.items = result
      } catch (err) {
        console.log(err)
      }
    },
  },
}
</script>
