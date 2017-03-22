var current_page = 0;

var price_from = "";
var price_to = "";

var show_tagclass = false;
var show_tagitem = false;


// 模板必须实现该函数
// 显示商品
function show_search_goods() {
	if (simple_goods != null) {
		// 显示商品促销
		$(".search_content_list1").each(function (index) {
			var sales = get_goods_sales(simple_goods[index]);
			if (sales.rule_icon != null) {
				sales.rule_icon.appendTo($(this).find("#sales_icon"));
			}
			if (sales.rule_price != null) {
				$(this).find("#sales_price").text((sales.rule_price / 100).toFixed(2));
			}
		});

		// 显示选中框
		$(".tag_item_search").removeClass("search_border");
		$(".tag_item_search").find(".icon_i").hide();
		if (search_option.F_TagItemId != null) {
			if (search_option.F_TagItemId.length <= 0) {
				search_option.F_TagItemId = null;
			}
			else {
				for (var i = 0; i < search_option.F_TagItemId.length; i++) {
					$(".tag_item_search[tag_item_id=" + search_option.F_TagItemId[i] + "]").addClass("search_border");
					$(".tag_item_search[tag_item_id=" + search_option.F_TagItemId[i] + "]").find(".icon_i").show();
				}
			}
		}

		// 更多标签项
		for (var i = 1; i <= Constant.GOODS_SEARCH_SHOW_TAG_CLASS_MAX; i++) {
			for (var j = 1; j <= Constant.GOODS_SEARCH_SHOW_TAG_ITEM_DEFAULT; j++) {
				$("#search_item_attr_" + i.toString() + "_" + j.toString()).show();
			}
			if ($("#search_item_attr_" + i.toString() + "_" + j.toString()).length > 0) {
				$("#show_more_tagitem_" + i).show();
			}
		}
		$(".show_more_tagitem").click(function () {
			var tag_class_index = $(this).attr("tag_class_index");
			if (show_tagitem) {
				show_tagitem = false;
				$("#show_more_tagitem_" + tag_class_index).text("更多");
				$("#show_more_tagitem_" + tag_class_index).removeClass("search_right_attr2_More_close");
				$("#show_more_tagitem_" + tag_class_index).addClass("search_right_attr2_More_open");
				for (var j = Constant.GOODS_SEARCH_SHOW_TAG_ITEM_DEFAULT + 1 ; j < Constant.GOODS_SEARCH_SHOW_TAG_ITEM_MAX; j++) {
					$("#search_item_attr_" + tag_class_index + "_" + j.toString()).hide();
				}
			} else {
				show_tagitem = true;
				$("#show_more_tagitem_" + tag_class_index).text("收起");
				$("#show_more_tagitem_" + tag_class_index).removeClass("search_right_attr2_More_open");
				$("#show_more_tagitem_" + tag_class_index).addClass("search_right_attr2_More_close");
				for (var j = Constant.GOODS_SEARCH_SHOW_TAG_ITEM_DEFAULT + 1; j < Constant.GOODS_SEARCH_SHOW_TAG_ITEM_MAX; j++) {
					$("#search_item_attr_" + tag_class_index + "_" + j.toString()).show();
				}
			}
		});


		// 更多标签类
		for (var i = 1; i <= Constant.GOODS_SEARCH_SHOW_TAG_CLASS_DEFAULT; i++) {
			$("#search_class_attr_" + i.toString()).show();
		}
		if ($("#search_class_attr_" + i.toString()).length > 0) {
			$("#show_more_tagclass").show();
		}

		$("#show_more_tagclass").click(function () {
			if (show_tagclass) {
				show_tagclass = false;
				$("#show_more_tagclass").text("更多标签");
				$("#show_more_tagclass").removeClass("search_right_attr2_MainMore_Close");
				$("#show_more_tagclass").addClass("search_right_attr2_MainMore_Open");
				for (var i = Constant.GOODS_SEARCH_SHOW_TAG_CLASS_DEFAULT + 1 ; i < Constant.GOODS_SEARCH_SHOW_TAG_CLASS_MAX; i++) {
					$("#search_class_attr_" + i.toString()).hide();
				}
			} else {
				show_tagclass = true;
				$("#show_more_tagclass").text("收起标签");
				$("#show_more_tagclass").removeClass("search_right_attr2_MainMore_Open");
				$("#show_more_tagclass").addClass("search_right_attr2_MainMore_Close");
				for (var i = Constant.GOODS_SEARCH_SHOW_TAG_CLASS_DEFAULT + 1; i < Constant.GOODS_SEARCH_SHOW_TAG_CLASS_MAX; i++) {
					$("#search_class_attr_" + i.toString()).show();
				}
			}
		});

		// 搜索条件
		// 按上架时间 新->旧 排序
		$("#order_time").click(function () {
			current_page = 0;
			search_option.Order = Constant.GOODS_SEARCH_ORDER_TIME_NEW_OLD;
			search_option = get_search_option();
			search_goods(search_option);
		});
		// 按商品销量 高->低 排序
		$("#order_sales").click(function () {
			current_page = 0;
			search_option.Order = Constant.GOODS_SEARCH_ORDER_SALES_HIGH_LOW;
			search_option = get_search_option();
			search_goods(search_option);
		});
		// 按商品价格 高->低 排序
		$("#order_price_down").click(function () {
			current_page = 0;
			search_option.Order = Constant.GOODS_SEARCH_ORDER_PRICE_HIGH_LOW;
			search_option = get_search_option();
			search_goods(search_option);
		});
		// 按商品价格 低->高 排序
		$("#order_price_up").click(function () {
			current_page = 0;
			search_option.Order = Constant.GOODS_SEARCH_ORDER_PRICE_LOW_HIGH;
			search_option = get_search_option();
			search_goods(search_option);
		});
		// 只搜索有货
		$("input[name=stock_only]").click(function () {
			current_page = 0;
			search_option = get_search_option();
			search_goods(search_option);
		});
		// 点击价格输入确定按钮
		$("#price_ok").click(function () {
			current_page = 0;
			search_option = get_search_option();
			search_goods(search_option);
		});

		// 点击全体分类搜索结果
		$(".class_all_search").click(function () {
			search_option = get_search_option();
			search_option.First = 0;
			search_option.F_Class1Id = null;
			search_option.F_Class2Id = null;
			search_option.F_Class3Id = null;
			search_option.F_TagClassId = null;
			search_option.F_TagItemId = null;
			search_goods(search_option);
		});
		// 点击一级分类搜索结果
		$(".class1_search").click(function () {
			var class1_id = $(this).attr("class1_id");
			search_option = get_search_option();
			search_option.First = 0;
			search_option.F_Class1Id = class1_id;
			search_option.F_Class2Id = null;
			search_option.F_Class3Id = null;
			search_option.F_TagClassId = null;
			search_option.F_TagItemId = null;
			search_goods(search_option);
		});
		// 点击三级分类搜索结果
		$(".class3_search").click(function () {
			var class3_id = $(this).attr("class3_id");
			search_option = get_search_option();
			search_option.First = 0;
			search_option.F_Class1Id = null;
			search_option.F_Class2Id = null;
			search_option.F_Class3Id = class3_id;
			search_option.F_TagClassId = null;
			search_option.F_TagItemId = null;
			search_goods(search_option);
		});

		// 点击标签搜索结果
		$(".tag_item_search").click(function () {
			var tag_item_id = $(this).attr("tag_item_id");
			search_option = get_search_option();
			search_option.First = 0;
			search_option.F_Class1Id = null;
			search_option.F_Class2Id = null;
			search_option.F_Class3Id = null;
			search_option.F_TagClassId = null;

			if (search_option.F_TagItemId == null) {
				search_option.F_TagItemId = [];
			}

			var is_exist = false;
			for (var i = 0; i < search_option.F_TagItemId.length; i++) {
				if (search_option.F_TagItemId[i] == tag_item_id) {
					is_exist = true;
					search_option.F_TagItemId.splice(i, 1);
				}
			}
			if (!is_exist) {
				search_option.F_TagItemId.push(tag_item_id);
			}

			search_goods(search_option);
		});

		// 页码直接跳转
		$("#page_submit").click(function () {
			var page = $("#page_input").val();
			var url = $(this).attr("url");
			var pagetotal = parseInt($(this).attr("pagetotal"));
			goto_page(page, url, pagetotal);
		});
		//键盘enter事件
		$("#page_input").keyup(function (e) {
			var This = this;
			if (e.keyCode == 13) {
				var page = $("#page_input").val();
				var url = $(This).attr("url");
				var pagetotal = parseInt($(this).attr("pagetotal"));
				goto_page(page, url, pagetotal);
			}
		});

	}
}

