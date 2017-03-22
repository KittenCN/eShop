//$(document).ready(function () {
//// 点击查看购物车
//$(".header_cart").click(function () {
//	if ((get_logon_type() != null) && (get_logon_type() == "admin")) {
//		alert("管理员登录模式无法使用购物车");
//	}
//	else {
//		goto_link(getActionPath("Cart", "Home"));
//	}
//});

//// 鼠标滑过,显示小购物车
//$(".header_cart_box").hover(function () {
//	if ((get_logon_type() != null) && (get_logon_type() == "admin")) {
//		return;
//	}
//	else {
//		update_small_cart(false);
//	}
//},
//function () {
//	if ((get_logon_type() != null) && (get_logon_type() == "admin")) {
//		return;
//	}
//	else {
//		$(".header_cart_box").find(".small_cart").hide();
//	}
//});

// logon处理
function logon_process() {
	// 显示登录信息
	if ((get_logon_type() != null) && (get_logon_type() == "buyer")) {
		$("#store_header").find(".buyer_show").show();
		$("#store_header").find(".admin_show").hide();
		$("#store_header").find(".not_buyer_show").hide();
		$("#store_header").find("#buyer_name").text(get_logon_name());
	}
	else if ((get_logon_type() != null) && (get_logon_type() == "admin")) {
		$("#store_header").find(".buyer_show").hide();
		$("#store_header").find(".admin_show").show();
		$("#store_header").find(".not_buyer_show").hide();
		$("#store_header").find("#admin_name").text(get_logon_name());
	}
	else {
		$("#store_header").find(".buyer_show").show();
		$("#store_header").find(".admin_show").hide();
		$("#store_header").find(".not_buyer_show").show();
		$("#store_header").find(".un_login").hide();

		// 第三方登录点击处理
		var callback = encodeURIComponent(getFullActionPath("Logon", "Account") + "?url=" + encodeURIComponent(get_callback_url()));
		// QQ第三方登录
		$("#store_header").find("#third_qq").click(function () {
			var url = Configure.Third_Jump + "/QQLogon" + "?cb=" + callback + "&device=" + Constant.STORE_DEVICE_PC;
			goto_link(url);
		});
		// Sina微博第三方登录
		$("#store_header").find("#third_sina").click(function () {
			var url = Configure.Third_Jump + "/SinaLogon" + "?cb=" + callback + "&device=" + Constant.STORE_DEVICE_PC;
			goto_link(url);
		});
		// 人人网第三方登录
		$("#store_header").find("#third_renren").click(function () {
			var url = Configure.Third_Jump + "/RenRenLogon" + "?cb=" + callback + "&device=" + Constant.STORE_DEVICE_PC;
			goto_link(url);
		});
		// 支付宝第三方登录
		$("#store_header").find("#third_alipay").click(function () {
			var url = Configure.Third_Jump + "/AlipayLogon" + "?cb=" + callback + "&device=" + Constant.STORE_DEVICE_PC;
			goto_link(url);
		});
	}
}

// 更新小购物车内容
var block_get_cart = false;
function update_small_cart(async) {
	
}

function del_cart_goods(goods_list, goods_div) {
	block_get_cart = true;

	$.ajax({
		url: getActionPath("DeleteCartGoods", "Cart"),
		dataType: "json",
		contentType: 'application/json',
		type: "POST",
		//		async: false,
		data: stringify({ cart_goods: goods_list }),
		success: function (data) {
			block_get_cart = false;
			$(".header_cart_box").find(".small_cart").hide();
		},
		error: function (request, status, errorThrown) {
			ShowAjaxError(request, status, errorThrown);
		}
	});
}


// ******** 模板必须实现该函数 ******** //
// 显示商店信息,包括logo等
function show_store_info() {
	if (Configure.ShowHeader) {
		var key = get_url_param("key");
		if (key != null && key != '') {
			// 设置搜索框的关键字
			$("input[name=search_text]").val(key);
		}

		$("#search_button").click(function () {
			var key = $("input[name=search_text]").val();
			if ((key != null) && (key != "")) {
				goto_search_link(key, null, null, null, null, null, null);
			}
		});
		// 在搜索栏输入回车
		$("input[name=search_text]").keyup(function (e) {
			if (e.keyCode == 13) {
				var key = $("input[name=search_text]").val();
				if ((key != null) && (key != "")) {
					goto_search_link(key, null, null, null, null, null, null);
				}
			}
		});

		//搜索框获取焦点
		$('input[name=search_text]').focus(function () {
			if ($.trim($(this).val()) == $.trim($(this).attr('remind'))) {
				$(this).val('');
			}
		})

		$('input[name=search_text]').blur(function () {
			if ($.trim($(this).val()) == '') {
				$(this).val($.trim($(this).attr('remind')));
			}
		})
	}

	// 筑云支持显示
	if (Configure.ShowZhuyun) {
		$(".footer-box").find(".footer").removeClass("footer_no_zhuyun");
	}
	else {
		$(".footer-box").find(".footer").addClass("footer_no_zhuyun");
	}
}

