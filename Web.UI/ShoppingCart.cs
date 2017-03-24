using System;
using System.Data;
using System.Collections.Generic;
using System.Text;
using Common;
using LitJson;

namespace Web.UI
{
    /// <summary>
    /// 购物车帮助类
    /// </summary>
    public partial class ShopCart
    {
        #region 基本增删改方法====================================
        /// <summary>
        /// 获得购物车列表
        /// </summary>
        public static IList<Model.cart_items> GetList(string strgroup_id)
        {
            string[] valItemA = strgroup_id.Split('|');
            int group_id = int.Parse(valItemA[0].ToString());
            IDictionary<string, int> dic = GetCart();
            IDictionary<string, string> dicEx = GetCartEx();
            string strEx = "";
            if (dic != null)
            {
                IList<Model.cart_items> iList = new List<Model.cart_items>();

                foreach (var item in dic)
                {
                    BLL.article bll = new BLL.article();
                    string[] valItemAitem = item.Key.Split('|');
                    int itemKey = int.Parse(valItemAitem[0].ToString());
                    Model.article model = bll.GetModel(Convert.ToInt32(itemKey));
                    if (model == null || !model.fields.ContainsKey("sell_price"))
                    {
                        continue;
                    }
                    Model.cart_items modelt = new Model.cart_items();
                    modelt.id = model.id;
                    modelt.title = model.title;
                    modelt.img_url = model.img_url;
                    if (model.fields.ContainsKey("point"))
                    {
                        modelt.point = Utils.StrToInt(model.fields["point"], 0);
                    }
                    modelt.price = Utils.StrToDecimal(model.fields["sell_price"], 0);
                    modelt.user_price = Utils.StrToDecimal(model.fields["sell_price"], 0);
                    if (model.fields.ContainsKey("stock_quantity"))
                    {
                        modelt.stock_quantity = Utils.StrToInt(model.fields["stock_quantity"], 0);
                    }
                    //会员价格
                    if (model.group_price != null)
                    {
                        Model.user_group_price gmodel = model.group_price.Find(p => p.group_id == group_id);
                        if (gmodel != null)
                        {
                            modelt.user_price = gmodel.price;
                        }
                    }
                    modelt.quantity = item.Value;
                    if(dicEx != null)
                    {
                        foreach(var itemEx in dicEx)
                        {
                            if(itemEx.Key == item.Key)
                            {
                                strEx = itemEx.Value;
                                break;
                            }
                        }
                    }
                    if(strEx.Length > 0)
                    {
                        string[] valItemArr = strEx.Split('|');
                        if (valItemArr.Length == 2)
                        {
                            modelt.colorstring = valItemArr[0].ToString();
                            modelt.sizestring = valItemArr[1].ToString();
                        }
                    }
                    else
                    {
                        modelt.sizestring = "-";
                        modelt.colorstring = "-";
                    }
                    iList.Add(modelt);
                }
                return iList;
            }
            return null;
        }
        public static IList<Model.cart_items> GetList(int group_id)
        {
            IDictionary<string, int> dic = GetCart();
            IDictionary<string, string> dicEx = GetCartEx();
            string strEx = "";
            if (dic != null)
            {
                IList<Model.cart_items> iList = new List<Model.cart_items>();

                foreach (var item in dic)
                {
                    BLL.article bll = new BLL.article();
                    string[] valItemAitem = item.Key.Split('|');
                    int itemKey = int.Parse(valItemAitem[0].ToString());
                    Model.article model = bll.GetModel(Convert.ToInt32(itemKey));
                    if (model == null || !model.fields.ContainsKey("sell_price"))
                    {
                        continue;
                    }
                    Model.cart_items modelt = new Model.cart_items();
                    modelt.id = model.id;
                    modelt.title = model.title;
                    modelt.img_url = model.img_url;
                    if (model.fields.ContainsKey("point"))
                    {
                        modelt.point = Utils.StrToInt(model.fields["point"], 0);
                    }
                    modelt.price = Utils.StrToDecimal(model.fields["sell_price"], 0);
                    modelt.user_price = Utils.StrToDecimal(model.fields["sell_price"], 0);
                    if (model.fields.ContainsKey("stock_quantity"))
                    {
                        modelt.stock_quantity = Utils.StrToInt(model.fields["stock_quantity"], 0);
                    }
                    //会员价格
                    if (model.group_price != null)
                    {
                        Model.user_group_price gmodel = model.group_price.Find(p => p.group_id == group_id);
                        if (gmodel != null)
                        {
                            modelt.user_price = gmodel.price;
                        }
                    }
                    modelt.quantity = item.Value;
                    if (dicEx != null)
                    {
                        foreach (var itemEx in dicEx)
                        {
                            if (itemEx.Key == item.Key)
                            {
                                strEx = itemEx.Value;
                                break;
                            }
                        }
                    }
                    if (strEx.Length > 0)
                    {
                        string[] valItemArr = strEx.Split('|');
                        if (valItemArr.Length == 2)
                        {
                            modelt.colorstring = valItemArr[0].ToString();
                            modelt.sizestring = valItemArr[1].ToString();
                        }
                    }
                    else
                    {
                        modelt.sizestring = "-";
                        modelt.colorstring = "-";
                    }
                    iList.Add(modelt);
                }
                return iList;
            }
            return null;
        }
        /// <summary>
        /// 添加到购物车
        /// </summary>
        public static bool Add(string Key, int Quantity)
        {
            IDictionary<string, int> dic = GetCart();
            if (dic != null)
            {
                if (dic.ContainsKey(Key))
                {
                    dic[Key] += Quantity;
                    AddCookies(JsonMapper.ToJson(dic));
                    return true;
                }
            }
            else
            {
                dic = new Dictionary<string, int>();
            }
            //不存在的则新增
            dic.Add(Key, Quantity);
            AddCookies(JsonMapper.ToJson(dic));
            return true;
        }
        public static bool AddEx(string Key, string strEX)
        {
            IDictionary<string, string> dic = GetCartEx();
            if (dic != null)
            {
                if (dic.ContainsKey(Key))
                {
                    dic[Key] = strEX;
                    AddCookiesEx(JsonMapper.ToJson(dic));
                    return true;
                }
            }
            else
            {
                dic = new Dictionary<string, string>();
            }
            //不存在的则新增
            dic.Add(Key, strEX);
            AddCookiesEx(JsonMapper.ToJson(dic));
            return true;
        }

