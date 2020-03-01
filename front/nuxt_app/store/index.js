
const axios = require('axios');
export const state = () => {
    return {
        questions: []
    }
}

export const mutations={
    SET_QUESTION: function(state,question) {
        state.questions=question;
    }
}

export const actions = {
    async fetchQuestion(context) {
        const url = 'http://localhost:8080/questions'
        const result = await axios.get(url);
        context.commit("SET_QUESTION", result.data)
    }
}