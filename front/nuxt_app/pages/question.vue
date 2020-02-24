<<template>
  <v-app>
    <v-content class="bg">
      <div class="d-flex justify-center mx-3">
        <v-card class="mt-12" width="95%">
          <v-card-title class="d-flex justify-center pt-10">question_text</v-card-title>
          <div class="mx-7 mb-8">
            <v-progress-linear
              color="light-blue"
              height="20"
              v-bind:value="progress_percentage"
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
              >choise</v-btn>   
            </div>

             <div class="d-flex justify-center">
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
              >choise</v-btn>   
            </div>

             <div class="d-flex justify-center">
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
              >choise</v-btn>   
            </div>

             <div class="d-flex justify-center">
              <v-btn
                width="230"
                height="50"
                rounded
                class="cyan accent-2 mb-8"
              >choise</v-btn>   
            </div>
  
        </v-card>
      </div>
    </v-content>
  </v-app>
</template>

<script>
export default {};
</script>