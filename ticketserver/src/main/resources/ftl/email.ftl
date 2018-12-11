<html lang="en">
 <head> 
  <meta charset="utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" /> 
  <title>Ticket信息邮件通知</title> 
  <style>
a:link {
	color: 409efe;
	font-size: 12px;
} /* 未被访问的链接 蓝色 */
a:visited {
	color: #409efe;
	font-size: 12px;
} /* 已被访问过的链接 蓝色 */
a:hover {
	color: #409efe;
	font-size: 12px;
} /* 鼠标悬浮在上的链接 蓝色 */
a:active {
	color: #409efe;
	font-size: 12px;
} /* 鼠标点中激活链接 蓝色 */
</style> 
 </head> 
 <body style="margin: 0 auto;"> 
  <div id="table-content" style="width: 885px; margin: 0 auto; border: 1px #ebebeb solid; padding: 10px;"> 
   <table align="center" cellpadding="0" cellspacing="0" id="tg" style="border-collapse: collapse; border: 0px; width: 885px; background-color: #f4f4f4;" name="tg"> 
    <tbody> 
     <tr> 
      <td colspan="6" bgcolor="#e5edf5" id="6_0"><img src='cid:mailTopJpg' width="885" height="150" /></td> 
     </tr> 
     <tr> 
      <td colspan="6" bgcolor="#FFFFFF" id="6_2"> 
       <table border="1" align="center" cellpadding="0" cellspacing="0" class="tg" id="tg2" style="border-collapse: collapse; width: 885px; border: 0px;" name="tg"> 
        <colgroup> 
         <col style="width: 110px; border: 0px;" /> 
         <col style="width: 110px; border: 0px;" /> 
         <col style="width: 110px; border: 0px;" /> 
         <col style="width: 110px; border: 0px;" /> 
         <col style="width: 110px; border: 0px;" /> 
         <col style="width: 110px; border: 0px;" /> 
        </colgroup> 
        <tbody> 
         <tr> 
          <td height="5" colspan="6" style="border: 0px;"></td> 
         </tr> 
         <tr> 
          <td colspan="6" align="center" bgcolor="#FFFFFF" style="font-size: 12px; height: 28px; color: #bbbbbb; border: 0px;">客户中心受理工单如下，需要您响应处理，请Chrome/Edge/Firefox点击<a href="www.stevlu.com" style="padding: 0px 5px;">链接</a>登陆后进入工单系统维护后续信息 </td> 
         </tr> 
         <!--  <tr style="height:20px;">
        <td id="1_0"></td>
        <td id="1_1">订单号</td>
        <td id="1_2" style="border-bottom:#000000">120130988890</td>
        <td id="1_3" style="text-align:center;">订单客户</td>
        <td id="1_4" style="border-bottom:#000000">软件公司</td>
        <td id="1_5" style="border-bottom:#000000">软件公司</td>
        <td id="1_6"></td>
       </tr>
       <tr style="height:20px;">
        <td id="2_0" style="text-align:center;"></td>
        <td id="2_1">订单金额</td>
        <td id="2_2" style="border-bottom:#000000">70.0</td>
        <td id="2_3"></td>
        <td id="2_4"></td>
        <td id="2_5"></td>
        <td id="2_6"></td>
       </tr>  --> 
         <tr style="height: 5px;"> 
          <td id="3_0" style="border: 0px;"></td> 
          <td id="3_1" style="border: 0px;"></td> 
          <td id="3_2" style="border: 0px;"></td> 
          <td id="3_3" style="border: 0px;"></td> 
          <td id="3_4" style="border: 0px;"></td> 
          <td id="3_5" style="border: 0px;"></td> 
         </tr> 
         <tr style="height: 32px; line-height: 32px; font-size: 13px;"> 
          <td colspan="1" align="left" bgcolor="#69717c" id="4_0" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">工单编号</td> 
          <td colspan="1" align="left" bgcolor="#69717c" id="4_1" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">优先级</td> 
          <td colspan="1" align="left" bgcolor="#69717c" id="4_2" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">创建时间</td> 
          <td colspan="1" align="left" bgcolor="#69717c" id="4_3" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">VIP</td> 
          <td colspan="2" align="left" bgcolor="#69717c" id="4_4" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">工单状态</td> 
         </tr> 
         <tr style="height: 32px; line-height: 32px; font-size: 13px;"> 
          <td id="5_0" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${logId}</td> 
          <td id="5_1" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${priorityId}</td> 
          <td id="5_2" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${emailCreatedDate}</td> 
          <td id="5_3" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${vipId}</td> 
          <td id="5_2" colspan="2" style="padding-left: 15px; border: #d2d6dd solid 1px;">${status}</td> 
         </tr> 
         <tr style="height: 32px; line-height: 32px; font-size: 13px;"> 
          <td id="6_" colspan="6" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">客户信息</td> 
         </tr> 
         <tr style="height: 32px; line-height: 32px; font-size: 13px;"> 
          <td id="5_0" colspan="1" style="padding-left: 15px; background: #eff6fd; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">客户姓名</td> 
          <td id="5_1" colspan="1" style="padding-left: 15px; background: #eff6fd; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">客户邮箱</td> 
          <td id="5_2" colspan="1" style="padding-left: 15px; background: #eff6fd; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">客户手机</td> 
          <td id="5_3" colspan="1" style="padding-left: 15px; background: #eff6fd; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">客户组织</td> 
          <td id="5_4" colspan="2" style="padding-left: 15px; background: #eff6fd; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid;">客户座机</td> 
         </tr> 
         <tr style="height: 32px; line-height: 32px; font-size: 13px;"> 
          <td id="5_0" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${customerName}</td> 
          <td id="5_1" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${email}</td> 
          <td id="5_2" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${mobile}</td> 
          <td id="5_3" colspan="1" style="padding-left: 15px; border: #d2d6dd solid 1px;">${customerId}</td> 
          <td id="5_4" colspan="2" style="padding-left: 15px; border: #d2d6dd solid 1px;">${tel}</td> 
         </tr> 
         <tr style="height: 32px; line-height: 32px; font-size: 13px;"> 
          <td id="7_0" colspan="6" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid; font-size: 13px;">问题概要</td> 
         </tr> 
         <tr style="height: 32px; line-height: 32px; font-size: 13px;"> 
          <td id="8_0" colspan="6" style="padding-left: 15px; border: #d2d6dd solid 1px;">${title}</td> 
         </tr> 
         <tr style="height: 150px; line-height: 32px; font-size: 13px;"> 
          <td id="100_0" colspan="1" style="padding-left: 15px; background: #d9e8f8; color: #68707b; font-weight: bold; border: 1px #d2d6dd solid; font-size: 13px; height: 32px; line-height: 32px;">问题描述</td> 
          <td id="100_1" colspan="5" style="padding-left: 15px; border: #d2d6dd solid 1px;">${describehis}</td> 
         </tr> 
        </tbody> 
       </table> </td> 
     </tr> 
    </tbody> 
   </table> 
  </div>  
 </body>
</html>