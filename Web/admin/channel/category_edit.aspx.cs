using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;

namespace Web.admin.channel
{
    public partial class category_edit : Web.UI.ManagePage
    {
        private string action = AXEnums.ActionEnum.Add.ToString(); //操作类型
        private int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = AXRequest.GetQueryString("action");

            if (!string.IsNullOrEmpty(_action) && _action == AXEnums.ActionEnum.Edit.ToString())
            {
                this.action = AXEnums.ActionEnum.Edit.ToString();//修改类型
                this.id = AXRequest.GetQueryInt("id");
                if (this.id == 0)
                {
                    JscriptMsg("传输参数不正确！", "back", "Error");
                    return;
                }
                if (!new BLL.channel_category().Exists(this.id))
                {
                    JscriptMsg("记录不存在或已被删除！", "back", "Error");
                    return;
                }
            }
            if (!Page.IsPostBack)
            {
                ChkAdminLevel("site_channel_category", AXEnums.ActionEnum.View.ToString()); //检查权限
                if (action == AXEnums.ActionEnum.Edit.ToString()) //修改
                {
                    ShowInfo(this.id);
                }
                else
                {
                    txtTitle.Attributes.Add("onBlur", "change2cn(this.value, this.form.txtBuildPath)");
                    txtBuildPath.Attributes.Add("ajaxurl", "../../tools/admin_ajax.ashx?action=channel_category_validate");
                }
            }
        }

        #region 赋值操作=================================
        private void ShowInfo(int _id)
        {
            BLL.channel_category bll = new BLL.channel_category();
            Model.channel_category model = bll.GetModel(_id);

            txtTitle.Text = model.title;
            txtBuildPath.Text = model.build_path;
            txtBuildPath.Attributes.Add("ajaxurl", "../../tools/admin_ajax.ashx?action=channel_category_validate&old_build_path=" + Utils.UrlEncode(model.build_path));
            txtBuildPath.Focus(); //设置焦点，防止JS无法提交
            txtDomain.Text = model.domain;
            txtSortId.Text = model.sort_id.ToString();
            if (model.is_default == 1)
            {
                cbIsDefault.Checked = true;
            }
            else
            {
                cbIsDefault.Checked = false;
            }
        }
        #endregion

        #region 增加操作=================================
        private bool DoAdd()
        {
            Model.channel_category model = new Model.channel_category();
            BLL.channel_category bll = new BLL.channel_category();

            model.title = txtTitle.Text.Trim();
            model.build_path = txtBuildPath.Text.Trim();
            model.domain = txtDomain.Text.Trim();
            model.sort_id = Utils.StrToInt(txtSortId.Text.Trim(), 99);
            if (cbIsDefault.Checked == true)
            {
                model.is_default = 1;
            }
            else
            {
                model.is_default = 0;
            }

            if (bll.Add(model) > 0)
            {
                //更新一下域名缓存
                CacheHelper.Remove(AXKeys.CACHE_SITE_HTTP_DOMAIN);
                AddAdminLog(AXEnums.ActionEnum.Add.ToString(), "添加频道分类:" + model.title); //记录日志
                return true;
            }
            
            return false;
        }
        #endregion

        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            bool result = false;
            BLL.channel_category bll = new BLL.channel_category();
            Model.channel_category model = bll.GetModel(_id);

            model.title = txtTitle.Text.Trim();
            model.build_path = txtBuildPath.Text.Trim();
            model.domain = txtDomain.Text.Trim();
            model.sort_id = Utils.StrToInt(txtSortId.Text.Trim(), 99);
            if (cbIsDefault.Checked == true)
            {
                model.is_default = 1;
            }
            else
            {
                model.is_default = 0;
            }

            if (bll.Update(model))
            {
                //更新一下域名缓存
                CacheHelper.Remove(AXKeys.CACHE_SITE_HTTP_DOMAIN);
                AddAdminLog(AXEnums.ActionEnum.Edit.ToString(), "修改频道分类:" + model.title); //记录日志
                result = true;
            }

            return result;
        }
        #endregion

        //保存
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (action == AXEnums.ActionEnum.Edit.ToString()) //修改
            {
                ChkAdminLevel("site_channel_category", AXEnums.ActionEnum.Edit.ToString()); //检查权限
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误！", "", "Error");
                    return;
                }
                JscriptMsg("修改频道分类成功！", "category_list.aspx", "Success", "parent.loadMenuTree");
            }
            else //添加
            {
                ChkAdminLevel("site_channel_category", AXEnums.ActionEnum.Add.ToString()); //检查权限
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误！", "", "Error");
                    return;
                }
                JscriptMsg("添加频道分类成功！", "category_list.aspx", "Success", "parent.loadMenuTree");
            }
        }
    }
}