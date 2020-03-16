<template>
  <v-app>
    <v-content class="bg">
      <div class="d-flex justify-center mx-3">
        <v-card class="mt-12" width="95%">
          <v-card-title class="d-flex justify-center pt-10">{{questions_text[count]}}</v-card-title>
          <div class="mx-7 mb-8">
            <v-progress-linear
              color="light-blue"
              height="20"
              v-bind:value="progress_percentage"
              rounded
              striped
            ></v-progress-linear>
          </div>

             <div 
               class="d-flex justify-center"
               v-for="(choice,index) in question_choices[count]"
               :key="index"
             >
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
                v-on:click="switchQuestions(index,choice);sendData()"
              >{{choice}}</v-btn>   
            </div>
  
        </v-card>
      </div>
    </v-content>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      choices: [],
      count: 0,
      progress_percentage: 0
    };
  },
  computed: {
    // 問題文をstoreから取得する。
    questions_text() {
      const questions = this.$store.state.questions;
      const question_text = [];
      for (let i = 0; i < questions.length; i++) {
        question_text.push(questions[i].text);
      }
      return question_text;
    },
    // 選択肢をstoreから取得する。
    question_choices() {
      const questions = this.$store.state.questions;
      const question_choices = [];
      for (let i = 0; i < questions.length; i++) {
        question_choices.push(questions[i].choices);
      }
      return question_choices;
    }
  },
  methods: {
    // 問題の切り替え
    switchQuestions: function(index, choise) {
      const questions = this.$store.state.questions;
      // progress_linerの表示変更
      this.progress_percentage = ((this.count + 1) / questions.length) * 100;
      // ユーザの選択肢の保存
      this.choices.push(index);
      // countを上げて問題を切り替える
      this.count++;
    },
    sendData() {
      const questions = this.$store.state.questions;
      // 問題を全て回答したら、データを送る処理が行われる
      if (this.count == questions.length) {
      axios
        .post('http://localhost:8080/answers', {
          choices: this.choices
        })
        .then(response => {
          console.log(response.data);
          this.$store.dispatch("fetchAnswer",response.data);
          this.$router.push('answer')
        });
      }
    }
  },
  async mounted() {
    this.$store.dispatch("fetchQuestion");
  }
};
</script>