<%@ Page Language="C#" AutoEventWireup="true" Inherits="Web.UI.Page.article_show" ValidateRequest="false" %>
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
        templateBuilder.Append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
        string category_title = get_category_title(model.category_id,"商品介绍");

        templateBuilder.Append("\r\n<title>");
        templateBuilder.Append(Utils.ObjectToStr(model.title));
        templateBuilder.Append(" - ");
        templateBuilder.Append(Utils.ObjectToStr(category_title));
        templateBuilder.Append(" - ");
        templateBuilder.Append(Utils.ObjectToStr(config.webname));
        templateBuilder.Append("</title>\r\n<meta content=\"");
        templateBuilder.Append(Utils.ObjectToStr(model.seo_keywords));
        templateBuilder.Append("\" name=\"keywords\" />\r\n<meta content=\"");
        templateBuilder.Append(Utils.ObjectToStr(model.seo_description));
        templateBuilder.Append("\" name=\"description\" />\r\n<link media=\"screen\" type=\"text/css\" href=\"");
        templateBuilder.Append("/templates/green");
        templateBuilder.Append("/css/style.css\" rel=\"stylesheet\">\r\n<script type=\"text/javascript\" src=\"");
        templateBuilder.Append(Utils.ObjectToStr(config.webpath));
        templateBuilder.Append("scripts/jquery/jquery-1.10.2.min.js\"></");
        templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
        templateBuilder.Append(Utils.ObjectToStr(config.webpath));
        templateBuilder.Append("scripts/jquery/jquery.jqzoom.js\"></");
        templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
        templateBuilder.Append("/templates/green");
        templateBuilder.Append("/js/base.js\"></");
        templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
        templateBuilder.Append("/templates/green");
        templateBuilder.Append("/js/picture.js\"></");
        templateBuilder.Append("script>\r\n<script type=\"text/javascript\" src=\"");
        templateBuilder.Append("/templates/green");
        templateBuilder.Append("/js/cart.js\"></");
        templateBuilder.Append("script>\r\n<script type=\"text/javascript\">\r\n	$(function(){\r\n		tabs('#goodsTabs','click');\r\n		//智能浮动层\r\n		$(\"#tab_head\").smartFloat();\r\n	});\r\n</");
        templateBuilder.Append("script>\r\n<link media=\"screen\" type=\"text/css\" rel=\"stylesheet\" href=\"");
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
        }   //end for if

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
            }   //end for if

            templateBuilder.Append("\r\n													</dd>\r\n												</dl>\r\n												\r\n										</div>\r\n									");
        }   //end for if

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
        }   //end for if

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
            }   //end for if

            templateBuilder.Append("\r\n											</dd>\r\n										</dl>\r\n										\r\n									</div>\r\n								</div>\r\n							</div>\r\n              ");
        }   //end for if

        templateBuilder.Append("\r\n\r\n					</div>\r\n				</div>\r\n			</div>\r\n	</div>\r\n</div>");


        templateBuilder.Append("\r\n<!--/Header-->\r\n<div  style=\"height:10px;\"></div>\r\n\r\n\r\n<div class=\"boxwrap\">\r\n  <div class=\"left710\">\r\n   <!--Left-->\r\n    <div class=\"main_box\">\r\n      ");
        string category_nav = get_category_menu("goods_list", model.category_id);

        templateBuilder.Append("\r\n      <dl class=\"head green\">\r\n        <dd>\r\n          <span>当前位置：<a href=\"");
        templateBuilder.Append(linkurl("index",""));

        templateBuilder.Append("\">首页 </a>");
        templateBuilder.Append(Utils.ObjectToStr(category_nav));
        templateBuilder.Append("</span>\r\n        </dd>\r\n      </dl>\r\n      <div class=\"line20\"></div>\r\n      \r\n      <!--商品图片-->\r\n      <div class=\"left294\">\r\n        <!--幻灯片开始-->\r\n        <div class=\"pictureDIV\">\r\n          <div id=\"preview\" class=\"spec-preview\">\r\n            <span class=\"jqzoom\"><img /></span>\r\n          </div>\r\n          <!--缩图开始-->\r\n          <div class=\"spec-scroll\">\r\n            <a class=\"prev\">&lt;</a>\r\n            <a class=\"next\">&gt;</a>\r\n            <div class=\"items\">\r\n              <ul>\r\n                ");
        if (model.albums!=null)
        {

            foreach(Model.article_albums modelt in model.albums)
            {

                templateBuilder.Append("\r\n                <li><img bimg=\"");
                templateBuilder.Append(Utils.ObjectToStr(modelt.original_path));
                templateBuilder.Append("\" src=\"");
                templateBuilder.Append(Utils.ObjectToStr(modelt.thumb_path));
                templateBuilder.Append("\" onmousemove=\"preview(this);\" /></li>\r\n                ");
            }   //end for if

        }   //end for if

        templateBuilder.Append("\r\n              </ul>\r\n            </div>\r\n          </div>\r\n          <!--缩图结束-->\r\n        </div>\r\n        <!--幻灯片结束-->\r\n      </div>\r\n       <!--/商品图片-->\r\n      \r\n      <!--商品属性-->\r\n      <div class=\"pro-attr right356\">\r\n        <h1>");
        templateBuilder.Append(Utils.ObjectToStr(model.title));
        templateBuilder.Append("</h1>\r\n        <div class=\"pro-items\">\r\n          <dl>\r\n            <dt>商品品牌：</dt>\r\n            <dd>");
        templateBuilder.Append(get_article_pp(model.vote_id).ToString());
        templateBuilder.Append("</h1>\r\n        <div class=\"pro-items\">\r\n          <dl>\r\n            <dt>颜色分类：</dt>\r\n            <dd>");
        templateBuilder.Append(CreateMulitSelect("ColorString", model.id));
        //templateBuilder.Append("<div id=\"field_tab_content\" runat=\"server\" visible=\"false\" class=\"tab-content\" style=\"display:none\"></div>");
        templateBuilder.Append("</h1>\r\n        <div class=\"pro-items\">\r\n          <dl>\r\n            <dt>尺寸分类：</dt>\r\n            <dd>");
        templateBuilder.Append(CreateMulitSelect("SizeString", model.id));
        templateBuilder.Append(" </dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>库存情况：</dt>\r\n            <dd>" + Utils.ObjectToStr(model.fields["stock_quantity"]) + "件</dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>销售价格：</dt>\r\n            <dd><b class=\"red\">￥" + Utils.ObjectToStr(model.fields["sell_price"]) + "</b></dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>会员价格：</dt>\r\n            <dd>\r\n              ");
        decimal user_price = get_user_article_price(model.id);

        if (user_price>-1)
        {

            templateBuilder.Append("\r\n              <b class=\"red\">￥");
            templateBuilder.Append(Utils.ObjectToStr(user_price));
            templateBuilder.Append("</b>\r\n              ");
        }
        else
        {

            templateBuilder.Append("\r\n              登录可见\r\n              ");
        }   //end for if

        templateBuilder.Append("\r\n            </dd>\r\n          </dl>\r\n          <dl>\r\n            <dt>上架时间：</dt>\r\n            <dd>");
        templateBuilder.Append(Utils.ObjectToStr(model.add_time));
        templateBuilder.Append("</dd>\r\n          </dl>\r\n        </div>\r\n        <div class=\"pro-btns\">\r\n		  <div class=\"input-box\">\r\n              购买数量：<input name=\"goods_id\" id=\"goods_id\" type=\"hidden\" value=\"");
        templateBuilder.Append(Utils.ObjectToStr(model.id));
        templateBuilder.Append("\" /><input type=\"text\" name=\"goods_quantity\" id=\"goods_quantity\" value=\"1\" class=\"txt\" style=\"ime-mode:disabled\" />\r\n          </div>\r\n          <div class=\"btn-box\">\r\n            ");
        if (Utils.StrToInt(Utils.ObjectToStr(model.fields["stock_quantity"]), 0)>0)
        {

            templateBuilder.Append("\r\n            <a href=\"javascript:void(0);\" class=\"add\" onclick=\"CartAdd(this, '");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("', 0, '");
            templateBuilder.Append(linkurl("shopping","cart"));
            templateBuilder.Append("');\">加入购物车</a>\r\n            <a href=\"javascript:void(0);\" class=\"buy\" onclick=\"CartAdd(this, '");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("', 1, '");
            templateBuilder.Append(linkurl("shopping","confirm"));
            templateBuilder.Append("');\">立即购买</a>\r\n            ");
        }
        else
        {

            templateBuilder.Append("\r\n            <a title=\"该商品供货紧张，无法加入购物车\" class=\"add-over\">加入购物车</a>\r\n            <a title=\"该商品供货紧张，无法立即购买\" class=\"buy-over\">立即购买</a>\r\n            ");
        }   //end for if

        templateBuilder.Append("\r\n          </div>\r\n          \r\n        </div>\r\n        <div class=\"line10\"></div>\r\n        <!--分享-->\r\n        ");

        templateBuilder.Append("        <!-- JiaThis Button BEGIN --> \r\n        <div id=\"ckepop\">\r\n            <span class=\"jiathis_txt\">分享到：</span>\r\n            <a class=\"jiathis_button_qzone\"></a>\r\n            <a class=\"jiathis_button_tqq\"></a>\r\n            <a class=\"jiathis_button_tsina\"></a>\r\n            <a class=\"jiathis_button_renren\"></a>\r\n            <a class=\"jiathis_button_douban\"></a>\r\n            <a class=\"jiathis_button_taobao\"></a>\r\n            <a class=\"jiathis_button_ujian\"></a>\r\n            <a class=\"jiathis_button_fav\"></a> \r\n            <a class=\"jiathis_button_copy\">复制</a> \r\n            <a href=\"http://www.jiathis.com/share/?uid=90225\" class=\"jiathis jiathis_txt jiathis_separator jtico jtico_jiathis\" target=\"_blank\">更多</a> \r\n            <a class=\"jiathis_counter_style\"></a> \r\n        </div> \r\n        <!-- JiaThis Button END -->\r\n        <script type=\"text/javascript\">var jiathis_config={data_track_clickback:true};</");
        templateBuilder.Append("script> \r\n        <script type=\"text/javascript\" src=\"http://v2.jiathis.com/code/jia.js?uid=1336353133859589\" charset=\"utf-8\"></");
        templateBuilder.Append("script>");


        templateBuilder.Append("\r\n        <!--/分享-->\r\n      </div>\r\n      <!--/商品属性-->\r\n      \r\n      <div class=\"line20\"></div>\r\n      <!--商品介绍-->\r\n      <div id=\"goodsTabs\">\r\n        <div id=\"tab_head\" class=\"pro-tabs\">\r\n          <ul>\r\n            <li><a class=\"current\" href=\"javascript:;\">商品介绍</a></li>\r\n            <li><a href=\"javascript:;\">商品评论</a></li>\r\n          </ul>\r\n        </div>\r\n        <div class=\"line10\"></div>\r\n        <div class=\"tab_inner entry\" style=\"display:block;\">\r\n          ");
        templateBuilder.Append(Utils.ObjectToStr(model.content));
        templateBuilder.Append("\r\n          <div class=\"line10\"></div>\r\n        </div>\r\n        \r\n        <div class=\"tab_inner\">\r\n          <!--评论-->\r\n          ");
        if (model.is_msg==1)
        {


            int comment_count = get_comment_count(model.id, "is_lock=0");

            templateBuilder.Append("<!--取得评论总数-->\r\n      <link rel=\"stylesheet\" href=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("css/validate.css\" />\r\n      <link rel=\"stylesheet\" href=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("css/pagination.css\" />\r\n      <script type=\"text/javascript\" src=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("scripts/jquery/jquery.form.min.js\"></");
            templateBuilder.Append("script>\r\n      <script type=\"text/javascript\" src=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("scripts/jquery/Validform_v5.3.2_min.js\"></");
            templateBuilder.Append("script>\r\n      <script type=\"text/javascript\" src=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("scripts/lhgdialog/lhgdialog.js?skin=idialog\"></");
            templateBuilder.Append("script>\r\n      <script type=\"text/javascript\" src=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("scripts/jquery/jquery.pagination.js\"></");
            templateBuilder.Append("script>\r\n      <script type=\"text/javascript\">\r\n        $(function(){\r\n          //初始化评论列表\r\n          AjaxPageList('#comment_list', '#pagination', 10, ");
            templateBuilder.Append(Utils.ObjectToStr(comment_count));
            templateBuilder.Append(", '");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("tools/submit_ajax.ashx?action=comment_list&article_id=");
            templateBuilder.Append(Utils.ObjectToStr(model.id));
            templateBuilder.Append("', '");
            templateBuilder.Append("/templates/green");
            templateBuilder.Append("/images/user_avatar.png');\r\n          //初始化发表评论表单\r\n          AjaxInitForm('comment_form', 'btnSubmit', 1);\r\n        });\r\n      </");
            templateBuilder.Append("script>\r\n      <div class=\"comment_box\">\r\n        <h3 class=\"base_tit\"><span><a href=\"#Add\">发表评论</a></span>共有");
            templateBuilder.Append(Utils.ObjectToStr(comment_count));
            templateBuilder.Append("访客发表了评论</h3>\r\n        <ol id=\"comment_list\" class=\"comment_list\">\r\n          <p style=\"line-height:35px;\">暂无评论，快来抢沙发吧！</p>\r\n\r\n        </ol>\r\n      </div>\r\n      <div class=\"line20\"></div>\r\n      <div id=\"pagination\" class=\"flickr\"></div><!--放置页码-->\r\n      <div class=\"comment_add\">\r\n        <h3 class=\"base_tit\">我来说几句吧<a name=\"Add\"></a></h3>\r\n        <form id=\"comment_form\" name=\"comment_form\" url=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("tools/submit_ajax.ashx?action=comment_add&article_id=");
            templateBuilder.Append(Utils.ObjectToStr(model.id));
            templateBuilder.Append("\">\r\n        <div class=\"comment_editor\">\r\n          <textarea id=\"txtContent\" name=\"txtContent\" class=\"input\" style=\"width:658px;height:70px;\" datatype=\"*\" sucmsg=\" \"></textarea>\r\n        </div>\r\n        <div class=\"subcon\">\r\n          <input id=\"btnSubmit\" name=\"submit\" class=\"btn right\" type=\"submit\" value=\"提交评论（Ctrl+Enter）\" />\r\n          <span>验证码：</span>\r\n          <input id=\"txtCode\" name=\"txtCode\" type=\"text\" class=\"input small\" datatype=\"s4-4\" errormsg=\"请填写4位验证码\" sucmsg=\" \" onkeydown=\"if(event.ctrlKey&&event.keyCode==13){document.getElementById('btnSubmit').click();return false};\"  />\r\n          <a href=\"javascript:;\" onclick=\"ToggleCode(this, '");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("tools/verify_code.ashx');return false;\"><img src=\"");
            templateBuilder.Append(Utils.ObjectToStr(config.webpath));
            templateBuilder.Append("tools/verify_code.ashx\" width=\"80\" height=\"22\" style=\"vertical-align:middle;\" /> 看不清楚？</a>\r\n        </div>\r\n        </form>\r\n      </div>");


        }   //end for if

        templateBuilder.Append("\r\n          <!--/评论-->\r\n        </div>\r\n        \r\n      </div>\r\n      <!--/商品介绍-->\r\n      \r\n      <!--同类推荐-->\r\n      <div class=\"related\">\r\n        <h3 class=\"base_tit\">本类推荐</h3>\r\n        <ul class=\"img_list\">\r\n          ");
        DataTable goods_list = get_article_list("goods", 0, 10, "is_red=1 and id<>" + model.id);

        foreach(DataRow dr in goods_list.Rows)
        {

            templateBuilder.Append("\r\n          <li><a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
            templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

            templateBuilder.Append("\"><img alt=\"" + Utils.ObjectToStr(dr["title"]) + "\" src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\"><span>" + Utils.ObjectToStr(dr["title"]) + "</span></a></li>\r\n           ");
        }   //end for if

        templateBuilder.Append("\r\n        </ul>\r\n      </div>\r\n      <!--/同类推荐-->\r\n      \r\n    </div>\r\n    <!--/Left-->\r\n  </div>\r\n  \r\n  <div class=\"left264\">\r\n    <!--Sidebar-->\r\n    <div class=\"sidebar\">\r\n      <h3>商品类别</h3>\r\n      <ul class=\"navbar\">\r\n        ");
        DataTable category_list2 = get_category_child_list("goods", 0);

        int cdr2__loop__id=0;
        foreach(DataRow cdr2 in category_list2.Rows)
        {
            cdr2__loop__id++;


            templateBuilder.Append("\r\n        <li>\r\n          <h4><a href=\"");
            templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr2["id"])));

            templateBuilder.Append("\">" + Utils.ObjectToStr(cdr2["title"]) + "</a></h4>\r\n          <div class=\"list\">\r\n            ");
            DataTable category_list21 = get_category_child_list("goods", Utils.StrToInt(Utils.ObjectToStr(cdr2["id"]), 0));

            int cdr21__loop__id=0;
            foreach(DataRow cdr21 in category_list21.Rows)
            {
                cdr21__loop__id++;


                if (Utils.StrToInt(Utils.ObjectToStr(cdr21["id"]), 0)==model.category_id)
                {

                    templateBuilder.Append("\r\n            <a href=\"");
                    templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr21["id"])));

                    templateBuilder.Append("\" class=\"current\">" + Utils.ObjectToStr(cdr21["title"]) + "</a>\r\n            ");
                }
                else
                {

                    templateBuilder.Append("\r\n            <a href=\"");
                    templateBuilder.Append(linkurl("goods_list",Utils.ObjectToStr(cdr21["id"])));

                    templateBuilder.Append("\">" + Utils.ObjectToStr(cdr21["title"]) + "</a>\r\n            ");
                }   //end for if

            }   //end for if

            templateBuilder.Append("\r\n          </div>\r\n        </li>\r\n        ");
        }   //end for if

        templateBuilder.Append("\r\n      </ul>\r\n      <div class=\"clear\"></div>\r\n      <h3><a class=\"arrow\" href=\"");
        templateBuilder.Append(linkurl("goods"));

        templateBuilder.Append("\" title=\"查看更多\">&gt;</a>推荐商品</h3>\r\n      <div class=\"focus_list\">\r\n        <ul>\r\n          ");
        DataTable redgoods = get_article_list("goods", 0, 6, "is_red=1 and img_url<>''");

        foreach(DataRow dr in redgoods.Rows)
        {

            templateBuilder.Append("\r\n          <li>\r\n            <a title=\"" + Utils.ObjectToStr(dr["title"]) + "\" href=\"");
            templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(dr["id"])));

            templateBuilder.Append("\">\r\n              <img src=\"" + Utils.ObjectToStr(dr["img_url"]) + "\" width=\"100\" height=\"100\" alt=\"" + Utils.ObjectToStr(dr["title"]) + "\" />\r\n              <span>" + Utils.ObjectToStr(dr["title"]) + "</span>\r\n            </a>\r\n          </li>\r\n          ");
        }   //end for if

        templateBuilder.Append("\r\n        </ul>\r\n        <div class=\"clear\"></div>\r\n      </div>\r\n      <h3><a class=\"arrow\" href=\"");
        templateBuilder.Append(linkurl("goods"));

        templateBuilder.Append("\" title=\"查看更多\">&gt;</a>人气排行</h3>\r\n      <ul class=\"rank_list\">\r\n        ");
        DataTable hotgoods = get_article_list("goods", 0, 10, "", "click desc,id desc");

        int hotdr__loop__id=0;
        foreach(DataRow hotdr in hotgoods.Rows)
        {
            hotdr__loop__id++;


            if (hotdr__loop__id==1)
            {

                templateBuilder.Append("\r\n        <li class=\"active\">\r\n        ");
            }
            else
            {

                templateBuilder.Append("\r\n        <li>\r\n        ");
            }   //end for if

            templateBuilder.Append("\r\n          <span>"); templateBuilder.Append(Utils.ObjectToDateTime(Utils.ObjectToStr(hotdr["add_time"])).ToString("MM-dd"));

            templateBuilder.Append("</span>\r\n          <i class=\"num\">");
            templateBuilder.Append(hotdr__loop__id.ToString());

            templateBuilder.Append("</i><a href=\"");
            templateBuilder.Append(linkurl("goods_show",Utils.ObjectToStr(hotdr["id"])));

            templateBuilder.Append("\">" + Utils.ObjectToStr(hotdr["title"]) + "</a>\r\n        </li>\r\n        ");
        }   //end for if

        templateBuilder.Append("\r\n      </ul>\r\n    </div>\r\n    <!--/Sidebar-->\r\n  </div>\r\n</div>\r\n\r\n<div class=\"clear\"></div>\r\n</div>\r\n<!--Footer-->\r\n");

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
            }   //end for if

            templateBuilder.Append("\r\n					</dl>\r\n				</li>\r\n       ");
        }   //end for if

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
