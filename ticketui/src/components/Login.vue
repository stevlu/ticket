<template>
  <div>
    <div>
      <div class="login-top"></div>
      <div class="top-logo">
        <div style="float: left; margin-left: 10%">
          <!--<img src="../assets/img/top_logo.png" style="margin-top:35px;">-->
        </div>
        <div style="float: right; margin-right: 1%; margin-top: 2%;">
          <img src="../assets/img/icon_iphone.png" style="vertical-align:middle;">
          <!--<span style="color: #6975a7; font-size:14px">086 0411 8483xxxx</span>&nbsp;&nbsp;-->
          <span style="color: #6975a7; font-size:14px">139 1072 1096</span>&nbsp;&nbsp;
          <img src="../assets/img/icon_mail.png" style="vertical-align:middle;">
          <!--<span style="color: #6975a7; font-size:14px">admin@neusoft.com</span>-->
          <span style="color: #6975a7; font-size:14px">stevlu@qq.com</span>
        </div>
      </div>
      <div class="login-line"></div>
      <div class="login-container">
        <el-form class="login-form">
          <div class="login-title">SpringBoot Vue应用</div>
          <div class="login-titlenglish">Ticket SpringBoot Vue System</div>
          <el-form-item prop="account">
            <el-input class="login-input" type="text" v-model="loginForm.username" auto-complete="off"
                      placeholder="账号">{{"admin"}}</el-input>
          </el-form-item>
          <el-form-item prop="checkPass">
            <el-input class="login-input" type="password" v-model="loginForm.password" auto-complete="off"
                      placeholder="密码">{{"123"}}</el-input>
          </el-form-item>
          <el-form-item style="width: 100%">
            <el-button class="login-button" type="primary" @click.native.prevent="submitClick" style="width:100%">登录</el-button>
          </el-form-item>
        </el-form>
      </div>
      <div class="login-bottom"><em>Thanks to https://github.com/lenve/vhr.</em></div>
    </div>
  </div>
</template>
<script>
  export default {
    mounted: function () {
      //this.$ELEMENT.size = "mini";
    },
    data() {
      return {
        loginForm: {
          username: '',
          password: ''
        },
        loading: false
      }
    },
    methods: {
      submitClick: function () {
        var _this = this;
        this.loading = true;
        this.postRequest('/login', {
          username: this.loginForm.username,
          password: this.loginForm.password
        }).then(resp => {
          _this.loading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$store.commit('login', data.msg);
            var path = _this.$route.query.redirect;
            _this.$router.replace({path: path == '/' || path == undefined ? '/home' : path});
          }
        });
      }
    }
  }
</script>
<style scoped>
  .login-container {
    display: flex;
    height: 533px;
    background: url("../assets/img/bg.jpg") no-repeat;
    background-size: 100% 100%;
  }

  .login-title {
    text-align: center;
    color: #595959;
    font-size: 25px;
  }

  .login-titlenglish {
    margin-top: 13px;
    text-align: center;
    color: #595959;
    font-size: 16px;
  }

  .login-top {
    background: #264d9c;
    height: 26px;
    line-height:26px;
    color: #757575;
    font-size: 14px;
  }

  .top-logo {
    background: url("../assets/img/logo_bg.jpg");
    height: 117px;
  }

  .login-line {
    height: 4px;
    background: #213f99;
  }

  .login-bottom {
    color: #757575;
    font-size: 14px;
    position: fixed;
    bottom: 0px;
    height: 20px;
    min-width: 100%;
    background-color: #f6f6f6;
  }

  .login-form {
    margin: 0px;
    margin-left: 77%;
    margin-top: 6%;
  }

  .login-input >>> .el-input__inner {
    background-color: #2c4eaf;
    background: url("../assets/img/input_bg.png");
    height: 35px;
    width: 260px;
    margin-top: 5px;
  }

  .el-form-item {
    margin-top: 23px;
  }

  .login-button {
    background: url("../assets/img/button_bg.jpg");
    height: 40px;
    border: 0px;
    margin-top: 10px;
  }

  .login-button:hover {
    background: url("../assets/img/button_hover.jpg");
    height: 40px;
    border: 0px;
  }
</style>
