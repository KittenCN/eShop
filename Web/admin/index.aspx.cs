using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;

namespace Web.admin
{
    public partial class index : Web.UI.ManagePage
    {
        protected Model.manager admin_info;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                admin_info = GetAdminInfo();
            }
        }
        // 下载于www.51aspx.com
        //安全退出
        protected void lbtnExit_Click(object sender, EventArgs e)
        {
            Session[AXKeys.SESSION_ADMIN_INFO] = null;
            Utils.WriteCookie("AdminName", "AoXiang", -14400);
            Utils.WriteCookie("AdminPwd", "AoXiang", -14400);
            Response.Redirect("login.aspx");
        }

    }
}