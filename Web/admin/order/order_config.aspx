<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order_config.aspx.cs" Inherits="Web.admin.order.order_config" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>订单参数设置</title>
<script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
    });
</script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>订单设置</span>
  <i class="arrow"></i>
  <span>参数设置</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">基本参数设置</a></li>
      </ul>
    </div>
  </div>
</div>

<!--订单参数设置-->
<div class="tab-content">
  <dl>
    <dt>开启匿名购物</dt>
    <dd>
      <div class="rule-single-checkbox">
          <asp:CheckBox ID="anonymous" runat="server" />
      </div>
      <span class="Validform_checktip">*注意：开启匿名后无需登录即可下订单</span>
    </dd>
  </dl>
  <dl>
    <dt>订单确认通知</dt>
    <dd>
      <div class="rule-multi-radio">
        <asp:RadioButtonList ID="confirmmsg" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="0" Selected="True">关闭通知</asp:ListItem>
        <asp:ListItem Value="1">短信通知</asp:ListItem>
        <asp:ListItem Value="2">邮件通知</asp:ListItem>
        </asp:RadioButtonList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>确认模板别名</dt>
    <dd>
      <asp:TextBox ID="confirmcallindex" runat="server" CssClass="input normal" datatype="*" sucmsg=" " />
      <span class="Validform_checktip">*订单确认通知模板调用别名</span>
    </dd>
  </dl>
  <dl>
    <dt>订单送货通知</dt>
    <dd>
      <div class="rule-multi-radio">
        <asp:RadioButtonList ID="expressmsg" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="0" Selected="True">关闭通知</asp:ListItem>
        <asp:ListItem Value="1">短信通知</asp:ListItem>
        <asp:ListItem Value="2">邮件通知</asp:ListItem>
        </asp:RadioButtonList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>送货模板别名</dt>
    <dd>
      <asp:TextBox ID="expresscallindex" runat="server" CssClass="input normal" datatype="*" sucmsg=" " />
      <span class="Validform_checktip">*订单送货通知模板调用别名</span>
    </dd>
  </dl>
  <dl>
    <dt>订单完成通知</dt>
    <dd>
      <div class="rule-multi-radio">
        <asp:RadioButtonList ID="completemsg" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="0" Selected="True">关闭通知</asp:ListItem>
        <asp:ListItem Value="1">短信通知</asp:ListItem>
        <asp:ListItem Value="2">邮件通知</asp:ListItem>
        </asp:RadioButtonList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>完成模板别名</dt>
    <dd>
      <asp:TextBox ID="completecallindex" runat="server" CssClass="input normal" datatype="*" sucmsg=" " />
      <span class="Validform_checktip">*订单完成通知模板调用别名</span>
    </dd>
  </dl>
</div>
<!--/订单参数设置-->

<!--/内容-->

<!--工具栏-->
<div class="page-footer">
  <div class="btn-list">
    <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" onclick="btnSubmit_Click" />
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
  </div>
  <div class="clear"></div>
</div>
<!--/工具栏-->
</form>
</body>
</html>
