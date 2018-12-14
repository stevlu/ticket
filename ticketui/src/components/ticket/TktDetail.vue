<template>
  <div class="containerDiv" >
    <el-container>
      <el-main style="padding-left: 0px;padding-top: 0px;border-radius: 4px;overflow-y: hidden;">
        <el-form class="myForm" :model="ticket" :rules="rules" ref="editTicketForm">
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="16">
              <div class="bg-purple-time">
                <el-form-item class="twoLineLabel" label-width="100px" label="工单编号:" prop="updateLogId">
                  <el-input class="twoLineInput" v-model="updateLogId" :disabled="true" placeholder="请输入新的工单编号..."></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-time">
                <el-form-item class="twoLineLabel" label-width="100px" label="当前时间:" prop="currentTime">
                  <template>
                  <span style="margin-left:18px;color:#409efe;font-size: 14px;font-weight: normal;">
                    <slot>
                      {{currentTime}}
                    </slot>
                  </span>
                  </template>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-time">
                <el-form-item class="twoLineLabel" label-width="100px" label="开始时间:" prop="createdDate">
                  <el-input class="twoLineInput" v-model="createdDate" placeholder="开始时间..." :disabled="true"></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-time">
                <el-form-item class="twoLineLabel" label-width="100px" label="优先级:" prop="priorityId">
                  <el-select class="twoLineInput" v-model="ticket.priorityId" style="width: 100%" placeholder="请选择优先级" :disabled="true">
                    <el-option
                      v-for="item in priorities"
                      :key="item.priority_id"
                      :label="item.description"
                      :value="item.priority_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-time">
                <el-form-item class="twoLineLabel" label-width="100px" label="剩余时间:" prop="pendingTime">
                  <template>
                  <span :endTime="endTime" :callback="callback" :endText="endText"
                        style="margin-left:18px;color:#409efe;font-size: 14px;font-weight: normal;">
                    <slot>
                      {{timecontent}}
                    </slot>
                  </span>
                  </template>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="申报人:" prop="customerName">
                  <el-input class="sixLineInput" v-model="customerName" placeholder="申报人..."></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="申报人手机:" prop="mobile">
                  <el-input class="sixLineInput" v-model="mobile" placeholder="申报人手机..."></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="申报人座机:" prop="tel">
                  <el-input class="sixLineInput" v-model="tel" placeholder="申报人座机..."></el-input>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="申报人邮箱:" prop="email">
                  <el-input class="sixLineInput" v-model="email" placeholder="申报人邮箱..."></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="申报人组织:" prop="customerId">
                  <el-input class="sixLineInput" v-model="customerId" placeholder="申报人组织..."></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="VIP:" prop="vipId">
                  <el-select class="sixLineInput" v-model="ticket.vipId" style="width: 100%" placeholder="VIP">
                    <el-option
                      v-for="item in vips"
                      :key="item.vipid"
                      :label="item.vipdesc"
                      :value="item.vipid">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="影响范围:" prop="affectId">
                  <el-select class="sixLineInput" v-model="ticket.affectId" filterable style="width: 100%" placeholder="请选择影响范围">
                    <el-option
                      v-for="item in affects"
                      :key="item.affect_id"
                      :label="item.description"
                      :value="item.affect_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="申报形式:" prop="declarationId">
                  <el-select class="sixLineInput" v-model="ticket.declarationId" filterable style="width: 100%" placeholder="请选择申报形式">
                    <el-option
                      v-for="item in declarations"
                      :key="item.declaration_id"
                      :label="item.description"
                      :value="item.declaration_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="服务分类:" prop="serverId">
                  <el-select class="sixLineInput" v-model="ticket.serverId" filterable style="width: 100%" placeholder="请选择服务分类">
                    <el-option
                      v-for="item in servers"
                      :key="item.server_id"
                      :label="item.description"
                      :value="item.server_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="来源分类:" prop="sourceId">
                  <el-select class="sixLineInput" v-model="ticket.sourceId" filterable style="width: 100%" placeholder="请选择来源分类">
                    <el-option
                      v-for="item in sources"
                      :key="item.source_id"
                      :label="item.description"
                      :value="item.source_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="问题分类:" prop="questiontypeId">
                  <el-select class="sixLineInput" v-model="ticket.questiontypeId" filterable style="width: 100%" placeholder="请选择问题分类"
                             @change="getChildClass()">
                    <el-option
                      v-for="item in questiontypes"
                      :key="item.question_id"
                      :label="item.description"
                      :value="item.question_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple">
                <el-form-item class="sixLineLabel" label-width="100px" label="问题子类:" prop="subclassId">
                  <el-select class="sixLineInput" v-model="ticket.subclassId" filterable style="width: 100%" placeholder="请选择问题子类">
                    <el-option
                      v-for="item in subclasses"
                      :key="item.subclass_id"
                      :label="item.description"
                      :value="item.subclass_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="24">
              <div class="bg-purple-light">
                <el-form-item class="twoLineLabel" label-width="100px" label="事件标题:" prop="title">
                  <el-input class="twoLineInput" v-model="title" style="width:100%" placeholder="事件标题..."></el-input>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="height: 76px;padding-left: 0px;padding-right: 0px;" :span="24">
              <div class="bg-purple-light">
                <el-popover
                  placement="top-end"
                  title="事件历史"
                  width="650"
                  trigger="click"
                  content=""
                  style="color: #7f8aa0; font-size: 14px;">
                  <div class="divhis">
                    {{ describehis }}
                  </div>
                  <el-form-item class="twoLineLabel" label-width="100px" label="事件历史:" slot="reference" prop="describehis">
                    <el-input class="twoLineInput" v-model="describehis" ref="describehis" v-bind:readonly="textReadonly"
                              style="width:100%;color: #7f8aa0; font-size: 13px;" type="textarea" :rows="5" :autosize="{minRows: 5, maxRows: 5}"
                              placeholder="">
                    </el-input>
                  </el-form-item>
                </el-popover>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-light">
                <el-form-item class="twoLineLabel" label-width="100px" label="事件转发:" prop="groupId">
                  <el-select class="twoLineInput" v-model="ticket.groupId" filterable style="width: 100%" placeholder="请选择转发分类"
                             @change="getGroupEmail()">
                    <el-option
                      v-for="item in emailgroups"
                      :key="item.group_id"
                      :label="item.description"
                      :value="item.group_id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-light">
                <el-form-item class="twoLineLabel" label-width="100px" label="转发地址:" prop="gemail">
                  <el-input class="twoLineInput" v-model="gemail" placeholder="转发地址..." v-bind:readonly="textReadonly"></el-input>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8" align="center">
              <el-form-item class="twoLineLabel">
                <el-button class="myButtonQ"
                           style="width: 73%;"
                           type="primary"
                           :disabled="emailDisabled"
                           @click="sendTicketEmail"
                           icon="el-icon-message"
                           size="mini">发&nbsp;&nbsp;信
                </el-button>
              </el-form-item>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="height: 76px;padding-left: 0px;padding-right: 0px;" :span="24">
              <div class="bg-purple-light">
                <el-form-item class="twoLineLabel" label-width="100px" label="事件处理:" prop="describe">
                  <el-input class="twoLineInput" autofocus v-model="describe" style="width:100%;color: #7f8aa0; font-size: 13px;" type="textarea" :rows="5"
                            :autosize="{minRows: 5, maxRows: 5}" placeholder="请输入处理内容...">
                  </el-input>
                </el-form-item>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="2">
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-light">
                <el-form-item class="twoLineLabel" label-width="100px" label="工单状态:" prop="status">
                  <el-select class="twoLineInput" v-model="status" style="width: 100%" :disabled="statusDisabled" placeholder="工单状态"
                             @change="handleStatusSwitch">
                    <el-option
                      v-for="item in statuses"
                      :key="item.value"
                      :label="item.label"
                      :value="item.value"
                      :disabled="item.disabled">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8">
              <div class="bg-purple-light">
                <el-form-item class="twoLineLabel" label-width="100px" label="责任人:" prop="assigneeId">
                  <el-select class="twoLineInput" v-model="ticket.assigneeId" filterable :disabled="assigneeDisabled" style="width: 100%"
                             placeholder="请选择责任人">
                    <el-option
                      v-for="item in assignees"
                      :key="item.id"
                      :label="item.name"
                      :value="item.id">
                    </el-option>
                  </el-select>
                </el-form-item>
              </div>
            </el-col>
            <el-col style="padding-left: 0px;padding-right: 0px" :span="8" align="center">
              <el-form-item class="twoLineLabel">
                <el-tooltip class="item" effect="light" content="关闭" placement="top"></el-tooltip>
                <el-button style="width: 23%;"
                           type="danger"
                           :disabled="closeDisabled"
                           @click="closeTicketExec"
                           size="mini"
                           icon="el-icon-close">关&nbsp;&nbsp;闭</el-button>
                <el-tooltip class="item" effect="light" content="保存" placement="top"></el-tooltip>
                <el-button style="width: 23%"
                           class="myButtonQ"
                           type="primary"
                           :disabled="updateDisabled"
                           @click="updateTicketExec"
                           icon="el-icon-edit"
                           size="mini">保&nbsp;&nbsp;存</el-button>
                <el-tooltip class="item" effect="light" content="返回" placement="top"></el-tooltip>
                <el-button style="width: 23%"
                           type="success"
                           @click="returnToList"
                           icon="el-icon-back"
                           size="mini">返&nbsp;&nbsp;回</el-button>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>
