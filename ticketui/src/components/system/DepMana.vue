<template>
  <div>
    <div style="text-align: left">
      <el-input
        placeholder="输入名称搜索部门或小组..."
        style="width: 100%; margin:0px; padding:0px; color:#b7b7b9; border:#dbdcdf"
        prefix-icon="el-icon-search"
        v-model="keywords">
      </el-input>
    </div>
    <div>
      <el-tree
        :props="defaultProps"
        :data="treeData"
        ref="tree"
        :filter-node-method="filterNode"
        v-loading="treeLoading"
        style="width: 100%; margin-top:10px"
        :render-content="renderContent">
      </el-tree>
      <div style="text-align: left;">
        <el-dialog
          title="添加部门"
          :visible.sync="dialogVisible"
          width="20%">
          <div style="margin-top: 20px">
            <span>上级部门:</span>
            <el-select style="margin-left:20px;"v-model="pDep" placeholder="请选择">
              <el-option
                v-for="item in allDeps"
                :key="item.id"
                :label="item.name"
                :value="item.id">
              </el-option>
            </el-select>
          </div>
          <div style="margin-top: 20px">
            <span>部门名称:</span>
            <el-input style="margin-left:20px;width: 220px;" v-model="depName" placeholder="请输入部门名称..."
                      @keyup.enter.native="addDep"></el-input>
          </div>
          <span slot="footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button class="myButtonQ" type="primary" @click="addDep">添加</el-button>
          </span>
        </el-dialog>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        keywords: '',
        depName: '',
        treeLoading: false,
        dialogVisible: false,
        allDeps: [],
        pDep: '',
        treeData: [],
        defaultProps: {
          label: 'name',
          isLeaf: 'leaf',
          children: 'children'
        }
      }
    },
    mounted: function () {
      this.treeLoading = true;
      this.loadTreeData();
    },
    watch: {
      keywords(val) {
        this.$refs.tree.filter(val);
      }
    },
    methods: {
      filterNode(value, data) {
        if (!value) return true;
        return data.name.indexOf(value) !== -1;
      },
      loadTreeData() {
        var _this = this;
        this.getRequest("/system/basic/dep/-1").then(resp => {
          _this.treeLoading = false;
          if (resp && resp.status == 200) {
            _this.treeData = resp.data;
          }
        })
      },
      setDataToTree(treeData, pId, respData) {
        for (var i = 0; i < treeData.length; i++) {
          var td = treeData[i];
          if (td.id == pId) {
            treeData[i].children = treeData[i].children.concat(respData);
            return;
          } else {
            this.setDataToTree(td.children, pId, respData);
          }
        }
      },
      addDep() {
        var _this = this;
        this.dialogVisible = false;
        this.treeLoading = true;
        this.postRequest("/system/basic/dep", {
          name: this.depName,
          parentId: this.pDep
        }).then(resp => {
          _this.treeLoading = false;
          if (resp && resp.status == 200) {
            var respData = resp.data;
            _this.depName = '';
            _this.$message({type: respData.status, message: "添加成功!"});
            _this.setDataToTree(_this.treeData, _this.pDep, respData.msg)
          }
        })
      },
      loadAllDeps() {
        var _this = this;
        this.getRequest("/system/basic/deps").then(resp => {
          if (resp && resp.status == 200) {
            _this.allDeps = resp.data;
          }
        });
      },
      showAddDepView(data, event) {
        this.loadAllDeps();
        this.dialogVisible = true;
        this.pDep = data.id;
        event.stopPropagation() ? event.stopPropagation() : (window.event.cancelBubble=true);
      },
      deleteDep(data, event) {
        var _this = this;
        if (data.children.length > 0) {
          this.$message({
            message: '该部门下尚有其他部门，不能被删除!',
            type: 'warning'
          });
        } else {
          this.$confirm('删除[' + data.name + ']部门, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            _this.treeLoading = true;
            _this.deleteRequest("/system/basic/dep/" + data.id).then(resp => {
              _this.treeLoading = false;
              if (resp && resp.status == 200) {
                var respData = resp.data;
                _this.$message({
                  message: respData.msg,
                  type: respData.status
                });
                _this.deleteLocalDep(_this.treeData, data);
              }
            });
          }).catch(() => {
            _this.$message({
              type: 'info',
              message: '已取消删除'
            });
          });
        }
        event.stopPropagation() ? event.stopPropagation() : (window.event.cancelBubble=true);
      },
      deleteLocalDep(treeData, data) {
        for (var i = 0; i < treeData.length; i++) {
          var td = treeData[i];
          if (td.id == data.id) {
            treeData.splice(i, 1);
            return;
          } else {
            this.deleteLocalDep(td.children, data);
          }
        }
      },
      renderContent(h, {node, data, store}) {
        return (
          <span class="spanlist">
            <span>{node.label}</span>
            <span>
              <el-button class="add" on-click={ () => this.showAddDepView(data,window.event) }>添加部门</el-button>
              <el-button class="del" on-click={ () => this.deleteDep(data,window.event) }>删除部门</el-button>
            </span>
        </span>
        )
      }
    }
  };
</script>
<style>
  .spanlist {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
    font-weight: bold;
    height: 40px;
    border-bottom: 1px solid #d7e6fd;
  }

  .el-tree-node__content {
    background: #edf2fb;
    color: #4f4f4f;
    height: 41px;
    border-bottom: 1px solid #ffffff;
    border-radius: 4px;
  }

  .el-tree-node__expand-icon {
    color: #f08b00;
    font-size: 14px;
  }

  .add {
    font-size: 12px;
    padding: 6px;
    background-color: #474747;
    border: #474747;
    color: #fff;
  }

  .add:hover {
    font-size: 12px;
    padding: 6px;
    background-color: #777777;
    border: #777777;
    color: #fff;
  }

  .del {
    font-size: 12px;
    padding: 6px;
    background-color: #f56c6c;
    border: #f56c6c;
    color: #fff;
  }

  .del:hover {
    font-size: 12px;
    padding: 6px;
    background-color: #fab6b6;
    border: #fab6b6;
    color: #fff;
  }

  .el-dialog__header {
    border-bottom: 1px solid #889eca;
  }

  .el-dialog__title {
    line-height: 24px;
    font-size: 18px;
    color: #1a61bd;
    font-weight:bold;
  }

  .myButtonQ {
    font-size: 14px;
    background-color: #3771de;
    border-color: #3771de;
  }
  .myButtonQ:hover {
    font-size: 14px;
    background-color: #5598de;
    border-color: #5598de;
  }
</style>
