<template>
  <div>
    <el-container class="home-container">
      <el-header class="home-header">
        <div style="float: left;">
          <!--<img src="../assets/img/top_logo.png" style="margin-top:4px;margin-left:15px;">-->
        </div>
        <div style="display: flex;align-items: center;margin-right: 7px">
          <el-badge style="margin-right: 30px" :is-dot="this.$store.state.nfDot">
            <i class="fa fa-bell-o" @click="goChat" style="cursor: pointer; color:#454545;"></i>
          </el-badge>
          <el-dropdown @command="handleCommand">
            <span class="el-dropdown-link home_userinfo" style="display: flex;align-items: center;margin-right: 30px">
              {{user.name}}
            </span>
            <el-dropdown-menu slot="dropdown">
              <!--<el-dropdown-item>个人中心</el-dropdown-item>-->
              <el-dropdown-item :disabled="userDisabled">修改密码</el-dropdown-item>
              <el-dropdown-item command="logout" divided>注&nbsp;&nbsp;销</el-dropdown-item>
              <el-dropdown-item command="updatepwd" :disabled="userDisabled">修改密码</el-dropdown-item>
              <el-dropdown-item command="logout" divided>注销</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>
      </el-header>
      <el-container>
        <el-aside width="190px" class="home-aside">
          <div style="display: flex;justify-content: flex-start;width: 190px;text-align: left;">
            <el-menu style="background: #ececec;width: 190px;" unique-opened router>
              <template v-for="(item,index) in this.routes" v-if="!item.hidden">
                <el-submenu class="cust-submenu" :key="index" :index="index+''">
                  <template slot="title">
                    <i :class="item.iconCls" style="color: #ffffff;width: 14px;"></i>
                    <span style="color: #ffffff;" slot="title">{{item.name}}</span>
                  </template>
                  <el-menu-item width="190px"
                                style="padding-left: 30px;padding-right:0px;margin-left: 0px;width: 170px;text-align: left"
                                v-for="child in item.children"
                                :index="child.path"
                                :key="child.path">{{child.name}}
                  </el-menu-item>
                </el-submenu>
              </template>
            </el-menu>
          </div>
        </el-aside>
        <el-container>
          <el-main>
            <el-breadcrumb separator-class="el-icon-arrow-right">
              <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
              <el-breadcrumb-item v-text="this.$router.currentRoute.name"></el-breadcrumb-item>
            </el-breadcrumb>
            <keep-alive>
              <router-view v-if="this.$route.meta.keepAlive"></router-view>
            </keep-alive>
            <router-view v-if="!this.$route.meta.keepAlive"></router-view>
          </el-main>
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>
<script>
  export default {
    mounted: function () {
      //this.devMsg();
      this.loadNF();
      //this.$ELEMENT.size = "mini";
    },
    methods: {
      loadNF() {
        var _this = this;
        this.getRequest("/chat/sysmsgs").then(resp => {
          var isDot = false;
          resp.data.forEach(msg => {
            if (msg.state == 0) {
              isDot = true;
            }
          });
          _this.$store.commit('toggleNFDot', isDot);
        })
      },
      goChat() {
        this.$router.push({path: '/chat'});
      },
      devMsg() {
        this.$alert('为了确保所有的小伙伴都能看到完整的数据演示，数据库只开放了查询权限和部分字段的更新权限，其他权限都不具备，完整权限的演示需要大家在自己本地部署后，换一个正常的数据库用户后即可查看，这点请大家悉知!', '友情提示', {
          confirmButtonText: '确定',
          callback: action => {
            this.$notify({
              title: '重要重要!',
              type: 'warning',
              message: '小伙伴们需要注意的是，目前只有权限管理模块完工了，因此这个项目中你无法看到所有的功能，除了权限管理相关的模块。权限管理相关的模块主要有两个，分别是 [系统管理->基础信息设置->权限组] 可以管理角色和资源的关系， [系统管理->操作员管理] 可以管理用户和角色的关系。',
              duration: 0
            });
          }
        });
      },
      handleCommand(cmd) {
        var _this = this;
        if (cmd == 'logout') {
          this.$confirm('注销登录, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            _this.getRequest("/logout");
            _this.$store.commit('logout');
            _this.$router.replace({path: '/'});
          }).catch(() => {
            _this.$message({
              type: 'info',
              message: '取消'
            });
          });
        }
        if (cmd == 'updatepwd') {
          _this.$router.push({path: '/pwd'});
        }
      }
    },
    data() {
      return {
        isDot: true
      }
    },
    computed: {
      user() {
        return this.$store.state.user;
      },
      routes() {
        return this.$store.state.routes
      }
    }
  }
</script>
<style scoped>
  .home-container {
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
  }

  .home-header {
    background: url('../assets/img/nyimg/nytop_bg.png');
    background-color: #ffffff;
    color: #333;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-sizing: content-box;
    padding: 0px;
  }

  .home-aside {
    background-color: #264d9c;
    overflow-x: hidden;
  }

  .home_userinfo {
    color: #9d9d9e;
    cursor: pointer;
    border: #fff 2px;
  }

  .el-submenu {
    width: 190px;
    min-width: 175px;
    background-color: #1c3881;
    color: #ffffff;
  }

  .cust-submenu >>> .el-submenu__title:hover {
    color: #ffffff;
    border: solid 1px #576ed6;
    background: #5ca0dd;
    background: -moz-linear-gradient(top, #3d75c8, #589cdb);
    background: -webkit-gradient(linear, left top, left bottom, from(#3d75c8), to(#589cdb));
  }

  .el-menu-item {
    width: 190px;
    min-width: 190px;
    background-color: #5ca1dc;
    border-bottom: 1px solid #c5d8ff;
    color: #ffffff;
  }

  .el-menu-item.is-active {
    color: #ffffff;
    border-left: 4px solid #fca321;
    background: #5ca0dd;
    background: -moz-linear-gradient(top, #3d75c8, #589cdb);
    background: -webkit-gradient(linear, left top, left bottom, from(#3d75c8), to(#589cdb));
  }

  .el-menu-item:hover {
    color: #ffffff;
    background: #5ca0dd;
    background: -moz-linear-gradient(top, #3d75c8, #589cdb);
    background: -webkit-gradient(linear, left top, left bottom, from(#3d75c8), to(#589cdb));
  }

  .cust-submenu >>> .el-submenu__icon-arrow.el-icon-arrow-down::before {
    color: #ffffff;
  }

  .el-button--primary {
    background-color: #3771de;
    border-color: #3771de;
  }
</style>
