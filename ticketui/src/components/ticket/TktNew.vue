<template>
  <div style="margin-top: 22px;">
    <el-container>
      <el-main style="padding-left: 0px;padding-top: 0px">
        <div class="search-box" v-show="advanceSearchViewVisible">
          <el-row style="margin-top: 10px; margin-bottom: 10px;">
            <el-col :span="6">
              <el-input
                placeholder="请输入工单编号..."
                prefix-icon="el-icon-search"
                style="width: 97%"
                @keyup.enter.native="searchTicket"
                v-model="keywords">
              </el-input>
            </el-col>
            <el-col :span="6">
              <el-select v-model="ticket.declarationId" style="width: 97%" placeholder="请选择申报形式">
                <el-option
                  v-for="item in declarations"
                  :key="item.declaration_id"
                  :label="item.description"
                  :value="item.declaration_id">
                </el-option>
              </el-select>
            </el-col>
            <el-col :span="6">
              <el-select v-model="ticket.sourceId" style="width: 97%" placeholder="请选择来源分类">
                <el-option
                  v-for="item in sources"
                  :key="item.source_id"
                  :label="item.description"
                  :value="item.source_id">
                </el-option>
              </el-select>
            </el-col>
            <el-col :span="6">
              <el-select v-model="ticket.serverId" style="width: 97%" placeholder="请选择服务分类">
                <el-option
                  v-for="item in servers"
                  :key="item.server_id"
                  :label="item.description"
                  :value="item.server_id">
                </el-option>
              </el-select>
            </el-col>
          </el-row>
          <el-row style="margin-bottom: 0px;">
            <el-col :span="6">
              <el-select v-model="ticket.affectId" style="width: 97%" placeholder="请选择影响范围">
                <el-option
                  v-for="item in affects"
                  :key="item.affect_id"
                  :label="item.description"
                  :value="item.affect_id">
                </el-option>
              </el-select>
            </el-col>
            <el-col :span="6">
              <el-select v-model="ticket.priorityId" style="width: 97%" placeholder="请选择优先级">
                <el-option
                  v-for="item in priorities"
                  :key="item.priority_id"
                  :label="item.description"
                  :value="item.priority_id">
                </el-option>
              </el-select>
            </el-col>
            <el-col :span="6">
              <el-select v-model="ticket.status" style="width: 97%" placeholder="请选择工单状态">
                <el-option
                  v-for="item in statuses"
                  :key="item"
                  :label="item"
                  :value="item">
                </el-option>
              </el-select>
            </el-col>
            <el-col :span="6">
              <el-badge style="width: 97%">
                <el-tooltip effect="light" content="查询" placement="left"></el-tooltip>
                <el-button class="myButtonQ" size="mini" type="primary" @click="searchTicket" icon="el-icon-search">查询</el-button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <el-tooltip effect="light" content="刷新" placement="right"></el-tooltip>
                <el-button class="myButtonR" size="mini" type="success" @click="cancelSearch" icon="el-icon-refresh">刷新</el-button>
              </el-badge>
            </el-col>
          </el-row>
        </div>
        <div class="myTable" style="margin-top:15px;">
          <el-table
            :data="tickets"
            v-loading="tableLoading"
            border
            stripe
            size="mini"
            @selection-change="handleSelectionChange"
            :header-cell-style="{background:'#f0f0f0', color:'#68727c'}">
            <!--            <el-table-column
              type="selection"
              width="30"
              align="left">
            </el-table-column>-->
            <el-table-column
              prop="logId"
              fixed="left"
              label="工单编号"
              width="140"
              align="left"
              show-overflow-tooltip="true">
              <template slot-scope="scope">
                <router-link style="color:#0b6dd8;text-decoration:none;"
                             :to="{path:'/tkt/detail', query:{index: scope.$index, row: scope.row, backroute: '/tkt/new'}}">
                  {{scope.row.logId}}
                </router-link>
              </template>
            </el-table-column>
            <el-table-column
              width="150"
              label="工单生成时间"
              align="left"
              show-overflow-tooltip="true">
              <template slot-scope="scope">{{ scope.row.createdDate | formatDateTime}}</template>
            </el-table-column>
            <el-table-column
              prop="title"
              label="事件标题"
              width="150"
              align="left"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              prop="customerName"
              label="申报人"
              width="120"
              align="left"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              prop="customerId"
              label="申报人组织"
              width="120"
              align="left"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              prop="mobile"
              label="申报人手机"
              width="120"
              align="left"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              prop="tel"
              label="申报人座机"
              width="120"
              align="left"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              prop="email"
              label="申报人邮箱"
              width="150"
              align="left"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              prop="vipdesc"
              label="VIP"
              width="120"
              align="left"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="declaration.description"
              label="申报形式"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="source.description"
              label="来源分类"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="server.description"
              label="服务分类"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="questiontype.description"
              label="问题分类"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="subclass.description"
              label="问题子分类"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="affect.description"
              label="影响范围"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="priority.description"
              label="优先级"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="emailGroup.description"
              label="转发地址"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              width="100"
              prop="hr.name"
              label="责任人"
              show-overflow-tooltip="true">
            </el-table-column>
            <el-table-column
              fixed="right"
              prop="status"
              label="工单状态"
              width="135"
              align="left"
              show-overflow-tooltip="true">
              <template slot-scope="scope">
                <el-tag :type="scope.row.status | statusFilter">{{ scope.row.status }}</el-tag>
                <el-tooltip class="item" effect="light" content="分配" placement="top"></el-tooltip>
                <el-tag v-if="scope.row.status == 'New'" type="danger"
                        v-on:click.native="showEditTicketView(scope.$index, scope.row)">
                  <i class="el-icon-edit-outline">{{"分配"}}</i>
                </el-tag>
              </template>
            </el-table-column>
          </el-table>
          <div style="padding: 20px 5px;">
            <el-pagination
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="currentPage"
              :page-sizes="[10, 20, 30]"
              :page-size="pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="totalCount">
            </el-pagination>
          </div>
        </div>
      </el-main>
    </el-container>
    <el-form :model="ticket" :rules="rules" ref="assignTicketForm">
      <div class="myDialog">
        <el-dialog
          :title="ticketEdit"
          :visible.sync="dialogVisible"
          width="20%">
          <div class="mt20"></div>
          <el-input v-model="updateLogId" v-show="false" :disabled="true" placeholder="请输入新的工单编号..."></el-input>
          <el-form-item label-width="90px" label="责任人:" prop="assigneeId">
            <el-select v-model="ticket.assigneeId" style="" placeholder="请选择责任人" @change="currentSel">
              <el-option
                v-for="item in assignees"
                :key="item.id"
                :label="item.name"
                :value="item.id">
              </el-option>
            </el-select>
          </el-form-item>
          <div class="mt10"></div>
          <span slot="footer">
            <el-button @click="dialogVisible=false">取 消</el-button>
            <el-button type="primary" class="myButtonQ" @click="updateTicketExec">确 定</el-button>
          </span>
        </el-dialog>
      </div>
    </el-form>
  </div>
