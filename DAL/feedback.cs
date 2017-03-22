using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DBUtility;
using Common;

namespace DAL
{
    public partial class feedback
    {
        private string databaseprefix; //数据库表名前缀
        public feedback(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.feedback model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into ax_feedback(");
            strSql.Append("title,content,user_name,user_tel,user_qq,user_email,add_time,reply_content,reply_time,is_lock)");
            strSql.Append(" values (");
            strSql.Append("@title,@content,@user_name,@user_tel,@user_qq,@user_email,@add_time,@reply_content,@reply_time,@is_lock)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@title", SqlDbType.NVarChar,100),
					new SqlParameter("@content", SqlDbType.NText),
					new SqlParameter("@user_name", SqlDbType.NVarChar,50),
					new SqlParameter("@user_tel", SqlDbType.NVarChar,30),
					new SqlParameter("@user_qq", SqlDbType.NVarChar,30),
					new SqlParameter("@user_email", SqlDbType.NVarChar,100),
					new SqlParameter("@add_time", SqlDbType.DateTime),
					new SqlParameter("@reply_content", SqlDbType.NText),
					new SqlParameter("@reply_time", SqlDbType.DateTime),
					new SqlParameter("@is_lock", SqlDbType.TinyInt,1)};
            parameters[0].Value = model.title;
            parameters[1].Value = model.content;
            parameters[2].Value = model.user_name;
            parameters[3].Value = model.user_tel;
            parameters[4].Value = model.user_qq;
            parameters[5].Value = model.user_email;
            parameters[6].Value = model.add_time;
            parameters[7].Value = model.reply_content;
            parameters[8].Value = model.reply_time;
            parameters[9].Value = model.is_lock;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id,title,content,user_name,user_tel,user_qq,user_email,add_time,reply_content,reply_time,is_lock ");
            strSql.Append(" FROM ax_feedback ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
    }
}
