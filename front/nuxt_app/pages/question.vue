<<template>
  <v-app>
    <v-content class="bg">
      <div class="d-flex justify-center mx-3">
        <v-card class="mt-12" width="95%">
          <v-card-title class="d-flex justify-center pt-10">{{questions}}</v-card-title>
          <div class="mx-7 mb-8">
            <v-progress-linear
              color="light-blue"
              height="20"
              rounded
              striped
            ></v-progress-linear>
          </div>

           <div class="d-flex justify-center">
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
                to="/answer"
                nuxt
              >choise</v-btn>   
            </div>

             <div class="d-flex justify-center">
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
                to="/answer"
                nuxt
              >choise</v-btn>   
            </div>

             <div class="d-flex justify-center">
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
                to="/answer"
                nuxt
              >choise</v-btn>   
            </div>

             <div class="d-flex justify-center">
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
                v-on:click="sendData();"
              >choise</v-btn>   
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
      choices: [1, 2, 3, 4]
    };
  },
  computed: {
    questions(){
      let questions = this.$store.state.questions;
      console.log(questions)
    }
  },
  methods: {
    sendData() {
      axios
        .post(`http://localhost:8080/answers`, {
          choices: this.choices
        })
        .then(response => {
          console.log(response.data);
        });
    }
  },
  async mounted() {
    this.$store.dispatch("fetchQuestion");
  }
};
</script>