// ******** 模板必须实现该函数 ******** //
// 显示商店分类导航
function show_store_nav() {
	if (Configure.ShowNav) {
		// 导航栏宽度计算
		var nav_width = 0;
		$("#show_store_nav").find(".subnav_li").each(function () {
			nav_width += $(this).outerWidth();
		});
		nav_width = nav_width > 1200 ? 1200 : nav_width;
		$("#show_store_nav").find(".header_subnav").width(nav_width);

		$("#show_store_nav .header_subnav .subnav_li").hover(function () {
			$(this).siblings().removeClass("subnav_header");
			$(this).addClass("subnav_header");

			var index = $("#show_store_nav .header_subnav .subnav_li").index($(this));
			$("#show_store_nav .header_subclass .header_subclass_nav").hide();

			var width = $("#show_store_nav .header_subnav_header").width();
			var x = $(this).position().left;
			var sub_class = $("#show_store_nav .header_subclass .header_subclass_nav").eq(index);
			if (x <= (width / 2)) {
				sub_class.css("left", 0);
			}
			else {
				sub_class.css("left", Math.floor(width - sub_class.width()));
			}
			sub_class.show();
		});

		$("#show_store_nav .header_subclass .header_subclass_nav").hover(function () {
		},
		function () {
			$(this).hide();
			$("#show_store_nav .header_subnav .subnav_li").removeClass("subnav_header");
		});

		$("#show_store_nav .header_subnav_header").hover(function () {
		},
		function () {
			$("#show_store_nav .header_subclass .header_subclass_nav").hide();
			$("#show_store_nav .header_subnav .subnav_li").removeClass("subnav_header");
		});
	}

	// 全部商品分类
	// 光标设置
	var min_height = 60;
	var header_short_nav = $("#store_header").find(".header_sort");
	header_short_nav.find(".nav_style1_content").css("cursor", "default");


	// 鼠标滑过展开下级处理
	header_short_nav.find(".nav_style1_content_li").hover(function () {
		header_short_nav.find(".nav_style1_content_li").removeClass("nav_style1_content_hover");
		$(this).addClass("nav_style1_content_hover");

		var index = header_short_nav.find(".nav_style1_content_li").index(this);

		header_short_nav.find(".nav_style1_sub").hide();
		header_short_nav.find(".nav_style1_sub").eq(index).show();
		if (header_short_nav.find(".nav_style1_sub").eq(index).height() < min_height) {
			header_short_nav.find(".nav_style1_sub").eq(index).height(min_height);
		}

		var h_pos = $(this).offset().top - header_short_nav.find(".nav_style1_main_content").offset().top;
		h_pos += $(this).height() + 10;
		// 位置偏移处理
		if (header_short_nav.find(".nav_style1_sub").eq(index).height() < h_pos) {
			header_short_nav.find(".nav_style1_sub").eq(index).css("top", Math.round(h_pos - header_short_nav.find(".nav_style1_sub").eq(index).height()) + "px");
		}
	},
	function () {
	});

	header_short_nav.find(".nav_style1_main_content").hover(function () {
	},
	function () {
		header_short_nav.find(".nav_style1_content_li").removeClass("nav_style1_content_hover");
		header_short_nav.find(".nav_style1_sub").hide();
	});

	// 显示隐藏全体商品分类
	header_short_nav.hover(function () {
		$(this).find(".Nav_TitleStyleBox").show();
	},
	function () {
		$(this).find(".Nav_TitleStyleBox").hide();
	});
}

function show_store_custom_service() {
	var service = {
		service_qq: new Array(),
		service_company_qq: new Array(),
		service_marketing_qq: new Array(),
		service_wang: new Array()
	}
	if (store_service != null) {
		service.service_qq = new Array();
		service.service_company_qq = new Array();
		service.service_wang = new Array();

		for (var i = 0; i < store_service.length; i++) {
			switch (store_service[i].Type) {
				case Constant.STORE_SERVICE_QQ:
					service.service_qq.push(store_service[i]);
					break;
				case Constant.STORE_SERVICE_COMPANY_QQ:
					service.service_company_qq.push(store_service[i]);
					break;
				case Constant.STORE_SERVICE_MARKETING_QQ:
					service.service_marketing_qq.push(store_service[i]);
					break;
				case Constant.STORE_SERVICE_WANGWANG:
					service.service_wang.push(store_service[i]);
					break;
				default:
					break;
			}
		}
		$("#store_custom_service").addClass("store_service_position" + store_set_service.ServicePos);
		$("#custom_service_tmpl").tmpl(service).appendTo($("#store_custom_service"));

		switch (parseInt(store_set_service.ServiceUse)) {
			case Constant.OPEN_ACROSS_DISPLAY:         //支持(划过显示)
				$("#custom_service_1").hover(function () {
					$("#custom_service_1").hide();
					$("#custom_service_2").show();
				}, function () {
					$("#custom_service_1").hide();
					$("#custom_service_2").show();
				});

				$("#custom_service_2").hover(function () {
				}, function () {
					$("#custom_service_1").show();
					$("#custom_service_2").hide();
				});
				break;
			case Constant.CLOSE_NO_DISPLAY:				//关闭(不显示)
				$("#store_custom_service").hide();
				break;
			case Constant.OPEN_ALWAYS_DISPLAY:         //支持(一直显示)
				$("#custom_service_1").hide();
				$("#custom_service_2").show();
				break;
			default:
				$("#store_custom_service").hide();
				break;
		}
	} else {
		$("#store_custom_service").hide();
	}

	if (typeof(BizQQWPA) != "undefined") {
		for (var i = 0; i < service.service_marketing_qq.length; i++) {
			BizQQWPA.addCustom([
			{ aty: '0', a: '0', nameAccount: service.service_marketing_qq[i].Account, selector: "yx_" + service.service_marketing_qq[i].Account }
			]);
		}
	}
}

