<template>
  <v-app>
    <section>
      <v-container>
       <div 
         class="d-flex justify-center mx-3"
         v-for="(card,index) in result" v-bind:key="index"
         >
          <v-card class="mt-12" width="95%">
            <v-card-title class="d-flex justify-center pt-10">{{card.name}}</v-card-title>
            <div class="image-wrapper d-flex justify-center">
              <!-- <img :src="require(`../assets/images/cards/${card.image_path}`)" alt class /> -->
            </div>
            <div class="description-wrapper ma-5">
              <p>{{card.description}}</p>
            </div>
          </v-card>
        </div>


        <div class="mt-5 d-flex justify-center">
          <v-btn
            width="230"
            height="50"
            rounded
            class="cyan accent-2 mb-8 mt-12 title"
            to="/question"
            nuxt
          >再診断！</v-btn>
        </div>
      </v-container>
    </section>
  </v-app>
</template>

<script>
export default {
  computed: {
    result() {
      const answer = this.$store.state.answer;
      return answer;
    }
  }
}
</script>