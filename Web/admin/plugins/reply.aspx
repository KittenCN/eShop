<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reply.aspx.cs" Inherits="Web.admin.plugins.reply" %>
<%@ Import namespace="Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="../../scripts/jquery/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<link  href="../../css/pagination.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
    });
</script>
    <title>在线留言</title>
</head>
<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>留言管理</span>
  <i class="arrow"></i>
  <span>在线留言</span>
</div>
<!--/导航栏-->
 <!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">查看留言</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
  <dl>
    <dt>联系人</dt>
    <dd><%=model.user_name %></dd>
  </dl>
  <dl>
    <dt>联系电话</dt>
    <dd><%=model.user_tel %></dd>
  </dl>
  <dl>
    <dt>联系QQ</dt>
    <dd><%=model.user_qq %></dd>
  </dl>
  <dl>
    <dt>电子邮箱</dt>
    <dd><%=model.user_email %></dd>
  </dl>
  <dl>
    <dt>留言时间</dt>
    <dd><%=model.add_time %></dd>
  </dl>
  <dl>
    <dt>留言标题</dt>
    <dd><%=model.title %></dd>
  </dl>
  <dl>
    <dt>留言内容</dt>
    <dd><%=model.content %></dd>
  </dl>
  <dl>
    <dt>回复留言</dt>
    <dd><asp:TextBox ID="txtReContent" runat="server" CssClass="input" TextMode="MultiLine" datatype="*" sucmsg=" " /></dd>
  </dl>
</div>
<!--/内容-->

<!--工具栏-->
<div class="page-footer">
  <div class="btn-list">
    <asp:Button ID="btnSubmit" runat="server" Text="回复留言" CssClass="btn" onclick="btnSubmit_Click" />
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
  </div>
  <div class="clear"></div>
</div>
<!--/工具栏-->
</form>
</body>
</html>
