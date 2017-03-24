<%@ Page Language="C#" AutoEventWireup="true" Inherits="Web.UI.Page.shopping" ValidateRequest="false" %>
<%@ Import namespace="System.Collections.Generic" %>
<%@ Import namespace="System.Text" %>
<%@ Import namespace="System.Data" %>
<%@ Import namespace="Common" %>

<script runat="server">
override protected void OnInit(EventArgs e)
{

	/* 
		This page was created by AoXiang Template Engine at 2014-11-26 21:30:55.
		本页面代码由AoXiang模板引擎生成于 2014-11-26 21:30:55. 
	*/

	base.OnInit(e);
	StringBuilder templateBuilder = new StringBuilder(220000);
	templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n<title>购物中心－");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("</title>\r\n<link media=\"screen\" type=\"text/css\" href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/css/style.css\" rel=\"stylesheet\" />\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/lhgdialog/lhgdialog.js?skin=idialog\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/js/cart.js\"></");
	templateBuilder.Append("script>\r\n\r\n<link media=\"screen\" type=\"text/css\" rel=\"stylesheet\" href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/jquery-ui.min.css\">\r\n<link media=\"screen\" type=\"text/css\" rel=\"stylesheet\"  href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/css/common.min.css\">\r\n<link media=\"screen\" type=\"text/css\" rel=\"stylesheet\"  href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/maincolor_10.css\">\r\n<link media=\"screen\" type=\"text/css\" rel=\"stylesheet\"  href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/mainplugincolor_10.css\">\r\n<link media=\"screen\" type=\"text/css\" rel=\"stylesheet\"  href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/deputycolor_0.css\">\r\n<link media=\"screen\" type=\"text/css\" rel=\"stylesheet\"  href=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/bordercolor_2.css\" >\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/jquery-ui-1.11.1.custom.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/common.min.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\"  src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/jquery.filedownload.min.js\"></");
	templateBuilder.Append("script>\r\n\r\n</head>\r\n\r\n<body style=\"background-color: rgb(255, 255, 255);\">\r\n	<div id=\"main\">\r\n<!--Header-->\r\n");

	templateBuilder.Append("<script src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/logon_status.js\" type=\"text/javascript\"></");
	templateBuilder.Append("script>\r\n <script type=\"text/javascript\"  src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/js/base.js\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n    var Configure = {\r\n        Third_Jump: \"http://\",\r\n        ShowHeader: true,\r\n        ShowZhuyun: true,\r\n        ShowNav: true\r\n    };\r\n    var browser_now = new Date();\r\n    function is_logon() {\r\n        return logon_type != null;\r\n    }\r\n    function get_logon_type() {\r\n        return logon_type;\r\n    }\r\n    function get_logon_name() {\r\n        return logon_name;\r\n    }\r\n    function get_logon_now() {\r\n        return logon_now;\r\n    }\r\n    function get_real_now() {\r\n        var diff = browser_now.getTime() - logon_now.getTime();\r\n        var now = new Date();\r\n        return new Date(now.getTime() - diff);\r\n    }\r\n</");
	templateBuilder.Append("script>\r\n\r\n<div id=\"store_header\">\r\n	<div class=\"header\">\r\n		<div class=\"header_tt\">\r\n        <a class=\"Collect\" href=\"javascript:if(document.all){window.external.addFavorite('http://www.goodebuy.com','好宜买');}else if(window.sidebar){window.sidebar.addPanel('好宜买', 'http://www.goodebuy.com','');}\" title=\"加入收藏\">收藏本站</a>	\r\n            		    <script type=\"text/javascript\">\r\n            		        $.ajax({\r\n            		            type: \"POST\",\r\n            		            url: \"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=user_check_login\",\r\n            		            dataType: \"json\",\r\n            		            timeout: 20000,\r\n            		            success: function (data, textStatus) {\r\n            		                if (data.status == 1) {\r\n            		                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","exit"));

	templateBuilder.Append("\">退出</a></li>');\r\n            		                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("usercenter","index"));

	templateBuilder.Append("\">会员中心</a></li>');\r\n            		                } else {\r\n            		                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("register"));

	templateBuilder.Append("\">注册</a></li>');\r\n            		                    $(\"#menu\").append('<li><a href=\"");
	templateBuilder.Append(linkurl("login"));

	templateBuilder.Append("\">登录</a></li>');\r\n            		                }\r\n            		            }\r\n            		        });\r\n    </");
	templateBuilder.Append("script>\r\n            <ul class=\"header_login\" id=\"menu\" >\r\n      <li><a href=\"");
	templateBuilder.Append(linkurl("content","lianxiwomen"));

	templateBuilder.Append("\">联系我们</a></li>\r\n    \r\n			</ul>\r\n		</div>\r\n	</div>\r\n		<div id=\"header_content_box\"><div id=\"header_content\">\r\n</div></div>\r\n			<div class=\"header_style0\">\r\n				<div class=\"header_logo_content\">\r\n					<div class=\"header_logo_gox\">\r\n						<ul>\r\n							<li class=\"header_logo\" id=\"store_info_logo\"><a href=\"index.aspx\"><img alt=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("\" title=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webname));
	templateBuilder.Append("\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/logo.jpg\"></a></li>\r\n							<li class=\"header_search\" id=\"show_store_search\">\r\n								<div class=\"header_search_input patt_bg_search patt_border_search\">\r\n<input id=\"keywords\" name=\"keywords\" remind=\"\" value=\"\" type=\"text\" x-webkit-speech=\"\" autofocus=\"\" placeholder=\"输入回车搜索\" onkeydown=\"if(event.keyCode==13){SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');return false};\" />\r\n      <a onclick=\"SiteSearch('");
	templateBuilder.Append(linkurl("search"));

	templateBuilder.Append("', '#keywords');\" ><p id=\"search_button\" class=\"patt_font_search\">搜索</p></a>						\r\n								</div>\r\n							</li>\r\n							<li class=\"header_ad\" id=\"store_info_ad\">\r\n								<ul>\r\n										<li class=\"ad_phone_photo\"><img src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/ad_photo.png\"></li>\r\n										<li class=\"ad_phone\">0551-88888888</li>\r\n								</ul>\r\n							</li>\r\n						</ul>\r\n					</div>\r\n				</div>\r\n				<div class=\"header_navbox patt_bg_nav\">\r\n					<div class=\"header_nav\">\r\n						<div class=\"header_sort patt_bg_sort\">&nbsp;\r\n							<span>全部商品分类</span>\r\n							<div class=\"header_button_b\"></div>\r\n							<div class=\"Nav_TitleStyleBox\" style=\"position: absolute;top: 33px;width: 183px;left: -6px;display:none\">\r\n								<div class=\"nav_style1_main_content_border\">\r\n								<div class=\"nav_style1_main_content\">\r\n									<ul class=\"nav_style1_content nav_style1_color1\" style=\"cursor: default;\">\r\n         ");
	DataTable category_list33 = get_category_child_list("goods", 0);

	int cdr33__loop__id=0;
	foreach(DataRow cdr33 in category_list33.Rows)
	{
		cdr33__loop__id++;


	templateBuilder.Append("\r\n											<li class=\"class1 nav_style1_content_li\" class1_id=\"6461\"><p class=\"nav_p\"><a target=\"_blank\"  href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr33["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr33["title"]) + "</a></p><div class=\"nav_style1_button_arrow icon_nav_arrow\"></div></li>\r\n											");
	}	//end for if

	templateBuilder.Append("\r\n									</ul>\r\n         ");
	DataTable category_list44 = get_category_child_list("goods", 0);

	int cdr44__loop__id=0;
	foreach(DataRow cdr44 in category_list44.Rows)
	{
		cdr44__loop__id++;


	templateBuilder.Append("\r\n										<div class=\"nav_style1_sub patt_header_leftnav\" style=\"display: none;\">\r\n												<dl class=\"nav_style1_sub_class2\">\r\n													<dt class=\"class2\" class2_id=\"7524\"><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr44["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr44["title"]) + "</a></a></dt>\r\n													<dd>\r\n          ");
	DataTable category_list55 = get_category_child_list("goods", Utils.StrToInt(Utils.ObjectToStr(cdr44["id"]), 0));

	int cdr55__loop__id=0;
	foreach(DataRow cdr55 in category_list55.Rows)
	{
		cdr55__loop__id++;


	templateBuilder.Append("\r\n															<em class=\"class3\" class3_id=\"10006\"><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr55["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr55["title"]) + "</a></em>\r\n																");
	}	//end for if

	templateBuilder.Append("\r\n													</dd>\r\n												</dl>\r\n												\r\n										</div>\r\n									");
	}	//end for if

	templateBuilder.Append("\r\n								</div>\r\n								</div>\r\n							</div>\r\n						</div>\r\n						<div class=\"header_sortnav\" id=\"show_store_menu\">\r\n							<ul class=\"menu_hot\">\r\n\r\n         <li class=\"header_cheaked patt_bg_header_checked\"><a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">首页</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("goods"));

	templateBuilder.Append("\">积分商城</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("content","ruhexiadan"));

	templateBuilder.Append("\">购物流程</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("content","zoujinwomen"));

	templateBuilder.Append("\">关于我们</a></li>	\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("content","peisongshijian"));

	templateBuilder.Append("\">配送服务</a></li>\r\n        <li><a href=\"");
	templateBuilder.Append(linkurl("content","lianxiwomen"));

	templateBuilder.Append("\">联系我们</a></li>										\r\n							</ul>\r\n						</div>\r\n						<div class=\"header_cart_box\">\r\n							<div class=\"header_cart\"> <a href=\"");
	templateBuilder.Append(linkurl("shopping","cart"));

	templateBuilder.Append("\">购物车<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=view_cart_count\"></");
	templateBuilder.Append("script>件</a></div>\r\n							<div class=\"small_cart\"></div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n\r\n	<div id=\"show_store_nav\">\r\n			<div class=\"header_subnavbox\">\r\n				<div class=\"header_subnav_header\">\r\n					<div style=\"width:1190px;height:32px;overflow:hidden;position:relative;z-index:1\">\r\n					<ul class=\"header_subnav\" style=\"width: 792px;\">\r\n                    ");
	DataTable category_list22 = get_category_child_list("goods", 0);

	int cdr22__loop__id=0;
	foreach(DataRow cdr22 in category_list22.Rows)
	{
		cdr22__loop__id++;


	templateBuilder.Append("\r\n							<li class=\"subnav_li\"><a  class=\"class1\" class1_id=\"6461\" href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr22["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr22["title"]) + "</a><div class=\"header_button_a\"></div></li>\r\n			");
	}	//end for if

	templateBuilder.Append("\r\n					</ul>\r\n					</div>\r\n					<div class=\"header_subclass\">\r\n       ");
	DataTable category_list3 = get_category_child_list("goods", 0);

	int cdr3__loop__id=0;
	foreach(DataRow cdr3 in category_list3.Rows)
	{
		cdr3__loop__id++;


	templateBuilder.Append("\r\n							<div class=\"header_subclass_nav\" style=\"display: none;\">\r\n								<div class=\"header_subclass_nav_content\">\r\n									<div class=\"header_subclass_nav_goods patt_header_subnav\">\r\n										<dl class=\"header_subclass_nav_a\">\r\n											<dt><a class=\"class2\" class2_id=\"7524\" href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr3["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr3["title"]) + "</a></dt>\r\n											<dd>\r\n             ");
	DataTable category_list21 = get_category_child_list("goods", Utils.StrToInt(Utils.ObjectToStr(cdr3["id"]), 0));

	int cdr21__loop__id=0;
	foreach(DataRow cdr21 in category_list21.Rows)
	{
		cdr21__loop__id++;


	templateBuilder.Append("\r\n												<em><a class=\"class3\" class3_id=\"10006\" href=\"");
	templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr21["id"])));

	templateBuilder.Append("\">" + Utils.ObjectToStr(cdr21["title"]) + "</a></em>\r\n											    ");
	}	//end for if

	templateBuilder.Append("\r\n											</dd>\r\n										</dl>\r\n										\r\n									</div>\r\n								</div>\r\n							</div>\r\n              ");
	}	//end for if

	templateBuilder.Append("\r\n\r\n					</div>\r\n				</div>\r\n			</div>\r\n	</div>\r\n</div>");


	templateBuilder.Append("\r\n<!--/Header-->\r\n<div  style=\"height:10px;\"></div>\r\n\r\n<div class=\"boxwrap\">\r\n  <div class=\"cart_box\">\r\n    ");
	if (action=="cart")
	{

	templateBuilder.Append("\r\n    <!--购物车-->\r\n    <h1 class=\"main_tit\">\r\n      <span><a onclick=\"DeleteCart(this,'");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("','0');\" href=\"javascript:;\">清空购物车</a></span>\r\n      我的购物车<strong>Shopping Cart</strong>\r\n    </h1>\r\n    <div class=\"cart_step\">\r\n      <ul>\r\n        <li class=\"selected\"><span>1</span>放进购物车</li>\r\n        <li><span>2</span>填写订单信息</li>\r\n        <li class=\"last\"><span>3</span>支付/确定订单</li>\r\n      </ul>\r\n    </div>\r\n    <div class=\"line20\"></div>\r\n    \r\n    <table width=\"938\" border=\"0\" align=\"center\" cellpadding=\"8\" cellspacing=\"0\" class=\"cart_table\">\r\n      <tr>\r\n        <th width=\"64\"></th>\r\n        <th align=\"left\">商品名称</th>\r\n        <th width=\"100\" align=\"center\">颜色</th>\r\n        <th width=\"100\" align=\"center\">尺寸</th>\r\n        <th width=\"80\" align=\"center\">积分</th>\r\n        <th width=\"80\" align=\"center\">单价</th>\r\n        <th width=\"80\" align=\"center\">数量</th>\r\n        <th width=\"80\" align=\"center\">优惠</th>\r\n        <th width=\"100\" align=\"center\">金额小计</th>\r\n        <th width=\"100\" align=\"center\">积分小计</th>\r\n        <th width=\"50\" align=\"center\">操作</th>\r\n      </tr>\r\n      ");
	IList<Model.cart_items> ls1 = get_cart_list();

	foreach(Model.cart_items modelt in ls1)
	{

	templateBuilder.Append("\r\n      <tr>\r\n        <td><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.id));

	templateBuilder.Append("\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.img_url));
	templateBuilder.Append("\" class=\"img\" /></a></td>\r\n        <td><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.id));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("</a></td>\r\n        <td align=\"center\">\r\n          ");
	if (modelt.point>0)
	{
                    
	templateBuilder.Append("\r\n          +\r\n          ");
	}	//end for if
    templateBuilder.Append("\r\n          ");
	templateBuilder.Append(Utils.ObjectToStr(modelt.colorstring));
    templateBuilder.Append("</td>\r\n        <td align=\"center\">\r\n          ");
	templateBuilder.Append(Utils.ObjectToStr(modelt.sizestring));
	templateBuilder.Append("</td>\r\n        <td align=\"center\">\r\n          ");
	templateBuilder.Append(Utils.ObjectToStr(modelt.point));
	templateBuilder.Append("\r\n        </td>\r\n        <td align=\"center\">￥");
	templateBuilder.Append(Utils.ObjectToStr(modelt.price));
	templateBuilder.Append("<input name=\"goods_price\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.user_price));
	templateBuilder.Append("\" /></td>\r\n        <td align=\"center\">\r\n          <a href=\"javascript:;\" class=\"reduce\" title=\"减一\" onclick=\"CartComputNum(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.id));
    templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.colorstring));
    templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.sizestring));
	templateBuilder.Append("', -1);\">减一</a>\r\n          <input type=\"text\" name=\"goods_quantity\" class=\"input\" style=\"width:30px;text-align:center;ime-mode:Disabled;\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.quantity));
	templateBuilder.Append("\" onblur=\"CartAmountTotal(this, '");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.id));
    templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.colorstring));
    templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.sizestring));
	templateBuilder.Append("');\" onkeypress=\"return (/[\\d]/.test(String.fromCharCode(event.keyCode)))\" />\r\n          <a href=\"javascript:;\" class=\"subjoin\" title=\"加一\" onclick=\"CartComputNum(this,'");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.id));
    templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.colorstring));
    templateBuilder.Append("', '");
	templateBuilder.Append(Utils.ObjectToStr(modelt.sizestring));
	templateBuilder.Append("', 1);\">加一</a>\r\n        </td>\r\n        <td align=\"center\">￥<label name=\"discount_amount\">");
	templateBuilder.Append(((modelt.price-modelt.user_price)*modelt.quantity).ToString());

	templateBuilder.Append("</label></td>\r\n        <td align=\"center\"><font color=\"#FF0000\" size=\"2\">￥<label name=\"real_amount\">");
	templateBuilder.Append((modelt.user_price*modelt.quantity).ToString());

	templateBuilder.Append("</label></font></td>\r\n        <td align=\"center\">\r\n          <font color=\"#FF0000\" size=\"2\">\r\n            ");
	if (modelt.point>0)
	{

	templateBuilder.Append("\r\n            +\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            <label name=\"point_count\">");
	templateBuilder.Append((modelt.point*modelt.quantity).ToString());

	templateBuilder.Append("</label>\r\n          </font>\r\n        </td>\r\n        <td align=\"center\"><a onclick=\"DeleteCart(this,'");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("','");
	templateBuilder.Append(Utils.ObjectToStr(modelt.id));
    templateBuilder.Append("','");
	templateBuilder.Append(Utils.ObjectToStr(modelt.colorstring));
    templateBuilder.Append("','");
	templateBuilder.Append(Utils.ObjectToStr(modelt.sizestring));
	templateBuilder.Append("');\" href=\"javascript:;\">删除</a></td>\r\n      </tr>\r\n      ");
	}	//end for if

	if (ls1.Count<1)
	{

	templateBuilder.Append("\r\n      <tr>\r\n        <td colspan=\"9\">\r\n          <div class=\"msg_tips\">\r\n            <div class=\"ico warning\"></div>\r\n            <div class=\"msg\">\r\n              <strong>购物车没有商品！</strong>\r\n              <p>您的购物车为空，<a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">马上去购物</a>吧！</p>\r\n            </div>\r\n          </div>\r\n        </td>\r\n      </tr>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n      <tr>\r\n        <th colspan=\"9\" align=\"right\">\r\n          商品件数：");
	templateBuilder.Append(Utils.ObjectToStr(cartModel.total_quantity));
	templateBuilder.Append(" 件 &nbsp;&nbsp; 商品总金额（不含运费）：<font color=\"#FF0000\" size=\"2\">￥");
	templateBuilder.Append(Utils.ObjectToStr(cartModel.real_amount));
	templateBuilder.Append("</font>元 &nbsp;&nbsp; 总积分：<font color=\"#FF0000\" size=\"2\">");
	templateBuilder.Append(Utils.ObjectToStr(cartModel.total_point));
	templateBuilder.Append("分</font>\r\n        </th>\r\n      </tr>\r\n      \r\n	</table>\r\n    <div class=\"line20\"></div>\r\n    <div class=\"right\">\r\n      <a class=\"btn\" href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">继续购物</a>\r\n      ");
	if (cartModel.total_quantity==0)
	{

	templateBuilder.Append("\r\n      <a class=\"btn btn-gray\">不能结算</a>\r\n      ");
	}
	else
	{

	templateBuilder.Append("\r\n      <a class=\"btn btn-success marL10\" href=\"");
	templateBuilder.Append(linkurl("shopping","confirm"));

	templateBuilder.Append("\">马上去结算</a>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </div>\r\n    <div class=\"clear\"></div>\r\n    <!--/购物车-->\r\n    \r\n    ");
	}
	else if (action=="confirm")
	{

	templateBuilder.Append("\r\n    <link rel=\"stylesheet\" href=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("css/validate.css\" />\r\n	<script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\" src=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
	templateBuilder.Append("script>\r\n    <script type=\"text/javascript\">\r\n      $(function () {\r\n          //表单提交\r\n          AjaxInitForm('order_form', 'btnSubmit', 0);\r\n      });\r\n    </");
	templateBuilder.Append("script>\r\n    <!--结算中心-->\r\n    <h1 class=\"main_tit\">\r\n      <span><a href=\"");
	templateBuilder.Append(linkurl("shopping","cart"));

	templateBuilder.Append("\">返回</a></span>\r\n      确认订单信息<strong>Confirm order</strong>\r\n    </h1>\r\n    <div class=\"cart_step\">\r\n      <ul>\r\n        <li class=\"item\"><span>1</span>放进购物车</li>\r\n        <li class=\"selected\"><span>2</span>填写订单信息</li>\r\n        <li class=\"last\"><span>3</span>支付/确定订单</li>\r\n      </ul>\r\n    </div>\r\n    <div class=\"line20\"></div>\r\n    \r\n    <form name=\"order_form\" id=\"order_form\" url=\"");
	templateBuilder.Append(Utils.ObjectToStr(config.webpath));
	templateBuilder.Append("tools/submit_ajax.ashx?action=order_save\">\r\n    <h3 class=\"bar_tit\">1、收货信息</h3>\r\n    <div class=\"form_box\">\r\n      <dl>\r\n        <dt>收货人姓名：</dt>\r\n        <dd><input name=\"accept_name\" id=\"accept_name\" type=\"text\" class=\"input txt wide\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.nick_name));
	templateBuilder.Append("\" datatype=\"s2-20\" sucmsg=\" \" /><span class=\"Validform_checktip\">*收货人姓名</span></dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>收货地址：</dt>\r\n        <dd><input name=\"address\" id=\"address\" type=\"text\" class=\"input txt\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.address));
	templateBuilder.Append("\" datatype=\"*2-100\" sucmsg=\" \" style=\"width:300px;\" /><span class=\"Validform_checktip\">*收货人的详细地址</span></dd>\r\n      </dl>\r\n      <dl style=\"display:none;\">\r\n        <dt>邮政编码：</dt>\r\n        <dd><input name=\"post_code\" id=\"post_code\" type=\"txt\" class=\"input txt\" /><span class=\"Validform_checktip\">所在地区的邮政编码，非必填</span></dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>手机号码：</dt>\r\n        <dd><input name=\"mobile\" id=\"mobile\" type=\"text\" class=\"input txt\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.mobile));
	templateBuilder.Append("\" datatype=\"m\" sucmsg=\" \" /><span class=\"Validform_checktip\">*收货人的手机号码</span></dd>\r\n      </dl>\r\n      <dl>\r\n        <dt>联系电话：</dt>\r\n        <dd><input name=\"telphone\" id=\"telphone\" type=\"text\" class=\"input txt\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(userModel.telphone));
	templateBuilder.Append("\" /><span class=\"Validform_checktip\">收货人的联系电话，非必填</span></dd>\r\n      </dl>\r\n    </div>\r\n    \r\n    <div class=\"line20\"></div>\r\n    <h3 class=\"bar_tit\">2、支付方式</h3>\r\n    <ul class=\"item_box\">\r\n      ");
	DataTable list1 = get_payment_list(0, "is_lock=0");

	templateBuilder.Append(" <!--取得一个DataTable-->\r\n      ");
	int dr1__loop__id=0;
	foreach(DataRow dr1 in list1.Rows)
	{
		dr1__loop__id++;


	decimal poundage_amount = get_payment_poundage_amount(Utils.StrToInt(Utils.ObjectToStr(dr1["id"]), 0));

	templateBuilder.Append("\r\n      <li>\r\n        ");
	if (dr1__loop__id==(list1.Rows.Count))
	{

	templateBuilder.Append("\r\n        <label><input name=\"payment_id\" type=\"radio\" onclick=\"PaymentAmountTotal(this);\" value=\"" + Utils.ObjectToStr(dr1["id"]) + "\" datatype=\"*\" sucmsg=\" \" /><input name=\"payment_price\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(poundage_amount));
	templateBuilder.Append("\" />" + Utils.ObjectToStr(dr1["title"]) + "\r\n        ");
	}
	else
	{

	templateBuilder.Append("\r\n        <label><input name=\"payment_id\" type=\"radio\" onclick=\"PaymentAmountTotal(this);\" value=\"" + Utils.ObjectToStr(dr1["id"]) + "\" /><input name=\"payment_price\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(poundage_amount));
	templateBuilder.Append("\" />" + Utils.ObjectToStr(dr1["title"]) + "\r\n        ");
	}	//end for if

	templateBuilder.Append("\r\n        <em>手续费：");
	templateBuilder.Append(Utils.ObjectToStr(poundage_amount));
	templateBuilder.Append("元</em></label>\r\n      </li>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </ul>\r\n    \r\n<!--    <div class=\"line20\"></div>\r\n    <h3 class=\"bar_tit\">3、配送小区</h3>-->\r\n    <ul class=\"item_box\" style=\"display:none;\">\r\n      ");
	DataTable list2 = get_express_list(0, "is_lock=0");

	templateBuilder.Append(" <!--取得一个DataTable-->\r\n      ");
	int dr2__loop__id=0;
	foreach(DataRow dr2 in list2.Rows)
	{
		dr2__loop__id++;


	templateBuilder.Append("\r\n      <li>\r\n      ");
	if (userModel.express_id==Utils.StrToInt(Utils.ObjectToStr(dr2["id"]), 0))
	{

	templateBuilder.Append("\r\n     <label><input name=\"express_id\" type=\"radio\" onclick=\"FreightAmountTotal(this);\" value=\"" + Utils.ObjectToStr(dr2["id"]) + "\"  checked /><input name=\"express_price\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr2["express_fee"]) + "\" />" + Utils.ObjectToStr(dr2["title"]) + "\r\n     ");
	}
	else
	{

	templateBuilder.Append("    \r\n     <label><input name=\"express_id\" type=\"radio\" onclick=\"FreightAmountTotal(this);\"   value=\"" + Utils.ObjectToStr(dr2["id"]) + "\"  /><input name=\"express_price\" type=\"hidden\" value=\"" + Utils.ObjectToStr(dr2["express_fee"]) + "\" />" + Utils.ObjectToStr(dr2["title"]) + "\r\n   ");
	}	//end for if

	templateBuilder.Append("\r\n        <em>费用：" + Utils.ObjectToStr(dr2["express_fee"]) + "元</em></label>\r\n      </li>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </ul>\r\n    \r\n    <div class=\"line20\"></div>\r\n    <h3 class=\"bar_tit\">3、商品清单</h3>\r\n    <table width=\"938\" border=\"0\" align=\"center\" cellpadding=\"8\" cellspacing=\"0\" class=\"cart_table\">\r\n      <tr>\r\n        <th width=\"64\"></th>\r\n        <th align=\"left\">商品名称</th>\r\n        <th width=\"80\" align=\"center\">积分</th>\r\n        <th width=\"80\" align=\"center\">单价</th>\r\n        <th width=\"80\" align=\"center\">数量</th>\r\n        <th width=\"80\" align=\"center\">优惠</th>\r\n        <th width=\"100\" align=\"center\">金额小计</th>\r\n        <th width=\"100\" align=\"center\">积分小计</th>\r\n      </tr>\r\n      ");
	IList<Model.cart_items> ls2 = get_cart_list();

	foreach(Model.cart_items modelt in ls2)
	{

	templateBuilder.Append("\r\n      <tr>\r\n        <td><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.id));

	templateBuilder.Append("\"><img src=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.img_url));
	templateBuilder.Append("\" class=\"img\" /></a></td>\r\n        <td><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("goods_show",modelt.id));

	templateBuilder.Append("\">");
	templateBuilder.Append(Utils.ObjectToStr(modelt.title));
	templateBuilder.Append("</a></td>\r\n        <td align=\"center\">\r\n          ");
	if (modelt.point>0)
	{

	templateBuilder.Append("\r\n          +\r\n          ");
	}	//end for if

	templateBuilder.Append("\r\n          ");
	templateBuilder.Append(Utils.ObjectToStr(modelt.point));
	templateBuilder.Append("\r\n        </td>\r\n        <td align=\"center\">￥");
	templateBuilder.Append(Utils.ObjectToStr(modelt.price));
	templateBuilder.Append("<input name=\"goods_price\" type=\"hidden\" value=\"");
	templateBuilder.Append(Utils.ObjectToStr(modelt.user_price));
	templateBuilder.Append("\" /></td>\r\n        <td align=\"center\">");
	templateBuilder.Append(Utils.ObjectToStr(modelt.quantity));
	templateBuilder.Append("</td>\r\n        <td align=\"center\">￥<label name=\"discount_amount\">");
	templateBuilder.Append(((modelt.price-modelt.user_price)*modelt.quantity).ToString());

	templateBuilder.Append("</label></td>\r\n        <td align=\"center\"><font color=\"#FF0000\" size=\"2\">￥<label name=\"real_amount\">");
	templateBuilder.Append((modelt.user_price*modelt.quantity).ToString());

	templateBuilder.Append("</label></font></td>\r\n        <td align=\"center\">\r\n          <font color=\"#FF0000\" size=\"2\">\r\n            ");
	if (modelt.point>0)
	{

	templateBuilder.Append("\r\n            +\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n            <label name=\"point_count\">");
	templateBuilder.Append((modelt.point*modelt.quantity).ToString());

	templateBuilder.Append("</label>\r\n            </font>\r\n        </td>\r\n      </tr>\r\n      ");
	}	//end for if

	if (ls2.Count<1)
	{

	templateBuilder.Append("\r\n      <tr>\r\n        <td colspan=\"8\">\r\n          <div class=\"msg_tips\">\r\n            <div class=\"ico warning\"></div>\r\n            <div class=\"msg\">\r\n              <strong>购物车没有商品！</strong>\r\n              <p>您的购物车为空，<a href=\"");
	templateBuilder.Append(linkurl("index"));

	templateBuilder.Append("\">马上去购物</a>吧！</p>\r\n            </div>\r\n          </div>\r\n        </td>\r\n      </tr>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n	</table>\r\n    \r\n    <div class=\"line20\"></div>\r\n    <h3 class=\"bar_tit\">4、结算信息</h3>\r\n    <div>\r\n      <div class=\"left\">\r\n        <h4>订单留言<span>字数控制在100个字符内</span></h4>\r\n        <textarea name=\"message\" class=\"input\" style=\"width:250px;height:35px;\"></textarea>\r\n      </div>\r\n      \r\n      <div class=\"right\" style=\"text-align:right;line-height:40px;\">\r\n        商品件数：<font color=\"#FF0000\">");
	templateBuilder.Append(Utils.ObjectToStr(cartModel.total_quantity));
	templateBuilder.Append("</font> 件 &nbsp; &nbsp;&nbsp;总积分：<font color=\"#FF0000\">");
	templateBuilder.Append(Utils.ObjectToStr(cartModel.total_point));
	templateBuilder.Append("</font> 分 &nbsp; &nbsp;&nbsp;商品金额：<font color=\"#FF0000\">￥<label id=\"goods_amount\">");
	templateBuilder.Append(Utils.ObjectToStr(cartModel.real_amount));
	templateBuilder.Append("</label></font>&nbsp; &nbsp;+ &nbsp; 运费：<font color=\"#FF0000\">￥<label id=\"express_fee\">0.00</label></font>&nbsp; &nbsp;+ &nbsp; 支付手续费：<font color=\"#FF0000\">￥<label id=\"payment_fee\">0.00</label></font>\r\n        \r\n        <br />\r\n        <b class=\"font18\">应付总金额：<font color=\"#FF0000\">￥<label id=\"order_amount\">");
	templateBuilder.Append(Utils.ObjectToStr(cartModel.real_amount));
	templateBuilder.Append("</label></font></b>\r\n      </div>\r\n    </div>\r\n\r\n    <div class=\"line20\"></div>\r\n    <div class=\"right\">\r\n      <a class=\"btn\" href=\"");
	templateBuilder.Append(linkurl("shopping","cart"));

	templateBuilder.Append("\">返回修改</a>\r\n      ");
	if (get_cart_quantity()>0)
	{

	templateBuilder.Append("\r\n      <input id=\"btnSubmit\" name=\"btnSubmit\" type=\"submit\" value=\"确认提交\" class=\"btn btn-success marL10\" />\r\n      ");
	}
	else
	{

	templateBuilder.Append("\r\n      <a class=\"btn btn-gray marL10\">确认提交</a>\r\n      ");
	}	//end for if

	templateBuilder.Append("\r\n    </div>\r\n    <div class=\"clear\"></div>\r\n    <!--/结算中心-->\r\n    ");
	}	//end for if

	templateBuilder.Append("\r\n  </div>\r\n</div>\r\n\r\n<div class=\"clear\"></div>\r\n</div>\r\n<!--Footer-->\r\n");

	templateBuilder.Append("<div id=\"footer\">\r\n		<div id=\"store_footer_box\">\r\n	<div class=\"footer-box\">\r\n			<ul class=\"footer\">\r\n\r\n        ");
	DataTable category_listfoot1 = get_category_child_list("content", 0);

	int cdrfoot1__loop__id=0;
	foreach(DataRow cdrfoot1 in category_listfoot1.Rows)
	{
		cdrfoot1__loop__id++;


	templateBuilder.Append("\r\n				<li class=\"footer_firstlist\">\r\n					<dl class=\"footer_list_title\">\r\n						<dt>" + Utils.ObjectToStr(cdrfoot1["title"]) + "</dt>\r\n            ");
	DataTable category_listfoot2 = get_category_child_list("content", Utils.StrToInt(Utils.ObjectToStr(cdrfoot1["id"]), 0));

	int cdrfoot2__loop__id=0;
	foreach(DataRow cdrfoot2 in category_listfoot2.Rows)
	{
		cdrfoot2__loop__id++;


	templateBuilder.Append("\r\n						<dd><a target=\"_blank\" href=\"");
	templateBuilder.Append(linkurl("content",Utils.ObjectToStr(cdrfoot2["call_index"])));

	templateBuilder.Append("\" rel=\"nofollow\">" + Utils.ObjectToStr(cdrfoot2["title"]) + "</a></dd>\r\n            ");
	}	//end for if

	templateBuilder.Append("\r\n					</dl>\r\n				</li>\r\n       ");
	}	//end for if

	templateBuilder.Append("\r\n\r\n			</ul>\r\n	</div>\r\n	<div class=\"footer_copyright\" id=\"store_footer\">\r\n		<div id=\"footer_content\">\r\n        <div style=\"text-align:center;\">\r\n        <div class=\"links\" style=\"margin:0px;padding:0px;color:#666666;font-family:Arial, Verdana, 宋体;text-align:center;white-space:normal;background-color:#FFFFFF;\">\r\n        <br />\r\n        <p align=\"center\" style=\"orphans:2;white-space:normal;widows:2;background-color:#FFFFFF;margin-top:0px;margin-bottom:0px;color:#666666;font-family:&#39;Microsoft YaHei&#39;, SimSun, Arial;padding:0px;\"><span style=\"outline:none;text-decoration:none;color:#666666;margin:0px;padding:0px;font-family:&#39;Microsoft YaHei&#39;;line-height:2;font-size:12px;\">ICP备案号： Copyright © 2014&nbsp;</span><span style=\"margin:0px;padding:0px;font-family:&#39;Microsoft YaHei&#39;;line-height:2;\"><span style=\"color:#666666;font-size:12px;\">All Rights Reserved </span>\r\n <span style=\"color:#666666;font-size:12px;\">&nbsp;</span></span><span style=\"margin:0px;padding:0px;font-family:&#39;Microsoft YaHei&#39;;line-height:2;color:#666666;font-size:12px;\">版权所有,违者必究</span> </p><p align=\"center\" style=\"orphans:2;white-space:normal;widows:2;background-color:#FFFFFF;margin-top:0px;margin-bottom:0px;color:#666666;font-family:&#39;Microsoft YaHei&#39;, SimSun, Arial;padding:0px;\"><img src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/wKgJNFIjQWqAJKM9AAAIu06yUwg699.png\" style=\"border-style:none;vertical-align:middle;margin:0px;padding:0px;\"><span style=\"color:#666666;font-size:12px;\">&nbsp;</span><img title=\"网站备案\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/wKgJNFIhXSiAHPFHAAAGom5QmAk433.png\" height=\"50\" width=\"110\" style=\"border-style:none;vertical-align:middle;margin:0px;padding:0px;\"><span style=\"color:#666666;font-size:12px;\">&nbsp;&nbsp;</span><img src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/wKgJNFIy2qyAEa3yAAAMqg2PFik097.jpg\" style=\"border-style:none;vertical-align:middle;margin:0px;padding:0px;\"><span style=\"color:#666666;font-size:12px;\">&nbsp;</span><img title=\"网银\" src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/wKgJNFIhXS-AVNvhAAAJ3K_rPvM818.png\" height=\"50\" width=\"140\" style=\"border-style:none;vertical-align:middle;margin:0px;padding:0px;\"><span style=\"color:#666666;font-size:12px;\">&nbsp;&nbsp;</span><span style=\"color:#666666;font-size:12px;\">&nbsp;</span></p><p align=\"center\" style=\"orphans:2;white-space:normal;widows:2;background-color:#FFFFFF;margin-top:0px;margin-bottom:0px;color:#666666;font-family:&#39;Microsoft YaHei&#39;, SimSun, Arial;padding:0px;\"><span style=\"margin:0px;padding:0px;font-family:&#39;Microsoft YaHei&#39;;line-height:2;color:#666666;font-size:12px;\">技术支持：&nbsp;</span><span style=\"outline:none;margin:0px;padding:0px;font-family:&#39;Microsoft YaHei&#39;;line-height:2;\"><span style=\"outline:none;text-decoration:none;color:#666666;margin:0px;padding:0px;font-size:12px;\"><a href=\"http://www.olshine.com/\" target=\"_blank\" style=\"outline:none;text-decoration:none;color:#2A586F;margin:0px;padding:0px;\"><span style=\"color:#666666;\">奥祥科技</span></a></span></span> </p></div></div></div>\r\n	</div>\r\n</div>\r\n</div>  \r\n\r\n<script src=\"");
	templateBuilder.Append("/templates/green");
	templateBuilder.Append("/images/header.js\" type=\"text/javascript\"></");
	templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n    show_store_nav();\r\n</");
	templateBuilder.Append("script>\r\n\r\n");


	templateBuilder.Append("\r\n<!--/Footer-->\r\n</body>\r\n</html>\r\n");
	Response.Write(templateBuilder.ToString());
}
</script>
