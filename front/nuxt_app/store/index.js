const axios = require('axios');
// questionsというstateを定義
// answerというstateを定義
export const state = () => {
    return {
        questions: [],
        answer:[]
    }
}
export const mutations={
    // fetchQuestionによって得られたyaml内の質問と選択肢を、stateのquestionsに書き換える処理
    SET_QUESTION: function(state,question) {
        state.questions=question;
    },
    // fetchAnswerによって得られたおすすめカード情報を、stateのanswerに書き換える処理
    SET_ANSWER: function(state,answer) {
        state.answer=answer;
    }
}
// Railsと非同期の通信をして、yamlを受け取り、SET_QUESTIONをcommitして実際に書き換える。
export const actions = {
    // Railsと非同期通信を行い、question.ymlの中の質問と選択肢を取ってくる。
    // そのあと、SET_QUESTIONをcommitし、storeの状態を変化させる。
    async fetchQuestion(context) {
        const url = 'http://localhost:8080/questions'
        const result = await axios.get(url);
        context.commit("SET_QUESTION", result.data)
    },
    // question.vueの中のsendDataメソットで取得したおすすめのカード情報である
    // resultを引数に取り、SET_ANSWERにresultを渡す。
    // SET_ANSWERをコミットして、storeの状態を変化させる。
    async fetchAnswer(context,result) {
        context.commit("SET_ANSWER", result)
    }
}