</template>
<script>
  export default {
    components: {},
    name: 'TicketListTable',
    filters: {
      statusFilter(status) {
        const statusMap = {
          "New": 'danger',
          "Assigned": 'warning',
          "In progress": '',
          "Pending": '',
          "Resolved": 'info',
          "Closed": 'success'
        }
        return statusMap[status]
      }
    },
    data() {
      return {
        tickets: [],
        keywords: '',
        title: '',
        positionName: '',
        declarations: [],
        sources: [],
        priorities: [],
        servers: [],
        affects: [],
        assignees: [],
        emailgroups: [],
        status: '',
        updateLogId: '',
        rowindex: '',
        assignee: '',
        updateTitleLevel: '',
        faangledoubleup: 'fa-angle-double-up',
        faangledoubledown: 'fa-angle-double-down',
        ticketEdit: '分配工单',
        titleLevel: '',
        updatePosId: -1,
        totalCount: -1,
        currentPage: 1,
        pageSize: 10,
        tableLoading: false,
        dialogVisible: false,
        multipleSelection: [],
        type: [],
        statuses: ['New', 'Assigned', 'In progress', 'Pending', 'Closed'],
        advanceSearchViewVisible: true,
        ticket: {
          logId: '',
          title: '',
          createdDate: '',
          customerName: '',
          customerId: '',
          mobile: '',
          tel: '',
          email: '',
          vipdesc: '',
          status: '',
          declarationId: '',
          sourceId: '',
          serverId: '',
          affectId: '',
          priorityId: '',
          assigneeId: '',
          groupId: ''
        },
        hr: {
          address: '',
          dept: '',
          enabled: '',
          id: '',
          name: '',
          phone: '',
          roles: '',
          email: '',
          userface: '',
          username: ''
        },
        rules: {
          declarationId: [{required: true, message: '必填:申报形式', trigger: 'change'}]
        },
        /*tableHeight: window.innerHeight - 285*/
      }
    },
    mounted: function () {
      //this.$ELEMENT.size = "mini";
      this.initData();
      this.loadTickets();
    },
    methods: {
      updateTicketExec() {
        if (!this.isNotNullORBlank(this.updateLogId)) {
          this.$message.warning('工单编号不能为空!');
          return;
        }
        this.tableLoading = true;
        var _this = this;
        this.putRequest("/ticket/basic/assign", {
          logId: this.updateLogId,
          assigneeId: this.ticket.assigneeId
        }).then(resp => {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            this.dialogVisible = false;
            var data = resp.data;
            _this.$message({type: data.status, message: data.msg});
            this.emptyTicketList();
            this.loadTickets();
            /* no lucky for part refresh */
            /* this.tickets[this.rowindex].status = 'Assigned';
              this.hr.name = this.assignee;
              this.tickets[this.rowindex].hr = this.hr;*/
            this.postRequest("/chat/nf", {message: this.updateLogId+" 已被分配给 " + this.assignee, title: this.updateLogId+" 已被分配给 " + this.assignee}).then(resp=> {
              if (resp && resp.status == 200) {
                var data = resp.data;
                //_this.$message({type: data.status, message: data.msg});
                if (data.status == 'success') {
                  _this.$store.commit('toggleNFDot', true);
                  _this.$store.state.stomp.send("/ws/nf", {}, '');
                  _this.initSysMsgs();
                  _this.cancelSend();
                }
              }
            })
          }
        })
      },
      currentSel(vId) {
        let obj = {};
        obj = this.assignees.find((item) => {
          return item.id === vId;
        });
        this.assignee = obj.name;
      },
      cancelSearch() {
        this.advanceSearchViewVisible = true;
        this.emptyTicketList();
        this.loadTickets();
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleDelete(index, row) {
        var _this = this;
        this.$confirm('删除[' + row.name + '], 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          _this.doDelete(row.id);
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      doDelete(ids) {
        var _this = this;
        _this.tableLoading = true;
        var url = '/system/basic/joblevel/';
        this.deleteRequest(url + ids).then(resp => {
          _this.tableLoading = false;
          if (resp && resp.status == 200) {
            _this.loadTableData();
          }
        })
      },
      loadTableData() {
        var _this = this;
        this.tableLoading = true;
        this.getRequest("/ticket/tickets").then(resp => {
          _this.tableLoading = false;
          /*if (resp && resp.status == 200) {}*/
        })
      },
      initData() {
        var _this = this;
        this.getRequest("/ticket/basic/lovdata").then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.declarations = data.declarations;
            _this.sources = data.sources;
            _this.priorities = data.priorities;
            _this.servers = data.servers;
            _this.questiontypes = data.questiontypes;
            _this.subclasses = data.subclasses;
            _this.affects = data.affects;
            _this.assignees = data.assignees;
            _this.emailgroups = data.emailgroups;
          }
        })
      },
      showEditTicketView(rowindex, row) {
        this.rowindex = rowindex;
        this.updateLogId = row.logId;
        this.dialogVisible = true;
      },
      searchTicket() {
        this.loadTickets();
      },
      handleSizeChange(currentSize) {
        this.pageSize = currentSize;
        this.loadTickets();
      },
      handleCurrentChange(currentChange) {
        this.currentPage = currentChange;
        this.loadTickets();
      },
      loadTickets() {
        var _this = this;
        this.tableLoading = true;
        this.getRequest("/ticket/basic/tkt?page=" + this.currentPage +
          "&size=" + this.pageSize +
          "&keywords=" + this.keywords +
          "&declarationId=" + this.ticket.declarationId +
          "&sourceId=" + this.ticket.sourceId +
          "&serverId=" + this.ticket.serverId +
          "&affectId=" + this.ticket.affectId +
          "&priorityId=" + this.ticket.priorityId +
          "&status=" + "New" +
          "&assigneeId=" + this.ticket.assigneeId +
          "&groupId=" + this.ticket.groupId
        ).then(resp => {
          this.tableLoading = false;
          if (resp && resp.status == 200) {
            var data = resp.data;
            _this.tickets = data.tickets;
            _this.totalCount = data.count;
            //_this.emptyTicketList();
          }
        })
      },
      emptyTicketList() {
        this.ticket = {
          logId: '',
          title: '',
          createdDate: '',
          customerName: '',
          customerId: '',
          mobile: '',
          tel: '',
          email: '',
          vipdesc: '',
          status: '',
          declarationId: '',
          sourceId: '',
          serverId: '',
          affectId: '',
          priorityId: '',
          assigneeId: '',
          groupId: '',
          rowindex: ''
        },
          this.keywords = '';
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
  };
</script>
<style scoped>
  .search-box {
    margin-bottom: 10px;
    border-radius: 4px;
    padding: 1px 5px 10px 5px;
    box-sizing: border-box;
    background-color: #e5edf5;
  }

  .mt10 {
    margin-top: 10px;
  }

  .mt20 {
    margin-top: 20px;
  }

  .el-icon-edit-outline:hover {
    color: #ffffff;
    background: #f56c6c;
  }

  .myDialog {
    text-align: left;
  }

  .myDialog >>> .el-dialog__body {
    padding-bottom: 10px;
    height:auto;
    margin-left: 0px;
    margin-right: 0px;
  }

  .myDialog >>> .el-dialog__header {
    border-bottom: 1px solid #889eca;
  }

  .myDialog >>> .el-dialog__title {
    line-height: 24px;
    font-size: 18px;
    color: #1a61bd;
    font-weight:bold;
  }

  .myTable >>> .el-table--border{
    border: 1px solid #d5d9e0;
    border-radius: 4px;
  }

  .myTable >>> .el-table {
    color: #647080;
  }

  .myButtonQ >>> .el-button--primary {
    color: #fff;
    font-size: 14px;
    background-color: #3771de;
    border-color: #3771de;
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
  .myButtonR {
    font-size: 14px;
  }
  @media screen and (max-width:1360px){.myButtonQ{padding: 10px 10px;}}/*宽度小于1360px时 */
  @media screen and (min-width:1360px){.myButtonQ{padding: 10px 20px;}}/*宽度大于1360px时 */
  @media screen and (max-width:1360px){.myButtonQ:hover{padding: 10px 10px;}}/*宽度小于1360px时 */
  @media screen and (min-width:1360px){.myButtonQ:hover{padding: 10px 20px;}}/*宽度大于1360px时 */
  @media screen and (max-width:1360px){.myButtonR{padding: 10px 10px;}}/*宽度小于1360px时 */
  @media screen and (min-width:1360px){.myButtonR{padding: 10px 20px;}}/*宽度大于1360px时 */
</style>