        /// <summary>
        /// 更新购物车数量
        /// </summary>
        public static bool Update(string Key, int Quantity)
        {
            if (Quantity == 0)
            {
                Clear(Key);
                return true;
            }
            IDictionary<string, int> dic = GetCart();
            if (dic != null && dic.ContainsKey(Key))
            {
                dic[Key] = Quantity;
                AddCookies(JsonMapper.ToJson(dic));
                return true;
            }
            return false;
        }

        /// <summary>
        /// 移除购物车
        /// </summary>
        /// <param name="Key">主键 0为清理所有的购物车信息</param>
        public static void Clear(string Key)
        {
            if (Key == "0")//为0的时候清理全部购物车cookies
            {
                Utils.WriteCookie(AXKeys.COOKIE_SHOPPING_CART, "", -43200);
            }
            else
            {
                IDictionary<string, int> dic = GetCart();
                if (dic != null)
                {
                    dic.Remove(Key);
                    AddCookies(JsonMapper.ToJson(dic));
                }
            }
        }
        public static void ClearEx(string Key)
        {
            if (Key == "0")//为0的时候清理全部购物车cookies
            {
                Utils.WriteCookie(AXKeys.COOKIE_SHOPPING_CART_EX, "", -43200);
            }
            else
            {
                IDictionary<string, string> dic = GetCartEx();
                if (dic != null)
                {
                    dic.Remove(Key);
                    AddCookiesEx(JsonMapper.ToJson(dic));
                }
            }
        }
        #endregion

        #region 扩展方法==========================================
        public static Model.cart_total GetTotal(string strgroup_id)
        {
            string[] valItemA = strgroup_id.Split('|');
            int group_id = int.Parse(valItemA[0].ToString());
            Model.cart_total model = new Model.cart_total();
            IList<Model.cart_items> iList = GetList(group_id.ToString());
            if (iList != null)
            {
                foreach (Model.cart_items modelt in iList)
                {
                    model.total_num++;
                    model.total_quantity += modelt.quantity;
                    model.payable_amount += modelt.price * modelt.quantity;
                    model.real_amount += modelt.user_price * modelt.quantity;
                    model.total_point += modelt.point * modelt.quantity;
                }
            }
            return model;
        }
        public static Model.cart_total GetTotal(int group_id)
        {

            Model.cart_total model = new Model.cart_total();
            IList<Model.cart_items> iList = GetList(group_id);
            if (iList != null)
            {
                foreach (Model.cart_items modelt in iList)
                {
                    model.total_num++;
                    model.total_quantity += modelt.quantity;
                    model.payable_amount += modelt.price * modelt.quantity;
                    model.real_amount += modelt.user_price * modelt.quantity;
                    model.total_point += modelt.point * modelt.quantity;
                }
            }
            return model;
        }
        #endregion

        #region 私有方法==========================================
        /// <summary>
        /// 获取cookies值
        /// </summary>
        private static IDictionary<string, int> GetCart()
        {
            IDictionary<string, int> dic = new Dictionary<string, int>();
            if (!string.IsNullOrEmpty(GetCookies()))
            {
                return JsonMapper.ToObject<Dictionary<string, int>>(GetCookies());
            }
            else
            {
                return null;
            }
        }
        private static IDictionary<string, string> GetCartEx()
        {
            IDictionary<string, string> dic = new Dictionary<string, string>();
            if (!string.IsNullOrEmpty(GetCookiesEx()))
            {
                return JsonMapper.ToObject<Dictionary<string, string>>(GetCookiesEx());
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 添加对象到cookies
        /// </summary>
        /// <param name="strValue"></param>
        private static void AddCookies(string strValue)
        {
            Utils.WriteCookie(AXKeys.COOKIE_SHOPPING_CART, strValue, 43200); //存储一个月
        }
        private static void AddCookiesEx(string strValue)
        {
            Utils.WriteCookie(AXKeys.COOKIE_SHOPPING_CART_EX, strValue, 43200); //存储一个月
        }

        /// <summary>
        /// 获取cookies
        /// </summary>
        /// <returns></returns>
        private static string GetCookies()
        {
            return Utils.GetCookie(AXKeys.COOKIE_SHOPPING_CART);
        }
        private static string GetCookiesEx()
        {
            return Utils.GetCookie(AXKeys.COOKIE_SHOPPING_CART_EX);
        }

        #endregion
    }

}
