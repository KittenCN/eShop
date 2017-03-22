<%@ Page Language="C#" AutoEventWireup="true" Inherits="Web.Plugin.Feedback.feedback" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by AoXiang Template Engine at 2014/3/20 15:25:24.
		本页面代码由AoXiang模板引擎生成于 2014/3/20 15:25:24. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>留言反馈 - ");
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
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n$(function(){\r\n	//初始化发表评论表单\r\n	AjaxInitForm('feedback_form', 'btnSubmit', 1);\r\n});\r\n</");
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
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" />\r\n      <input class=\"submit\" type=\"submit\" value=\"搜索\" onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" />\r\n    </div>\r\n    <script type=\"text/javascript\">\r\n        $.ajax({\r\n            type: \"POST\",\r\n            url: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\n            dataType: \"json\",\r\n            timeout: 20000,\r\n            success: function (data, textStatus) {\r\n                if (data.status == 1) {\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a></li>');\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a></li>');\r\n                } else {\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a></li>');\r\n                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a></li>');\r\n                }\r\n            }\r\n        });\r\n    </");
	templateBuilder.Append("script>\r\n    <ul id=\"menu\" class=\"menu\">\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("content","contact"));

	templateBuilder.Append("\">联系我们</a></li>\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("shopping","cart"));

	templateBuilder.Append("\">购物车<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_cart_count\"></");
	templateBuilder.Append("script>件</a></li>\r\n    </ul>\r\n  </div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Header-->\r\n\r\n<div class=\"boxwrap\">\r\n  <div class=\"left710\">\r\n   <!--Content-->\r\n    <div class=\"content\">\r\n      <div class=\"meta\">\r\n        <h1 class=\"meta-tit\">留言反馈</h1>\r\n      </div>\r\n      \r\n      <!--留言列表-->\r\n      <div class=\"comment_box\">\r\n        <ol class=\"comment_list\">\r\n          ");
	DataTable plist = new Web.Plugin.Feedback.feedback().get_feedback_list(10, page, "", out totalcount);

	string pagelist = get_page_link(10, page, totalcount, "feedback", "__id__");

	int list__loop__id=0;
	foreach(DataRow list in plist.Rows)
	{
		list__loop__id++;


	templateBuilder.Append("\r\n          <li>\r\n            <div class=\"floor\">#");
	templateBuilder.Append((list__loop__id+10*(page-1)).ToString());

	templateBuilder.Append("</div>\r\n            <div class=\"inner\" style=\"margin-left:0;\">\r\n              <p>" + Utils.ObjectToStr(list["content"]) + "</p>\r\n              <div class=\"meta\">\r\n                <span class=\"blue\">" + Utils.ObjectToStr(list["user_name"]) + "</span>\r\n                <span class=\"time\">" + Utils.ObjectToStr(list["add_time"]) + "</span>\r\n              </div>\r\n            </div>\r\n            \r\n            ");
	if (Utils.ObjectToStr(list["reply_content"])!="")
	{

	templateBuilder.Append("\r\n            <div class=\"answer\" style=\"margin-left:0;\">\r\n              <div class=\"meta\">\r\n                <span class=\"right time\">" + Utils.ObjectToStr(list["reply_time"]) + "</span>\r\n                <span class=\"blue\">管理员回复：</span>\r\n              </div>\r\n              <p>" + Utils.ObjectToStr(list["reply_content"]) + "</p>\r\n            </div>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            \r\n          </li>\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n          \r\n        </ol>\r\n      </div>\r\n      <div class=\"line10\"></div>\r\n      <div class=\"flickr\">");
	templateBuilder.Append(Utils.ObjectToStr(pagelist));
	templateBuilder.Append("</div> <!--放置页码列表-->\r\n      <!--/留言列表-->\r\n      <div class=\"line10\"></div>\r\n     \r\n      <h3 class=\"base_tit\">发表留言<a name=\"Add\" id=\"Add\"></a></h3>\r\n      <div class=\"line10\"></div>\r\n      <form id=\"feedback_form\" name=\"feedback_form\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("plugins/feedback/ajax.ashx?action=add\">\r\n     <div class=\"form_box\">\r\n       <dl>\r\n         <dt>用户姓名：</dt>\r\n         <dd><input id=\"txtUserName\" name=\"txtUserName\" type=\"text\" class=\"input txt\" datatype=\"*\" sucmsg=\" \" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>联系电话：</dt>\r\n         <dd><input id=\"txtUserTel\" name=\"txtUserTel\" type=\"text\" class=\"input txt\" datatype=\"*0-20\" sucmsg=\" \" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>在线QQ：</dt>\r\n         <dd><input id=\"txtUserQQ\" name=\"txtUserQQ\" type=\"text\" class=\"input txt\" datatype=\"*0-20\" sucmsg=\" \" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>电子邮箱：</dt>\r\n         <dd><input id=\"txtUserEmail\" name=\"txtUserEmail\" type=\"text\" class=\"input txt\" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>留言标题：</dt>\r\n         <dd><input id=\"txtTitle\" name=\"txtTitle\" type=\"text\" class=\"input txt\" datatype=\"*2-100\" sucmsg=\" \" /></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>留言内容：</dt>\r\n         <dd><textarea id=\"txtContent\" name=\"txtContent\" class=\"input txt\" datatype=\"*\" sucmsg=\" \" style=\"width:350px;height:80px;\"></textarea></dd>\r\n       </dl>\r\n       <dl>\r\n         <dt>验证码：</dt>\r\n         <dd>\r\n           <input id=\"txtCode\" name=\"txtCode\" type=\"text\" class=\"input small\" datatype=\"*\" sucmsg=\" \" />\r\n           <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" align=\"absmiddle\" /> 看不清楚？</a>\r\n           <span class=\"Validform_checktip\"></span>\r\n         </dd>\r\n       </dl>\r\n       <dl>\r\n         <dt></dt>\r\n         <dd>\r\n           <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" value=\"发表留言\" class=\"btn_submit\" />\r\n         </dd>\r\n       </dl>\r\n     </div>\r\n     <div class=\"clear\"></div>\r\n     </form>\r\n     \r\n    </div>\r\n    <!--/Content-->\r\n  </div>\r\n  \r\n  <div class=\"left264\">\r\n    <!--Sidebar-->\r\n    <div class=\"sidebar\">\r\n      <h3>栏目导航</h3>\r\n      <ul>\r\n        ");
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