// 显示商店信息,包括logo等
function show_sub_store_info() {
	$("#sub_search_button").click(function () {
		var key = $("input[name=sub_search_text]").val();
		if ((key != null) && (key != "")) {
			goto_search_link(key, null, null, null, null, null, sub_store_data.SubId);
		}
	});
	// 在搜索栏输入回车
	$("input[name=search_text]").keyup(function (e) {
		if (e.keyCode == 13) {
			var key = $("input[name=search_text]").val();
			if ((key != null) && (key != "")) {
				goto_search_link(key, null, null, null, null, null, sub_store_data.SubId);
			}
		}
	});
}

function show_sub_store_custom_service() {
	var service = {
		service_qq: new Array(),
		service_company_qq: new Array(),
		service_marketing_qq: new Array(),
		service_wang: new Array()
	}
	if ((store_service != null) && (store_service.length > 0)) {
		$("#sub_store_grade").find("#seller_sub_service_ctrl").removeClass("sub_header_grade_Offline");
		$("#sub_store_grade").find("#seller_sub_service_ctrl").addClass("sub_header_grade_Online");
		$("#sub_store_grade").find("#seller_sub_service_ctrl_text").text("在线咨询");

		service.service_qq = new Array();
		service.service_company_qq = new Array();

		service.service_wang = new Array();

		for (var i = 0; i < store_service.length; i++) {
			switch (store_service[i].Type) {
				case Constant.STORE_SERVICE_QQ:
					service.service_qq.push(store_service[i]);
					break;
				case Constant.STORE_SERVICE_COMPANY_QQ:
					service.service_company_qq.push(store_service[i]);
					break;
				case Constant.STORE_SERVICE_MARKETING_QQ:
					service.service_marketing_qq.push(store_service[i]);
					break;
				case Constant.STORE_SERVICE_WANGWANG:
					service.service_wang.push(store_service[i]);
					break;
				default:
					break;
			}
		}
		$("#seller_sub_service_tmpl").tmpl(service).appendTo($("#sub_store_grade").find("#seller_sub_service"));

		$("#sub_store_grade").find("#seller_sub_service_ctrl").hover(function () {
			$("#sub_store_grade").find("#seller_sub_service").show();
		}, function () {
		});

		$("#sub_store_grade").find("#seller_sub_service").hover(function () {
		}, function () {
			$("#sub_store_grade").find("#seller_sub_service").hide();
		});

		if (typeof(BizQQWPA) != "undefined") {
			for (var i = 0; i < service.service_marketing_qq.length; i++) {
				BizQQWPA.addCustom([
				{ aty: '0', a: '0', nameAccount: service.service_marketing_qq[i].Account, selector: "yx_" + service.service_marketing_qq[i].Account }
				]);
			}
		}

		//插件中营销QQ绑定
		$('.SubStore_Control_Id').each(function () {
			var control_id = $(this).attr('control_id');
			if (control_id != undefined && control_id != '')
			{
				if (typeof(BizQQWPA) != "undefined") {
					for (var i = 0; i < service.service_marketing_qq.length; i++) {
						BizQQWPA.addCustom([
						{ aty: '0', a: '0', nameAccount: service.service_marketing_qq[i].Account, selector: "yx_control" + control_id + "_" + service.service_marketing_qq[i].Account }
						]);
					}
				}
			}
		})
	} else {
		$("#sub_store_grade").find("#seller_sub_service_ctrl").removeClass("sub_header_grade_Online");
		$("#sub_store_grade").find("#seller_sub_service_ctrl").addClass("sub_header_grade_Offline");
		$("#sub_store_grade").find("#seller_sub_service_ctrl_text").text("暂无客服");
		$("#sub_store_grade").find("#seller_sub_service").hide();
	}
}
