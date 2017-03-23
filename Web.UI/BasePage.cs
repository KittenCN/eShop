﻿using System;
using System.Reflection;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Configuration;
using Common;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Web.UI
{
    public partial class BasePage : System.Web.UI.Page
    {
        protected internal Model.siteconfig config = new BLL.siteconfig().loadConfig();
        protected internal Model.userconfig uconfig = new BLL.userconfig().loadConfig();
        /// <summary>
        /// 父类的构造函数
        /// </summary>
        public BasePage()
        {
            //是否关闭网站
            if (config.webstatus == 0)
            {
                HttpContext.Current.Response.Redirect(config.webpath + "error.aspx?msg=" + Utils.UrlEncode(config.webclosereason));
                return;
            }
            ShowPage();
        }

        /// <summary>
        /// 页面处理虚方法
        /// </summary>
        protected virtual void ShowPage()
        {
            //虚方法代码
        }

        #region 页面通用方法==========================================
        /// <summary>
        /// 返回URL重写统一链接地址
        /// </summary>
        public string linkurl(string _key, params object[] _params)
        {
            Hashtable ht = new BLL.url_rewrite().GetList(); //获得URL配置列表
            Model.url_rewrite model = ht[_key] as Model.url_rewrite; //查找指定的URL配置节点

            //如果不存在该节点则返回空字符串
            if (model == null)
            {
                return string.Empty;
            }

            string requestDomain = HttpContext.Current.Request.Url.Authority.ToLower(); //获得来源域名含端口号
            string requestFirstPath = GetFirstPath();//获得二级目录(不含站点安装目录)
            string linkStartString = string.Empty; //链接前缀

            //检查是否与绑定的域名或者与默认频道分类的目录匹配
            if (SiteDomains.GetSiteDomains().CategoryDirs.ContainsValue(requestDomain))
            {
                linkStartString = "/";
            }

            else if (requestFirstPath == string.Empty || requestFirstPath == SiteDomains.GetSiteDomains().DefaultPath)
            {
                linkStartString = config.webpath;
            }
            else
            {
                linkStartString = config.webpath + requestFirstPath + "/";
            }
            //如果URL字典表达式不需要重写则直接返回
            if (model.url_rewrite_items.Count == 0)
            {
                //检查网站重写状态
                if (config.staticstatus > 0)
                {
                    if (_params.Length > 0)
                    {
                        return linkStartString + GetUrlExtension(model.page, config.staticextension) + string.Format("{0}", _params);
                    }
                    else
                    {
                        return linkStartString + GetUrlExtension(model.page, config.staticextension);
                    }
                }
                else
                {
                    if (_params.Length > 0)
                    {
                        return linkStartString + model.page + string.Format("{0}", _params);
                    }
                    else
                    {
                        return linkStartString + model.page;
                    }
                }
            }
            //否则检查该URL配置节点下的子节点
            foreach (Model.url_rewrite_item item in model.url_rewrite_items)
            {
                //如果参数个数匹配
                if (IsUrlMatch(item, _params))
                {
                    //检查网站重写状态
                    if (config.staticstatus > 0)
                    {
                        return linkStartString + string.Format(GetUrlExtension(item.path, config.staticextension), _params);
                    }
                    else
                    {
                        string queryString = Regex.Replace(string.Format(item.path, _params), item.pattern, item.querystring, RegexOptions.None | RegexOptions.IgnoreCase);
                        if (queryString.Length > 0)
                        {
                            queryString = "?" + queryString;
                        }
                        return linkStartString + model.page + queryString;
                    }
                }
            }

            return string.Empty;
        }

        /// <summary>
        /// 返回分页字符串
        /// </summary>
        /// <param name="pagesize">页面大小</param>
        /// <param name="pageindex">当前页</param>
        /// <param name="totalcount">记录总数</param>
        /// <param name="_key">URL映射Name名称</param>
        /// <param name="_params">传输参数</param>
        protected string get_page_link(int pagesize, int pageindex, int totalcount, string _key, params object[] _params)
        {
            return Utils.OutPageList(pagesize, pageindex, totalcount, linkurl(_key, _params), 8);
        }

        /// <summary>
        /// 返回分页字符串
        /// </summary>
        /// <param name="pagesize">页面大小</param>
        /// <param name="pageindex">当前页</param>
        /// <param name="totalcount">记录总数</param>
        /// <param name="linkurl">链接地址</param>
        protected string get_page_link(int pagesize, int pageindex, int totalcount, string linkurl)
        {
            return Utils.OutPageList(pagesize, pageindex, totalcount, linkurl, 8);
        }
        #endregion

        #region 会员用户方法==========================================
        /// <summary>
        /// 判断用户是否已经登录(解决Session超时问题)
        /// </summary>
        public bool IsUserLogin()
        {
            //如果Session为Null
            if (HttpContext.Current.Session[AXKeys.SESSION_USER_INFO] != null)
            {
                return true;
            }
            else
            {
                //检查Cookies
                string username = Utils.GetCookie(AXKeys.COOKIE_USER_NAME_REMEMBER, "AoXiang");
                string password = Utils.GetCookie(AXKeys.COOKIE_USER_PWD_REMEMBER, "AoXiang");
                if (username != "" && password != "")
                {
                    BLL.users bll = new BLL.users();
                    Model.users model = bll.GetModel(username, password, 0, 0, false);
                    if (model != null)
                    {
                        HttpContext.Current.Session[AXKeys.SESSION_USER_INFO] = model;
                        return true;
                    }
                }
            }
            return false;
        }

        /// <summary>
        /// 取得用户信息
        /// </summary>
        public Model.users GetUserInfo()
        {
            if (IsUserLogin())
            {
                Model.users model = HttpContext.Current.Session[AXKeys.SESSION_USER_INFO] as Model.users;
                if (model != null)
                {
                    //为了能查询到最新的用户信息，必须查询最新的用户资料
                    model = new BLL.users().GetModel(model.id);
                    return model;
                }
            }
            return null;
        }
        #endregion

        #region 辅助方法(私有)========================================
        /// <summary>
        /// 获取访问的频道分类目录(不含安装目录)
        /// </summary>
        private string GetFirstPath()
        {
            //string requestPath = HttpContext.Current.Request.CurrentExecutionFilePath.ToLower();//获得当前页面虚拟路径
            string requestPath = HttpContext.Current.Request.RawUrl.ToLower();
            int indexNum = config.webpath.Length; //安装目录长度
            //如果包含安装目录和aspx目录也要过滤掉
            if (requestPath.StartsWith(config.webpath + AXKeys.DIRECTORY_REWRITE_ASPX + "/"))
            {
                indexNum = (config.webpath + AXKeys.DIRECTORY_REWRITE_ASPX + "/").Length;
            }
            string requestFirstPath = requestPath.Substring(indexNum);
            if (requestFirstPath.IndexOf("/") > 0)
            {
                requestFirstPath = requestFirstPath.Substring(0, requestFirstPath.IndexOf("/"));
            }
            if (requestFirstPath != string.Empty && SiteDomains.GetSiteDomains().CategoryDirs.ContainsKey(requestFirstPath))
            {
                return requestFirstPath;
            }
            return string.Empty;
        }
        /// <summary>
        /// 返回相应的品牌
        /// </summary>
        /// <param name="vote_id">信息ID</param>
        /// <returns>String</returns>
        protected string get_article_pp(int vote_id)
        {
            Model.article_category model = new BLL.article_category().GetModel(vote_id);
            if (model != null)
            {
                return model.title;
            }
            return "";
        }
        /// <summary>
        /// 参数个数是否匹配
        /// </summary>
        private bool IsUrlMatch(Model.url_rewrite_item item, params object[] _params)
        {
            int strLength = 0;
            if (!string.IsNullOrEmpty(item.querystring))
            {
                strLength = item.querystring.Split('&').Length;
            }
            if (strLength == _params.Length)
            {
                //注意__id__代表分页页码，所以须替换成数字才成进行匹配
                if (Regex.IsMatch(string.Format(item.path, _params).Replace("__id__", "1"), item.pattern, RegexOptions.None | RegexOptions.IgnoreCase))
                {
                    return true;
                }
            }
            return false;
        }

        /// <summary>
        /// 替换扩展名
        /// </summary>
        private string GetUrlExtension(string urlPage, string staticExtension)
        {
            return Utils.GetUrlExtension(urlPage, staticExtension);
        }

        #endregion

        #region 页面处理
        protected string CreateMulitSelect(string ModelName, int article_id)
        {
            //创建一个dl标签
            HtmlGenericControl htmlDL = new HtmlGenericControl("dl");
            HtmlGenericControl htmlDT = new HtmlGenericControl("dt");
            HtmlGenericControl htmlDD = new HtmlGenericControl("dd");

            RadioButtonList rblControl = new RadioButtonList();
            rblControl.ID = "field_control_" + ModelName;
            rblControl.RepeatDirection = RepeatDirection.Horizontal;
            rblControl.RepeatLayout = RepeatLayout.Flow;
            HtmlGenericControl htmlDiv2 = new HtmlGenericControl("div");
            htmlDiv2.Attributes.Add("class", "rule-multi-radio");
            htmlDiv2.Controls.Add(rblControl);

            string ModelList = "";
            string ModelDef = "1";
            string ModelTip = "";

            Model.article model = new BLL.article().GetModel(article_id);
            switch(ModelName)
            {
                case "ColorString":
                    ModelList = model.ColorString;
                    break;
                case "SizeString":
                    ModelList = model.SizeString;
                    break;
            }

            //赋值选项
            string[] valArr = ModelList.Split(new string[] { "\r\n", "\n", "\\r\\n", "\\n" }, StringSplitOptions.None);
            for (int i = 0; i < valArr.Length; i++)
            {
                string[] valItemArr = valArr[i].Split('|');
                if (valItemArr.Length == 2)
                {
                    rblControl.Items.Add(new ListItem(valItemArr[0], valItemArr[1]));
                }
            }
            rblControl.SelectedValue = ModelDef; //默认值
                                                 //创建一个Label控件
            Label labelControl4 = new Label();
            labelControl4.CssClass = "Validform_checktip";
            labelControl4.Text = ModelTip;
            //将控件添加至DD中
            htmlDD.Controls.Add(htmlDiv2);
            //htmlDD.Controls.Add(labelControl4);

            //将DT和DD添加到DL中
            htmlDL.Controls.Add(htmlDT);
            htmlDL.Controls.Add(htmlDD);

            ////将DL添加至field_tab_content中
            //field_tab_content.Controls.Add(htmlDL);

            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            htmlDL.RenderControl(htw);
            return sb.ToString();
        }

        public string GetString(string ObjNmae, System.Web.UI.Control page)
        {
            string strResult = "";
            RadioButtonList cbControl = page.FindControl("field_control_" + ObjNmae) as RadioButtonList;
            if(cbControl != null)
            {
                strResult = cbControl.SelectedValue;
            }
            return strResult;
        }
        #endregion
    }
}
