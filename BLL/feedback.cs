using System;
using System.Data;
using System.Collections.Generic;
using Common;

namespace BLL
{
    public partial class feedback
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.feedback dal;

        public feedback()
        {
            dal = new DAL.feedback(siteConfig.sysdatabaseprefix);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.feedback model)
        {
            return dal.Add(model);
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
