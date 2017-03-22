using System;
using System.Data;
using System.Collections.Generic;
using Common;


namespace BLL
{
    public partial class link
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.link dal;

        public link()
        {
            dal = new DAL.link(siteConfig.sysdatabaseprefix);
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }
    }
}
