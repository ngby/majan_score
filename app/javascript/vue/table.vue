<template>
  <div class="table">
    <h2>試合結果一覧</h2>
    <div class="selectdiv">
      <select v-model="month">
        <option v-for="m in months"
          v-bind:value="m.name" 
          v-bind:key="m.id">
          {{ m.name }}月
        </option>
      </select>
    </div>
    <table>
      <tbody>
        <tr>
          <th>1位</th>
          <th>得点</th>
          <th>2位</th>
          <th>得点</th>
          <th>3位</th>
          <th>得点</th>
          <th>4位</th>
          <th>得点</th>
        </tr>
        <tr v-for="e in renderingScores" :key="e.id">
          <td>{{ e.first_user }}</td>
          <td>{{ e.first_score }}</td>
          <td>{{ e.second_user }}</td>
          <td>{{ e.second_score }}</td>
          <td>{{ e.third_user }}</td>
          <td>{{ e.third_score }}</td>
          <td>{{ e.fourth_user }}</td>
          <td>{{ e.fourth_score }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
import axios from 'axios';



export default {
  data: function () {
    return {
      newest_timestamp: '',
      year:'',
      month:'',
      date:'',
      months :[
        { id: 1, name: 1 }, 
        { id: 2, name: 2 },
        { id: 3, name: 3 },
        { id: 4, name: 4 },
        { id: 5, name: 5 },
        { id: 6, name: 6 },
        { id: 7, name: 7 },
        { id: 8, name: 8 },
        { id: 9, name: 9 },
        { id: 10, name: 10 },
        { id: 11, name: 11 },
        { id: 12, name: 12 },
      ],
      years:[],
      scores: [],
      renderingScores: []
    }
  },
  created: async function () {
    await this.getScores('/api/v1/scores.json')
    console.log(this.scores)
    var newest_data = this.scores.slice(-1)[0]
    console.log( newest_data )
    this.newest_timestamp = newest_data.created_at
    console.log("一番新しいタイムスタンプは" +this.newest_timestamp)
    
    var YMD = this.sliceTimestamp(this.newest_timestamp)
    this.setYMD(YMD)
    this.setRenderingScores()

  },
  mounted: function () {
    this.$nextTick(function() {
      this.setRenderingScores()
    })
  },
  beforeUpdate: function () {
    this.setRenderingScores()
  },
  methods: {
    sliceTimestamp: function(timestamp){
      //"yyyy-mm-ddT..."
      var y = timestamp.slice(0,4)
      var m = timestamp.slice(5,7)
      var d = timestamp.slice(8,10)
      console.log(y,m,d)
      return [y,m,d]
    },
    setYMD: function(YMD){
      this.year = YMD[0]
      this.month = YMD[1]
      this.date = YMD[2]
    },
    setRenderingScores: function(){
      //initialize
      this.renderingScores = []
      //Filtering data matching the selected time.
      this.scores.forEach(score => {
        var YMD = this.sliceTimestamp(score.created_at)

        console.log("setting")
        if(this.year == YMD[0] && this.month == YMD[1]){ // && this.date == YMD[2]
          this.renderingScores.push(score)
        }
      })
    },
    getScores: async function(url){
      await axios
        .get(url)
        .then(response => (this.scores = response.data));
    },
    hello: function() {
      this.date = "11"
    }
  }

}
</script>
<style lang="scss" scoped>
.selectdiv {
  position: relative;
  
  float: left;
  min-width: 100px;
}

select::-ms-expand {
display: none;
}

.selectdiv:after {
  content: '<>';
  font: 17px "Consolas", monospace;
  color: #333;
  -webkit-transform: rotate(90deg);
  -moz-transform: rotate(90deg);
  -ms-transform: rotate(90deg);
  transform: rotate(90deg);
  right: 11px;
  
  top: 18px;
  padding: 0 0 2px;
  border-bottom: 1px solid #999;
  
  position: absolute;
  pointer-events: none;
}

.selectdiv select {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  
  display: block;
  width: 100%;
  max-width: 320px;
  height: 50px;
  float: right;
  margin: 5px 0px;
  padding: 0px 24px;
  font-size: 16px;
  line-height: 1.75;
  color: #333;
  background-color: #ffffff;
  background-image: none;
  border: 1px solid #cccccc;
  -ms-word-break: normal;
  word-break: normal;
}
.table{
  padding :20px 10px;
}
ul{
  display: flex;
  list-style: none;
  li{
    width:8.1%;
  }
}
</style>