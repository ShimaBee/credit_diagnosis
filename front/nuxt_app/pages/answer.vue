<template>
  <v-app>
    <section>
      <v-container>
        <div v-if="result == ''">
          <p class="d-flex justify-center title mt-5">もう一度<br>はじめから診断をお願いします。</p>
          <div class="sorry-image-wrapper d-flex justify-center">
              <img :src="require('../assets/images/error/sorry.png')" class="sorry-image" />
          </div>
        </div>
        
       <div 
         class="d-flex justify-center mx-3"
         v-for="(card,index) in result" v-bind:key="index"
         >
          <v-card class="mt-12" width="95%">
            <v-card-title class="d-flex justify-center pt-10">{{card.name}}</v-card-title>
            <div class="image-wrapper d-flex justify-center">
              <img :src="require(`../assets/images/cards/${card.image_path}`)" />
            </div>
            <div class="description-wrapper ma-5">
              <p>{{card.description}}</p><br>
              <a :href="`${card.public_site_url}`">公式サイト</a>
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
    // おすすめカードの表示
    result() {
      // storeからおすすめのカードのデータを取得
      const answer = this.$store.state.answer;
      return answer;
    }
  }
}
</script>

<style>
.sorry-image{
  padding: 20px;
  height: 50vh;
}

</style>