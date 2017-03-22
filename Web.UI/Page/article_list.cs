using System;
using System.Collections.Generic;
using System.Text;
using Common;

namespace Web.UI.Page
{
    public partial class article_list : Web.UI.BasePage
    {
        protected int page;         //当前页码
        protected int category_id;  //类别ID
        protected int vote_id;  //品牌ID
        protected int totalcount;   //OUT数据总数
        protected string pagelist;  //分页页码

        protected Model.article_category model = new Model.article_category();
        /// <summary>
        /// 重写虚方法,此方法将在Init事件前执行
        /// </summary>
        protected override void ShowPage()
        {
            page = AXRequest.GetQueryInt("page", 1);
            category_id = AXRequest.GetQueryInt("category_id");
            vote_id = AXRequest.GetQueryInt("vote_id");
            BLL.article_category bll = new BLL.article_category();
            model.title = "所有信息";
            if (category_id > 0) //如果ID获取到，将使用ID
            {
                if (bll.Exists(category_id))
                    model = bll.GetModel(category_id);
            }
          
        }
    }
}
