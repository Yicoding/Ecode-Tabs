<template>
  <div class="scaleWrap fix">
    <div v-for="(item,index) in data" class="item" :key="index">
      <img :src="item.path" @click="enlargeImg(item.path,index)" class="smallImg">
      <div class="txt"><a :href="item.path" download="1111">下载</a></div>
    </div>
    <div v-if="largeContainer" class="largeContainer">
      <div class="fl" :class="{sideClickFade: isSideClickFade,sideClick:isSideClick}" @mouseover="over" @mouseout="out">
        <div @click="prevImg">
          <img src="./logo.png" :class="{clickArrow: isClickArrow,clickArrowFade:isClickArrowFade}">
        </div>
      </div>
      <div class="box-image-wrapper fl">
        <img :src="enlargeImgUrl" style="height:100%;margin:0 auto;cursor: pointer;" :class="{rotate90:rotate==1,rotate180:rotate==2,rotate270:rotate==3,rotate0:rotate==0}" @click="enSmallImg"><br>
      </div>
      <div class="fr" :class="{sideClickFade: isSideClickFade,sideClick:isSideClick}" @mouseover="over" @mouseout="out">
        <div @click="nextImg">
          <img src="./logo.png" :class="{clickArrow: isClickArrow,clickArrowFade: isClickArrowFade}">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'enlargeImg',
    data(){
      return{
        largeContainer:false,
        enlargeImgUrl:'',
        imageIndex:'',
        preImgUrl:'',
        nextImgUrl:'',
        isSideClickFade:true,
        isSideClick:false,
        isClickArrow:false,
        isClickArrowFade:true,
        rotate:0
      }
    },
    props:{
      "data":{
        type:Array,
      }
    },
    methods:{
      enlargeImg(url,i){
        this.largeContainer=true;
        this.enlargeImgUrl = url;
        this.imageIndex = i;
        // console.log(i);
      },
      rotateImg(){
        // console.log(this.rotate);
        if(this.rotate==0){
          this.rotate=1;
        }else if(this.rotate==1){
          this.rotate=2;
        }else if(this.rotate==2){
          this.rotate=3;
        }else{
          this.rotate=0;
        }
      },
      rotateImgBack(){
        if(this.rotate==0){
          this.rotate=3;
        }else if(this.rotate==1){
          this.rotate=0;
        }else if(this.rotate==2){
          this.rotate=1;
        }else{
          this.rotate=2;
        }
      },
      over() {
        this.isSideClickFade = false;
        this.isSideClick = true;
        this.isClickArrow = true;
        this.isClickArrowFade = false;
      },
      out() {
        this.isSideClickFade = true;
        this.isSideClick = false;
        this.isClickArrow = false;
        this.isClickArrowFade = true;
      },
      enSmallImg(){
        this.largeContainer=false;
        this.rotate = 0;
      },
      prevImg(){
        // console.log('this.imageIndex'+this.imageIndex);
        if(this.imageIndex==0){
          alert('前面已经没有了！');
        }else{
          this.enlargeImgUrl = this.data[this.imageIndex-1].path;
          this.imageIndex = this.imageIndex-1;
        }
      },
      nextImg(){
        // console.log('this.data.length'+this.data.length);
        if(this.imageIndex==this.data.length-1){
          alert('已经是最后一张了哦！');
        }else{
          this.enlargeImgUrl = this.data[this.imageIndex+1].path;
          this.imageIndex = this.imageIndex+1;
        }
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang='scss'>
  .largeContainer{
    top: 0;
    right: 0;
    left: 0;
    position: fixed;
    width: 100%;
    height: 100%;
    background-color: rgba(55,55,55,0.9);
    z-index: 22;
    box-sizing: border-box;
  }
  .box-image-wrapper{
    top: 0;
    position: fixed;
    width: 100%;
    height: 100%;
    z-index: 33;
    text-align: center;
  }
  .scaleWrap{
    margin-top: 30px;
    /*position: relative;*/
    .txt{
      margin: 0px;
      text-align: center;
      width: 100%;
      height: 40px;
      line-height: 40px;
      cursor: pointer;
    }
    .item{
      margin-left: 20px;
      position: relative;
      float: left;
    }
  }
  .smallImg{
    height:135px;
    width:240px;
    /*float:left;*/
    /*margin-left: 20px;*/
    cursor: pointer;
    display: block;
  }
  .sideClick{
    height:100%;
    width:6%;
    cursor: pointer;
    div{
      position:absolute;
      z-index:44;
      background-color: rgba(40,40,40,0.8);
      height:100%;
      width: 6%;
    }
  }
  .sideClickFade{
    height:100%;
    width:6%;
    cursor: pointer;
    div{
      position:absolute;
      z-index:44;
      background-color: rgba(40,40,40,0);
      height:100%;
      width: 6%;
    }
  }
  .clickArrow{
    height:100px;
    width:50%;
    margin-left: 25%;
    margin-top: 350px;
  }
  .clickArrowFade{
    display: none;
  }
  .rotate0{
    transform: rotate(0deg);
  }
  .rotate90{
    transform: rotate(90deg);
  }
  .rotate180{
    transform: rotate(180deg);
  }
  .rotate270{
    transform: rotate(270deg);
  }
  .fr{
    float: right;
  }
  .fl{
    float:left;
  }
</style>
