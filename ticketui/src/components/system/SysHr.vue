<template>
  <div style="margin-top: 22px" v-loading="fullloading">
    <div style="margin-bottom: 10px;display: flex;justify-content: center;align-items: center">
      <el-input
        placeholder="默认显示除管理员外的所有用户，可以通过用户名模糊查询..."
        prefix-icon="el-icon-search"
        size="small"
        style="width:100%; margin-right: 10px"
        v-model="keywords">
      </el-input>
      <el-button class="myButtonQ" size="mini" type="primary" icon="el-icon-search" @click="searchClick">搜索</el-button>
    </div>
    <div style="display: flex;justify-content: normal;flex-wrap: wrap;text-align: left">
      <el-card class="myCard" v-for="(item,index) in hrs" :key="item.id"
               v-loading="cardLoading[index]">
        <!--<div slot="header" class="clearfix">-->
<!--        <div class="clearfix">
          <el-button type="text"
                     style="color: #f6061b;margin: 0px;float: right; padding: 3px 0;width: 15px;height:15px"
                     icon="el-icon-delete" @click="deleteHr(item.id)"></el-button>
        </div>-->
        <div>
          <div>
            <!--<img :src="item.userface" alt="item.name" style="width: 50px;height: 50px;border-radius: 10px">-->
            <div class="userDiv">
              <span class="user-info">用户名称:</span>
              <el-input v-model="item.username" @blur="usernameChange(item.username,item.id,index)" placeholder="请输入名称"></el-input>
              <el-input v-model="item.name" @blur="nameChange(item.name,item.id,index)" placeholder="请输入名字"></el-input>
            </div>
            <div class="myDiv">
              <span class="user-info">手机号码:</span>
              <el-input v-model="item.phone" @blur="phoneChange(item.phone,item.id,index)" placeholder="请输入手机号码..."></el-input>
            </div>
            <div class="myDiv">
              <span class="user-info">电子邮件:</span>
              <el-input v-model="item.email" @blur="emailChange(item.email,item.id,index)" placeholder="请输入电子邮件..."></el-input>
            </div>            <!--<div><span class="user-info">地址:{{item.address}}</span></div>-->
            <div class="user-info" style="display: flex;align-items: center;margin-bottom: 3px">
              用户状态:
              <el-switch
                style="margin-left: 29px;"
                v-model="item.enabled"
                active-color="#6798ec"
                inactive-color="#aaaaaa"
                active-text="启用"
                :key="item.id"
                @change="switchChange(item.enabled,item.id,index)"
                inactive-text="禁用">
              </el-switch>
            </div>
            <div class="user-info">
              用户角色:
              <el-tag
                v-for="role in item.roles"
                :key="role.id"
                type="success"
                size="mini"
                style="margin-right:2px;margin-left:25px"
                :disable-transitions="true">{{role.nameZh}}
              </el-tag>
              <el-popover
                v-loading="eploading[index]"
                placement="right"
                title="角色列表"
                width="100"
                @hide="updateHrRoles(item.id,index)"
                :key="item.id"
                trigger="click">
                  <el-select v-model="selRoles" multiple placeholder="请选择角色">
                    <el-option
                      v-for="ar in allRoles"
                      :key="ar.id"
                      :label="ar.nameZh"
                      :value="ar.id">
                    </el-option>
                  </el-select>
                <el-button type="text" icon="el-icon-more" style="color: #09c0f6;padding-top: 0px" slot="reference"
                           @click="loadSelRoles(item.roles,index)" :disabled="moreBtnState"></el-button>
              </el-popover>
            </div>
            <div class="user-info">
              <span class="user-info">用户部门:
                <el-select style="margin-left: 25px;" v-model="item.dept" @change="deptChange(item.dept,item.id,index)" :key="item.id" size="mini" placeholder="请选择部门">
                  <el-option
                    v-for="ad in deps"
                    :key="ad.id"
                    :label="ad.name"
                    :value="ad.id">
                  </el-option>
                </el-select>
              </span>
            </div>
          </div>
        </div>
      </el-card>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {
        keywords: '',
        fullloading: false,
        hrs: [],
        cardLoading: [],
        eploading: [],
        allRoles: [],
        moreBtnState:false,
        selRoles: [],
        selRolesBak: [],
        deps: []
      }
    },
    mounted: function () {
      this.initCards();
      this.loadAllRoles();
      this.loadDeps();
    },
    methods: {
      loadDeps(){
        var _this = this;
        this.getRequest("/dept/deps").then(resp=> {
          if (resp && resp.status == 200) {
            _this.deps = resp.data;
          }
        })
      },
      searchClick(){
        this.initCards();
        this.loadAllRoles();
      },
      updateHrRoles(hrId, index){
        this.moreBtnState = false;
        var _this = this;
        if (this.selRolesBak.length == this.selRoles.length) {
          for (var i = 0; i < this.selRoles.length; i++) {
            for (var j = 0; j < this.selRolesBak.length; j++) {
              if (this.selRoles[i] == this.selRolesBak[j]) {
                this.selRolesBak.splice(j, 1);
                break;
              }
            }
          }
          if (this.selRolesBak.length == 0) {
            return;
          }
        }
        this.eploading.splice(index, 1, true)
        this.putRequest("/system/hr/roles", {
          hrId: hrId,
          rids: this.selRoles
        }).then(resp=> {
          _this.eploading.splice(index, 1, false);
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            if (data.status == 'success') {
              _this.refreshHr(hrId, index);
            }
          }
        });
      },
      refreshHr(hrId, index){
        var _this = this;
        _this.cardLoading.splice(index, 1, true)
        this.putRequest("/system/hr/id/" + hrId).then(resp=> {
          _this.cardLoading.splice(index, 1, false)
          _this.hrs.splice(index, 1, resp.data);
        })
      },
      loadSelRoles(hrRoles, index){
        this.moreBtnState = true;
        this.selRoles = [];
        this.selRolesBak = [];
        hrRoles.forEach(role=> {
          this.selRoles.push(role.id)
          this.selRolesBak.push(role.id)
        })
      },
      loadAllRoles(){
        var _this = this;
        this.getRequest("/system/basic/roles").then(resp=> {
          _this.fullloading = false;
          if (resp && resp.status == 200) {
            _this.allRoles = resp.data;
          }
        })
      },
      switchChange(newValue, hrId, index){
        var _this = this;
        _this.cardLoading.splice(index, 1, true)
        this.putRequest("/system/hr/", {
          enabled: newValue,
          id: hrId
        }).then(resp=> {
          _this.cardLoading.splice(index, 1, false)
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            if (data.status == 'error') {
              _this.refreshHr(hrId, index);
            }
          } else {
            _this.refreshHr(hrId, index);
          }
        })
      },
      deptChange(newValue, hrId, index){
        var _this = this;
        _this.cardLoading.splice(index, 1, true)
        this.putRequest("/system/hr/dept", {
          dept: newValue,
          id: hrId
        }).then(resp=> {
          _this.cardLoading.splice(index, 1, false)
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            if (data.status == 'error') {
              _this.refreshHr(hrId, index);
            }
          } else {
            _this.refreshHr(hrId, index);
          }
        })
      },
      phoneChange(newValue, hrId, index) {
        var _this = this;
        _this.cardLoading.splice(index, 1, true)
        this.putRequest("/system/hr/phone", {
          phone: newValue,
          id: hrId
        }).then(resp=> {
          _this.cardLoading.splice(index, 1, false)
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            if (data.status == 'error') {
              _this.refreshHr(hrId, index);
            }
          } else {
            _this.refreshHr(hrId, index);
          }
        })
      },
      emailChange(newValue, hrId, index) {
        var _this = this;
        _this.cardLoading.splice(index, 1, true)
        this.putRequest("/system/hr/email", {
          email: newValue,
          id: hrId
        }).then(resp=> {
          _this.cardLoading.splice(index, 1, false)
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            if (data.status == 'error') {
              _this.refreshHr(hrId, index);
            }
          } else {
            _this.refreshHr(hrId, index);
          }
        })
      },
      usernameChange(newValue, hrId, index) {
        var _this = this;
        _this.cardLoading.splice(index, 1, true)
        this.putRequest("/system/hr/username", {
          username: newValue,
          id: hrId
        }).then(resp=> {
          _this.cardLoading.splice(index, 1, false)
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            if (data.status == 'error') {
              _this.refreshHr(hrId, index);
            }
          } else {
            _this.refreshHr(hrId, index);
          }
        })
      },
      nameChange(newValue, hrId, index) {
        var _this = this;
        _this.cardLoading.splice(index, 1, true)
        this.putRequest("/system/hr/name", {
          name: newValue,
          id: hrId
        }).then(resp=> {
          _this.cardLoading.splice(index, 1, false)
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            if (data.status == 'error') {
              _this.refreshHr(hrId, index);
            }
          } else {
            _this.refreshHr(hrId, index);
          }
        })
      },
      initCards(){
        this.fullloading = true;
        var _this = this;
        var searchWords;
        if (this.keywords === '') {
          searchWords = 'all';
        } else {
          searchWords = this.keywords;
        }
        this.getRequest("/system/hr/" + searchWords).then(resp=> {
          if (resp && resp.status == 200) {
            _this.hrs = resp.data;
            var length = resp.data.length;
            _this.cardLoading = Array.apply(null, Array(length)).map(function (item, i) {
              return false;
            });
            _this.eploading = Array.apply(null, Array(length)).map(function (item, i) {
              return false;
            });
          }
        })
      },
      deleteHr(hrId){
        if (confirm("确定？" ? '' : '')) {
          return;
        } else {
          var _this = this;
          this.fullloading = true;
          this.deleteRequest("/system/hr/" + hrId).then(resp=> {
            _this.fullloading = false;
            if (resp && resp.status == 200) {
              var data = resp.data;
              _this.$message({type: data.status, message: data.msg});
              if (data.status == 'success') {
                _this.initCards();
                _this.loadAllRoles();
              }
            }
          })
        }
      }
    }
  }
</script>
<style scoped>
  .myCard {
    border: solid 1px #dee2eb;
    background: -moz-linear-gradient(top,  #ffffff,  #e1e4f2);
    filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#e1e4f2));
    margin: 20px;
  }

  .user-info {
    font-size: 14px;
    color: #5a6b89;
    font-weight:bold;
    padding-right:10px;
    height:35px;
    line-height:35px;
  }

  .user-detail {
    font-size: 14px;
    color:#555555;
    margin-left: 20px;
  }

  .userDiv >>> .el-input{
    width: auto;
    margin-left: 10px;
  }
  .userDiv >>> .el-input__inner {
    width: 88px;
    height: 28px;
  }

  .myDiv >>> .el-input{
    width: auto;
    margin-left: 10px;
  }
  .myDiv >>> .el-input__inner {
    width: 193px;
    height: 28px;
  }

  .myButtonQ {
    background-color: #3771de;
    border-color: #3771de;
  }
  .myButtonQ:hover {
    background-color: #5598de;
    border-color: #5598de;
  }
</style>
