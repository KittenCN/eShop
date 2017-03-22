using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DBUtility;
using Common;

namespace DAL
{
    public partial class link
    {
        private string databaseprefix; //数据库表名前缀
        public link(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,title,user_name,user_tel,email,site_url,img_url,is_image,sort_id,is_red,is_lock,add_time ");
            strSql.Append(" FROM ax_link ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
    }
}
