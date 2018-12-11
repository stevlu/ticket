<template>
  <div style="margin-top: 22px">
    <el-tabs class="sysbasic" v-model="defaultTab" type="card">
      <el-tab-pane label="部门管理" name="depMana">
        <dep-mana></dep-mana>
      </el-tab-pane>
      <el-tab-pane label="权限组" name="menuRole">
        <menu-role></menu-role>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
  import MenuRole from './MenuRole.vue'
  import DepMana from './DepMana.vue'
  export default {
    data() {
      return {
        defaultTab: 'depMana'
      };
    },
    methods: {},
    components: {
      'menu-role': MenuRole,
      'dep-mana': DepMana
    }
  };
</script>
<style scoped>
  .sysbasic >>> .el-tabs__item {
    background-color:#fcfdfd;
    color:#3a3c41;
    border: #dbdcdf;
    border-radius: 4px;
  }
  .sysbasic >>> .el-tabs__item.is-active {
    background-color: #2c4eaf;
    color: #ffffff;
  }
</style>