<script>
  export default {
    mounted: function () {
      //this.$ELEMENT.size = "mini";
      this.emptyTicketData();
      this.initData();
      this.timer = setInterval(() => {
        this.currentTime = (new Date()).toLocaleString();
      }, 1000);
    },
    beforeDestroy() {
      if (this.timer) {
        clearInterval(this.timer);
      }
    },
    data() {
      return {
        tickets: [],
        keywords: '',
        title: '',
        describe: '',
        describehis: '',
        positionName: '',
        declarations: [],
        sources: [],
        priorities: [],
        servers: [],
        questiontypes: [],
        subclasses: [],
        affects: [],
        assignees: [],
        emailgroups: [],
        assignee: '',
        status: '',
        updateLogId: '',
        customerName: '',
        customerId: '',
        createdDate: '',
        startTime: this.$route.query.row.createdDate,
        pendingTime: '',
        mobile: '',
        tel: '',
        email: '',
        gemail: '',
        vipId: '',
        updateTitleLevel: '',
        faangledoubleup: 'fa-angle-double-up',
        faangledoubledown: 'fa-angle-double-down',
        titleLevel: '',
        updatePosId: -1,
        totalCount: -1,
        currentPage: 1,
        multipleSelection: [],
        type: [],
        textReadonly: true,
        emailDisabled: false,
        statusDisabled: false,
        //reassignDisabled: false,
        closeDisabled: false,
        updateDisabled: false,
        assigneeDisabled: false,
        statuses: [
          {value: 'New', label: 'New', disabled: true},
          {value: 'Assigned', label: 'Assigned', disabled: false},
          {value: 'In progress', label: 'In progress', disabled: false},
          {value: 'Pending', label: 'Pending', disabled: false},
          {value: 'Closed', label: 'Closed', disabled: false}
        ],
        vips: [{vipid: '1', vipdesc: 'Y'}, {vipid: '0', vipdesc: 'N'}],
        posData: [],
        advanceSearchViewVisible: true,
        timecontent: '',
        currentTime: '',
        ticket: {
          logId: '',
          title: '',
          describe: '',
          describehis: '',
          createdDate: '',
          customerName: '',
          customerId: '',
          mobile: '',
          tel: '',
          email: '',
          gemail: '',
          vipId: '',
          status: '',
          declarationId: '',
          sourceId: '',
          priorityId: '',
          serverId: '',
          questiontypeId: '',
          subclassId: '',
          affectId: '',
          assigneeId: '',
          groupId: ''
        },
        rules: {}
      }
    },
    props: {
      endTime: {
        type: String,
        default: ''
      },
      endText: {
        type: String,
        default: '已过期'
      },
      callback: {
        type: Function,
        default: function callbk() {
          //callback是结束之后的回调
        }
      }
    },
    methods: {
      returnToList() {
        this.$router.push({path: this.$route.query.backroute});
      },
      initData() {
        var self = this;
        self.getRequest("/ticket/basic/lovdata?questiontypeId=" + self.$route.query.row.questiontypeId).then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            self.declarations = data.declarations;
            self.sources = data.sources;
            self.priorities = data.priorities;
            self.servers = data.servers;
            self.questiontypes = data.questiontypes;
            self.subclasses = data.subclasses;
            self.affects = data.affects;
            self.assignees = data.assignees;
            self.emailgroups = data.emailgroups;
          }
        });
        self.ticket.declarationId = self.$route.query.row.declarationId == null ? '' : self.$route.query.row.declarationId;
        self.ticket.sourceId = self.$route.query.row.sourceId == null ? '' : self.$route.query.row.sourceId;
        self.ticket.vipId = self.$route.query.row.vipId == null ? '' : self.$route.query.row.vipId;
        self.ticket.priorityId = self.$route.query.row.priorityId == null ? '' : self.$route.query.row.priorityId;
        self.ticket.serverId = self.$route.query.row.serverId == null ? '' : self.$route.query.row.serverId;
        self.ticket.questiontypeId = self.$route.query.row.questiontypeId == null ? '' : self.$route.query.row.questiontypeId;
        self.ticket.subclassId = self.$route.query.row.subclassId == null ? '' : self.$route.query.row.subclassId;
        self.ticket.affectId = self.$route.query.row.affectId == null ? '' : self.$route.query.row.affectId;
        self.ticket.assigneeId = self.$route.query.row.hr == null ? '' : self.$route.query.row.hr.id;
        self.ticket.groupId = self.$route.query.row.groupId == null ? '' : self.$route.query.row.groupId;
        self.updateLogId = self.$route.query.row.logId;
        self.customerName = self.$route.query.row.customerName == null ? '' : self.$route.query.row.customerName;
        self.customerId = self.$route.query.row.customerId == null ? '' : self.$route.query.row.customerId;
        self.mobile = self.$route.query.row.mobile == null ? '' : self.$route.query.row.mobile;
        self.tel = self.$route.query.row.tel == null ? '' : self.$route.query.row.tel;
        self.email = self.$route.query.row.email == null ? '' : self.$route.query.row.email;
        self.gemail = self.$route.query.row.emailGroup == null ? '' : self.$route.query.row.emailGroup.email;
        if (self.gemail == null || self.gemail == "") {
          self.emailDisabled = true;
        } else {
          self.emailDisabled = false;
        }
        self.title = self.$route.query.row.title == null ? '' : self.$route.query.row.title;
        self.describehis = self.$route.query.row.describe;
        self.status = self.$route.query.row.status;
        self.createdDate = formatDateTime(self.$route.query.row.createdDate);
        self.countdowm(self.$route.query.row.createdDate, self.$route.query.row.priorityId);
        this.handleStatusSwitch();
      },
      emptyTicketData() {
        this.ticket = {
          logId: '',
          title: '',
          describe: '',
          describehis: '',
          createdDate: '',
          customerName: '',
          customerId: '',
          mobile: '',
          tel: '',
          email: '',
          vipId: '',
          status: '',
          declarationId: '',
          sourceId: '',
          priorityId: '',
          serverId: '',
          questiontypeId: '',
          subclassId: '',
          affectId: '',
          groupId: '',
          gemail: ''
        };
      },
      closeTicketExec() {
        var self = this;
        if (!self.isNotNullORBlank(self.updateLogId)) {
          self.$message.warning('工单编号不能为空!');
          return;
        }
        if (self.status == 'New') {
          self.$message.warning('请先分配工单再更新!');
          return;
        }
        self.currentSel(self.ticket.assigneeId);
        self.putRequest("/ticket/basic/update", {
          customerName: self.customerName,
          mobile: self.mobile,
          logId: self.updateLogId,
          tel: self.tel,
          email: self.email,
          customerId: self.customerId,
          vipId: self.ticket.vipId,
          affectId: self.ticket.affectId,
          declarationId: self.ticket.declarationId,
          serverId: self.ticket.serverId,
          sourceId: self.ticket.sourceId,
          questiontypeId: self.ticket.questiontypeId,
          subclassId: self.ticket.subclassId == null ? '' : self.ticket.subclassId,
          groupId: self.ticket.groupId,
          assigneeId: self.ticket.assigneeId,
          title: self.title,
          describe: self.describe + " {" + self.assignee + "关闭了工单}",
          status: self.status
        }).then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            self.$message({type: data.status, message: data.msg});
            self.describe = '';
          }
        })
      },
      updateTicketExec() {
        var self = this;
        if (!self.isNotNullORBlank(self.updateLogId)) {
          self.$message.warning('工单编号不能为空!');
          return;
        }
        if (self.status == 'New') {
          self.$message.warning('请先分配工单再更新!');
          return;
        }
        self.putRequest("/ticket/basic/update", {
          customerName: self.customerName,
          mobile: self.mobile,
          logId: self.updateLogId,
          tel: self.tel,
          email: self.email,
          customerId: self.customerId,
          vipId: self.ticket.vipId,
          affectId: self.ticket.affectId,
          declarationId: self.ticket.declarationId,
          serverId: self.ticket.serverId,
          sourceId: self.ticket.sourceId,
          questiontypeId: self.ticket.questiontypeId,
          subclassId: self.ticket.subclassId == null ? '' : self.ticket.subclassId,
          groupId: self.ticket.groupId,
          assigneeId: self.ticket.assigneeId,
          title: self.title,
          describe: self.describe,
          status: self.status
        }).then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            self.$message({type: data.status, message: data.msg});
            self.describe = '';
          }
        })
      },
      sendTicketEmail() {
        var self = this;
        if (!self.isNotNullORBlank(self.gemail)) {
          self.$message.warning('转发地址不能为空!');
          return;
        }
        self.postRequest("/ticket/basic/email", {
          customerName: self.customerName,
          emailCreatedDate: self.createdDate,
          mobile: self.mobile,
          logId: self.updateLogId,
          tel: self.tel,
          email: self.email,
          gemail: self.gemail,
          customerId: self.customerId,
          vipId: self.ticket.vipId,
          groupId: self.ticket.groupId,
          priorityId: self.ticket.priorityId,
          title: self.title,
          describe: self.describe,
          describehis: self.describehis,
          status: self.status
        }).then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            self.$message({type: data.status, message: data.msg});
          }
        })
      },
      getChildClass() {
        var self = this;
        self.ticket.subclassId = null;
        self.getRequest("/ticket/basic/getChildClass?questiontypeId=" + self.ticket.questiontypeId
        ).then(resp => {
          if (resp && resp.status == 200) {
            var data = resp.data;
            self.subclasses = data.subclasses;
          }
        }).catch(function (error) {
          console.log(error);
        });
      },
      getGroupEmail() {
        var self = this;
        let groupId = self.ticket.groupId;
        self.gemail = self.emailgroups[self.emailgroups.findIndex(x => x.group_id == groupId)].email;
        if (self.gemail == null || self.gemail == "") {
          self.emailDisabled = true;
        } else {
          self.emailDisabled = false;
        }
      },
      handleStatusSwitch() {
        let self = this;
        let _status = self.status;
        switch (_status) {
          case '':
            break;
          case 'New':
            self.statusDisabled = true;
            self.assigneeDisabled = true;
            self.closeDisabled = true;
            self.updateDisabled = true;
            break;
          case 'Assigned':
            self.statusDisabled = false;
            self.assigneeDisabled = false;
            self.closeDisabled = true;
            self.updateDisabled = false;
            break;
          case 'In progress':
            self.statusDisabled = false;
            self.assigneeDisabled = true;
            self.closeDisabled = true;
            self.updateDisabled = false;
            break;
          case 'Pending':
            self.statusDisabled = false;
            self.assigneeDisabled = true;
            self.closeDisabled = true;
            self.updateDisabled = false;
            break;
          case 'Closed':
            self.statusDisabled = false;
            self.assigneeDisabled = true;
            self.closeDisabled = false;
            self.updateDisabled = true;
            break;
          default:
            self.statusDisabled = false;
            self.assigneeDisabled = false;
            self.closeDisabled = false;
            self.updateDisabled = false;
        }
      },
      currentSel(vId) {
        let obj = {};
        obj = this.assignees.find((item) => {
          return item.id === vId;
        });
        this.assignee = obj.name;
      },
      countdowm(timestamp, priorityId) {
        let self = this;
        let endTime = 0;
        if (priorityId == 'P001') {
          endTime = timestamp + 3600000 * 2; //2小时
        } else if (priorityId == 'P002') {
          endTime = timestamp + 3600000 * 8; //8小时
        } else if (priorityId == 'P003') {
          endTime = timestamp + 86400000 * 2; //2天
        } else if (priorityId == 'P004') {
          endTime = timestamp + 86400000 * 3; //3天
        }

        let timer = setInterval(function () {
          let nowTime = new Date();
          let t = endTime - nowTime.getTime();
          if (t > 0) {
            let day = Math.floor(t / 86400000);
            let hour = Math.floor((t / 3600000) % 24);
            let min = Math.floor((t / 60000) % 60);
            let sec = Math.floor((t / 1000) % 60);
            hour = hour < 10 ? "0" + hour : hour;
            min = min < 10 ? "0" + min : min;
            sec = sec < 10 ? "0" + sec : sec;
            let format = '';
            if (day > 0) {
              format = `${day}天${hour}小时${min}分${sec}秒`;
            }
            if (day <= 0 && hour > 0) {
              format = `${hour}小时${min}分${sec}秒`;
            }
            if (day <= 0 && hour <= 0) {
              format = `${min}分${sec}秒`;
            }
            self.timecontent = format;
          } else {
            clearInterval(timer);
            self.timecontent = self.endText;
            self._callback();
          }
        }, 1000);
      },
      _callback() {
        if (this.callback && this.callback instanceof Function) {
          this.callback(...this);
        }
      }
    }
  };

  function formatDateTime(value) {
    var date = new Date(value);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    if (month < 10) {
      month = "0" + month;
    }
    if (day < 10) {
      day = "0" + day;
    }
    if (minutes < 10) {
      minutes = "0" + minutes;
    }
    return year + "-" + month + "-" + day + " " + hours + ":" + minutes;
  };
