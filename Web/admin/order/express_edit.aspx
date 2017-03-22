<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="express_edit.aspx.cs" Inherits="Web.admin.order.express_edit" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>编辑配送小区</title>
<script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
        //物流编码赋值
        $("#ddlExpressCode").change(function () {
            if ($(this).find("option:selected").attr("value") != "") {
                $("#txtExpressCode").val($(this).find("option:selected").attr("value"));
                $("#txtExpressCode").focus();
            }
        });
    });
</script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="express_list.aspx" class="back"><i></i><span>返回列表页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <a href="express_list.aspx"><span>配送小区</span></a>
  <i class="arrow"></i>
  <span>编辑配送小区</span>
</div>
<div class="line10"></div>
<!--/导航栏-->

<!--内容-->
<div class="content-tab-wrap">
  <div id="floatHead" class="content-tab">
    <div class="content-tab-ul-wrap">
      <ul>
        <li><a href="javascript:;" onclick="tabs(this);" class="selected">编辑配送小区信息</a></li>
      </ul>
    </div>
  </div>
</div>

<div class="tab-content">
  <dl>
    <dt>小区名称</dt>
    <dd><asp:TextBox ID="txtTitle" runat="server" CssClass="input normal" datatype="*2-100" sucmsg=" "></asp:TextBox> <span class="Validform_checktip">*配送小区的中文名称</span></dd>
  </dl>
  <dl>
    <dt>配送点名称</dt>
    <dd>
      <asp:TextBox ID="txtExpressCode" runat="server" CssClass="input normal" datatype="s0-100" sucmsg=" "></asp:TextBox>
      <div class="rule-single-select">
        <select id="ddlExpressCode" name="ddlExpressCode">
            <option value="一号配送点">一号配送点</option>
            <option value="二号配送点">二号配送点</option>
            <option value="三号配送点">三号配送点</option>
            <option value="四号配送点">四号配送点</option>
        </select>
      </div>
      
    </dd>
  </dl>
  <dl>
    <dt>小区地址</dt>
    <dd>
      <asp:TextBox ID="txtWebSite" runat="server" CssClass="input normal"  errormsg="请输入正确的小区地址" sucmsg=" "></asp:TextBox>
      <span class="Validform_checktip"></span>
    </dd>
  </dl>
  <dl>
    <dt>配送费用</dt>
    <dd>
      <asp:TextBox ID="txtExpressFee" runat="server" CssClass="input small" datatype="/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/" sucmsg=" ">0</asp:TextBox>
      <span class="Validform_checktip">*货币格式，单位为元</span>
    </dd>
  </dl>
  <dl>
    <dt>是否启用</dt>
    <dd>
      <div class="rule-single-checkbox">
          <asp:CheckBox ID="cbIsLock" runat="server" />
      </div>
      <span class="Validform_checktip">*不启用则不显示该配送小区</span>
    </dd>
  </dl>
  <dl>
    <dt>排序数字</dt>
    <dd>
      <asp:TextBox ID="txtSortId" runat="server" CssClass="input small" datatype="n" sucmsg=" ">99</asp:TextBox>
      <span class="Validform_checktip">*数字，越小越向前</span>
    </dd>
  </dl>
  <dl>
    <dt>描述说明</dt>
    <dd>
      <asp:TextBox ID="txtRemark" runat="server" CssClass="input normal" TextMode="MultiLine" />
      <span class="Validform_checktip">配送小区的描述说明，支持HTML代码</span>
    </dd>
  </dl>
</div>
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
