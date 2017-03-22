<%@ Page Language="C#" AutoEventWireup="true" Inherits="Web.Plugin.Link.link" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by AoXiang Template Engine at 2013/12/10 2:28:15.
		本页面代码由AoXiang模板引擎生成于 2013/12/10 2:28:15. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>友情链接 - ");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/validate.css\" />\r\n<link type=\"text/css\" rel=\"stylesheet\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/pagination.css\" />\r\n<link rel=\"stylesheet\" href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/css/style.css\" />\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/lhgdialog/lhgdialog.js?skin=idialog\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n	//初始化表单\r\n	AjaxInitForm('link_form', 'btnSubmit', 1);\r\n});\r\n</");
	templateBuilder.Append("script>\r\n</head>\r\n\r\n<body>\r\n<!--Header-->\r\n");

	templateBuilder.Append("<div class=\"header\">\r\n  <div class=\"header_inner\">\r\n    <h1 class=\"logo\">\r\n      <a title=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.weburl));
	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</a>\r\n    </h1>\r\n    <ul class=\"nav\">\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">新闻资讯</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">购物商城</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片分享</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">资源下载</a></li>\r\n    </ul>\r\n    <div class=\"search\">\r\n      <input id=\"keywords\" name=\"keywords\" class=\"input\" type=\"text\" x-webkit-speech=\"\" autofocus=\"\" placeholder=\"输入回车搜索\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("search.aspx', '#keywords');return false};\" />\r\n      <input class=\"submit\" type=\"submit\" value=\"搜索\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" />\r\n    </div>\r\n    <ul class=\"menu\">\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("shopping","cart"));

	templateBuilder.Append("\">购物车");
	templateBuilder.Append(get_cart_quantity().ToString());

	templateBuilder.Append("件</a></li>\r\n      ");
	if (IsUserLogin())
	{

	templateBuilder.Append("\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a></li>\r\n      ");
	}
	else
	{

	templateBuilder.Append("\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a></li>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </ul>\r\n  </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"boxwrap\">\r\n  <div class=\"left710\">\r\n   <!--Content-->\r\n    <div class=\"content\">\r\n      <div class=\"meta\">\r\n        <h1 class=\"meta-tit\">友情链接</h1>\r\n      </div>\r\n      \r\n      <div class=\"line20\"></div>\r\n      <!--Link-->\r\n      <div class=\"links\">\r\n        <ul class=\"img\">\r\n          ");
	DataTable imgList = new Web.Plugin.Link.link().get_link_list(0, "is_image=1");

	int list1__loop__id=0;
	foreach(DataRow list1 in imgList.Rows)
	{
		list1__loop__id++;


	templateBuilder.Append("\r\n          <li><a target=\"_blank\" href=\"" + Utils.ObjectToStr(list1["site_url"]) + "\" title=\"" + Utils.ObjectToStr(list1["title"]) + "\"><img src=\"" + Utils.ObjectToStr(list1["img_url"]) + "\" width=\"88\" height=\"31\" /></a></li>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n        <ul class=\"txt\">\r\n          ");
	DataTable txtList = new Web.Plugin.Link.link().get_link_list(0, "is_image=0");

	int list2__loop__id=0;
	foreach(DataRow list2 in txtList.Rows)
	{
		list2__loop__id++;


	templateBuilder.Append("\r\n          <a target=\"_blank\" href=\"" + Utils.ObjectToStr(list2["site_url"]) + "\" title=\"" + Utils.ObjectToStr(list2["title"]) + "\">" + Utils.ObjectToStr(list2["title"]) + "</a> | \r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n        </ul>\r\n      </div>\r\n      <!--/Link-->\r\n      <div class=\"line10\"></div>\r\n     \r\n      <h3 class=\"base_tit\">申请链接<a name=\"Add\" id=\"Add\"></a></h3>\r\n      <div class=\"line10\"></div>\r\n      <form id=\"link_form\" name=\"link_form\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("plugins/link/ajax.ashx?action=add\">\r\n     <div class=\"form_box\">\r\n       <dl>\r\n         <dt>网站名称：</dt>\r\n         <dd><input id=\"txtTitle\" name=\"txtTitle\" type=\"text\" class=\"input txt\" datatype=\"*\" sucmsg=\" \" /><span class=\"Validform_checktip\">*需要申请友情链接的网站标题</span></dd>\r\n       </dl>\r\n       \r\n       <dl>\r\n         <dt>联系人：</dt>\r\n         <dd><input id=\"txtUserName\" name=\"txtUserName\" type=\"text\" class=\"input txt\" datatype=\"*\" sucmsg=\" \" /><span class=\"Validform_checktip\">*该网站联系人的姓名</span></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>联系电话：</dt>\r\n         <dd><input id=\"txtUserTel\" name=\"txtUserTel\" type=\"text\" class=\"input txt\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>电子邮箱：</dt>\r\n         <dd><input id=\"txtEmail\" name=\"txtEmail\" type=\"text\" class=\"input txt\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>链接网址：</dt>\r\n         <dd><input id=\"txtSiteUrl\" name=\"txtSiteUrl\" type=\"text\" class=\"input txt\" datatype=\"url\" sucmsg=\" \" /><span class=\"Validform_checktip\">*申请友情链接的网址</span></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>LOGO图片：</dt>\r\n         <dd><input id=\"txtImgUrl\" name=\"txtImgUrl\" type=\"text\" class=\"input txt\" /><span class=\"Validform_checktip\">网站链接的LOGO图片地址</span></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>验证码：</dt>\r\n         <dd>\r\n           <input id=\"txtCode\" name=\"txtCode\" type=\"text\" class=\"input small\" datatype=\"*\" sucmsg=\" \" />\r\n           <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" align=\"absmiddle\" /> 看不清楚？</a>\r\n           <span class=\"Validform_checktip\"></span>\r\n         </dd>\r\n       </dl>\r\n       <dl>\r\n         <dt></dt>\r\n         <dd>\r\n           <input name=\"btnSubmit\" type=\"submit\" value=\"申请链接\" class=\"btn_submit\" />\r\n         </dd>\r\n       </dl>\r\n     </div>\r\n     <div class=\"clear\"></div>\r\n     </form>\r\n     \r\n    </div>\r\n    <!--/Content-->\r\n  </div>\r\n  \r\n  <div class=\"left264\">\r\n    <!--Sidebar-->\r\n    <div class=\"sidebar\">\r\n      <h3>栏目导航</h3>\r\n      <ul>\r\n        ");
	DataTable contentlist = get_article_list("content", 0, 0, "status=0");

	int cdr__loop__id=0;
	foreach(DataRow cdr in contentlist.Rows)
	{
		cdr__loop__id++;


	templateBuilder.Append("\r\n        <li><a title=\"" + Utils.ObjectToStr(cdr["title"]) + "\" href=\"");
	templateBuilder.Append(linkurl("content",Utils.ObjectToStr(cdr["call_index"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr["title"]) + "</a></li>\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("feedback"));

	templateBuilder.Append("\">留言反馈</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("link"));

	templateBuilder.Append("\">友情链接</a></li>\r\n      </ul>\r\n      <h3>客户服务</h3>\r\n      <div class=\"section\">\r\n        <p>电话：13800138000</p>\r\n        <p>在线QQ：400830000</p>\r\n        <p>E-mail：info@net</p>\r\n        <p>新浪微博：http://weibo.com/AoXiang</p>\r\n      </div>\r\n    </div>\r\n    <!--/Sidebar-->\r\n    \r\n  </div>\r\n</div>\r\n\r\n<div class=\"clear\"></div>\r\n\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div class=\"footer\">\r\n  <div class=\"footer_inner\">\r\n    <div class=\"foot_nav\">\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首 页</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("content","about"));

	templateBuilder.Append("\">关于我们</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("news"));

	templateBuilder.Append("\">新闻资讯</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">购物商城</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("down"));

	templateBuilder.Append("\">资源下载</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("photo"));

	templateBuilder.Append("\">图片分享</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("feedback"));

	templateBuilder.Append("\">留言反馈</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("link"));

	templateBuilder.Append("\">友情链接</a>|\r\n      <a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a>|\r\n    </div>\r\n    <div class=\"clear\"></div>\r\n    <div class=\"copyright\">\r\n      <p>版权所有 动力启航软件工作室 粤ICP备11064298号 版本：V");
	templateBuilder.Append(Utils.GetVersion().ToString());

	templateBuilder.Append(" © Copyright 2009 - 2011. net. All Rights Reserved. <script src=\"http://s24.cnzz.com/stat.php?id=1996164&web_id=1996164&show=pic\" language=\"JavaScript\"></");
	templateBuilder.Append("script>&nbsp; </p>\r\n    </div>\r\n  </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
