
const axios = require('axios');

// questionsというstateを定義
export const state = () => {
    return {
        questions: [],
        answer:[]
    }
}

// fetchQuestionによって得られたyaml内の質問と選択肢を、stateのquestionsに入れる処理
export const mutations={
    SET_QUESTION: function(state,question) {
        state.questions=question;
    },
    SET_ANSWER: function(state,answer) {
        state.answer=answer;
    }
}

// Railsと非同期の通信をして、yamlを受け取り、SET_QUESTIONをcommitして実際に書き換える。
export const actions = {
    async fetchQuestion(context) {
        const url = 'http://localhost:8080/questions'
        const result = await axios.get(url);
        context.commit("SET_QUESTION", result.data)
    },
    async fetchAnswer(context,result) {
        context.commit("SET_ANSWER", result)
    }
}