</script>
<style scoped>
  .twoLineLabel {
    color: #49617b;
    font-weight: bold;
    font-size: 14px;
    border: 1px solid #dcdfe6;
    padding-left: 0px;
    padding-right: 0px;
  }

  .twoLineInput >>> .el-input__inner {
    color: #647080;
    border-radius: 0px;
    border: 0px;
  }

  .twoLineInput >>> .el-textarea__inner {
    color: #647080;
    border-radius: 0px;
    border: 0px;
    line-height: 1;
  }

  .sixLineLabel {
    color: #68717d;
    font-weight: bold;
    font-size: 14px;
    border: 1px solid #dcdfe6;
  }

  .sixLineInput >>> .el-input__inner {
    color: #647080;
    border-radius: 0px;
    border: 0px;
  }

  .bg-purple {
    background: #f3f3f3;
  }

  .bg-purple-light {
    background: #e0eefd;
  }

  .bg-purple-time {
    background: #e0eefd;
  }

  .divhis {
    border: 1px solid #8cc5ff;
    width: 650px;
    height: 200px;
    word-break: break-all;
  }

  .containerDiv {
    margin-top: 22px;
  }

  .containerDiv >>> .el-col {
    height: 40px;
  }

  .containerDiv >>> .element.style {
    padding-left: 0px;
    padding-right: 0px;
  }

  .containerDiv >>> .el-button--mini {
    margin-top: 6px;
  }

  .containerDiv >>> .el-button--mini {
    font-size: 14px;
  }

  .myForm {
    margin: 0px;
    padding: 0px;
    border: 1px #cccccc solid;
    border-radius: 4px;
    height: 100%;
  }

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
