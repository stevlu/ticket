<template>
  <div style="margin-top: 22px;">
    <el-form label-width="100px" style="width: 67%" label-position="left">
      <el-form-item label="用户名：">
        <el-input type="text" v-model="user.username + ' (' + user.name + ')'" disabled="">
        </el-input>
      </el-form-item>
      <el-form-item label="旧密码：">
        <el-input :type="inputType" v-model="oldPassword" placeholder="">
        </el-input>
      </el-form-item>
      <el-form-item label="新密码：">
        <el-input :type="inputType" v-model="newPassword" placeholder="请输入新密码">
          <i slot="suffix" title="显示密码" @click="changePass()" style="cursor:pointer;"
             class="fa fa-lock fa-lg"></i>
        </el-input>
      </el-form-item>
      <el-form-item style="text-align: right;">
        <el-button style="width: 120px; height: 30px"
                   class="myButtonQ"
                   type="primary"
                   @click="updatepwd"
                   icon="el-icon-edit"
                   size="mini">确&nbsp;定</el-button>
        <el-button style="width: 120px; height: 30px"
                   class="myButtonR"
                   type="success"
                   @click="returnToList"
                   icon="el-icon-back"
                   size="mini">返&nbsp;回</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        oldPassword: '',
        newPassword: '',
        inputType: 'password'
      }
    },
    computed: {
      user() {
        return this.$store.state.user;
      }
    },
    methods: {
      returnToList() {
        this.$router.push({path: '/home'});
      },
      updatepwd() {
        var _this = this;
        if (_this.newPassword == '' || _this.oldPassword == '') {
          _this.$message.warning('密码不能为空!');
          return;
        }
        if (_this.oldPassword == _this.newPassword) {
          _this.$message.warning('新旧密码不能一致!');
          return;
        } else {
          _this.putRequest("/system/hr/updatep", {
            oldPassword: _this.oldPassword,
            newPassword: _this.newPassword,
            username: _this.user.username,
            encodedPassword: _this.user.password
          }).then(resp => {
            if (resp && resp.status == 200) {
              var data = resp.data;
              _this.$message({type: data.status, message: data.msg});
              _this.getRequest("/logout");
              _this.$store.commit('logout');
              _this.$router.replace({path: '/'});
            }
          })
        }
      },
      changePass() {
        if (this.inputType == 'password') {
          this.inputType = 'text';
        } else {
          this.inputType = 'password';
        }
      }
    }
  }
</script>
<style scoped>
  .myButtonQ {
    font-weight: 500;
    background-color: #3771de;
    border-color: #3771de;
  }
  .myButtonQ:hover {
    font-weight: 500;
    background-color: #5598de;
    border-color: #5598de;
  }
  .myButtonQ:disabled {
    font-weight: 500;
    background-color: #a0cfff;
    border-color: #a0cfff;
  }
</style>