function goto_page(page, url, pagetotal) {
	if (!CheckInput.IsEmpty(page)) {
		if (CheckInput.IsNumber(page)) {
			page = parseInt(page);
			if (page > pagetotal) {
				page = pagetotal;
			}
			if (page < 1) {
				page = 1;
			}
			url = url + (page - 1).toString();
			goto_link(url);
		} else {
			alert("请输入数字");
		}
	}
}

// 取得价格区间
function get_search_option() {
	var price_reg = /^[0-9]{1,7}([.]{1}[0-9]{1,2})?$/;

	var ret = $.extend({}, search_option);
	ret.PriceFrom = null;
	ret.PriceTo = null;
	ret.StockOnly = false;

	var from = $.trim($("input[name=price_from]").val());
	var to = $.trim($("input[name=price_to]").val());
	if (price_reg.test(from)) {
		ret.PriceFrom = from * 100;
		price_from = from;
	}
	else if (from == "") {
		price_from = "";
	}

	if (price_reg.test(to)) {
		ret.PriceTo = to * 100;
		price_to = to;
	}
	else if (to == "") {
		price_to = "";
	}

	if ($("input[name=stock_only]").attr("checked") == "checked") {
		ret.StockOnly = true;
	}
	else {
		ret.StockOnly = false;
	}
	return ret;
}
