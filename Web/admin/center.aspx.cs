using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;

namespace Web.admin
{
    public partial class center : Web.UI.ManagePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Model.manager admin_info = GetAdminInfo(); //管理员信息
                //登录信息
                if (admin_info != null)
                {
                    BLL.manager_log bll = new BLL.manager_log();
                    Model.manager_log model1 = bll.GetModel(admin_info.user_name, 1, AXEnums.ActionEnum.Login.ToString());
                    if (model1 != null)
                    {
                        //本次登录
                        litIP.Text = model1.user_ip;
                    }
                    Model.manager_log model2 = bll.GetModel(admin_info.user_name, 2, AXEnums.ActionEnum.Login.ToString());
                    if (model2 != null)
                    {
                        //上一次登录
                        litBackIP.Text = model2.user_ip;
                        litBackTime.Text = model2.add_time.ToString();
                    }
                }
                //LitUpgrade.Text = Utils.GetDomainStr(AXKeys.CACHE_OFFICIAL_UPGRADE, DESEncrypt.Decrypt(AXKeys.FILE_URL_UPGRADE_CODE, "DT"));
                //LitNotice.Text = Utils.GetDomainStr(AXKeys.CACHE_OFFICIAL_NOTICE, DESEncrypt.Decrypt(AXKeys.FILE_URL_NOTICE_CODE, "DT"));
                //Utils.GetDomainStr("ax_cache_domain_info", "http://www.net/upgrade.ashx?u=" + Request.Url.DnsSafeHost + "&i=" + Request.ServerVariables["LOCAL_ADDR"]);
            }
        }
    }
}