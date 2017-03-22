using System;
using System.Data;
using System.Text;
using System.Collections.Generic;
using System.Data.SqlClient;
using DBUtility;
using Common;

namespace DAL
{
    /// <summary>
    /// 数据访问类:订单
    /// </summary>
    public partial class orders
    {
        private string databaseprefix; //数据库表名前缀
        public orders(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }

        #region 基本方法
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "orders");
            strSql.Append(" where id=@id ");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string order_no)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from " + databaseprefix + "orders");
            strSql.Append(" where order_no=@order_no ");
            SqlParameter[] parameters = {
					new SqlParameter("@order_no", SqlDbType.NVarChar,100)};
            parameters[0].Value = order_no;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }

        /// <summary>
        /// 返回数据数
        /// </summary>
        public int GetCount(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(*) as H from " + databaseprefix + "orders ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return Convert.ToInt32(DbHelperSQL.GetSingle(strSql.ToString()));
        }

        /// <summary>
        /// 增加一条数据,及其子表数据
        /// </summary>
        public int Add(Model.orders model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into " + databaseprefix + "orders(");
            strSql.Append("order_no,trade_no,user_id,user_name,payment_id,payment_fee,payment_status,payment_time,express_id,express_no,express_fee,express_status,express_time,accept_name,post_code,telphone,mobile,area,address,message,remark,payable_amount,real_amount,order_amount,point,status,add_time,confirm_time,complete_time)");
            strSql.Append(" values (");
            strSql.Append("@order_no,@trade_no,@user_id,@user_name,@payment_id,@payment_fee,@payment_status,@payment_time,@express_id,@express_no,@express_fee,@express_status,@express_time,@accept_name,@post_code,@telphone,@mobile,@area,@address,@message,@remark,@payable_amount,@real_amount,@order_amount,@point,@status,@add_time,@confirm_time,@complete_time)");
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@order_no", SqlDbType.NVarChar,100),
					new SqlParameter("@trade_no", SqlDbType.NVarChar,100),
					new SqlParameter("@user_id", SqlDbType.Int,4),
					new SqlParameter("@user_name", SqlDbType.NVarChar,100),
					new SqlParameter("@payment_id", SqlDbType.Int,4),
					new SqlParameter("@payment_fee", SqlDbType.Decimal,5),
					new SqlParameter("@payment_status", SqlDbType.TinyInt,1),
					new SqlParameter("@payment_time", SqlDbType.DateTime),
					new SqlParameter("@express_id", SqlDbType.Int,4),
					new SqlParameter("@express_no", SqlDbType.NVarChar,100),
					new SqlParameter("@express_fee", SqlDbType.Decimal,5),
					new SqlParameter("@express_status", SqlDbType.TinyInt,1),
					new SqlParameter("@express_time", SqlDbType.DateTime),
					new SqlParameter("@accept_name", SqlDbType.NVarChar,50),
					new SqlParameter("@post_code", SqlDbType.NVarChar,20),
					new SqlParameter("@telphone", SqlDbType.NVarChar,30),
					new SqlParameter("@mobile", SqlDbType.NVarChar,20),
					new SqlParameter("@area", SqlDbType.NVarChar,100),
					new SqlParameter("@address", SqlDbType.NVarChar,500),
					new SqlParameter("@message", SqlDbType.NVarChar,500),
					new SqlParameter("@remark", SqlDbType.NVarChar,500),
					new SqlParameter("@payable_amount", SqlDbType.Decimal,5),
					new SqlParameter("@real_amount", SqlDbType.Decimal,5),
					new SqlParameter("@order_amount", SqlDbType.Decimal,5),
					new SqlParameter("@point", SqlDbType.Int,4),
					new SqlParameter("@status", SqlDbType.TinyInt,1),
					new SqlParameter("@add_time", SqlDbType.DateTime),
					new SqlParameter("@confirm_time", SqlDbType.DateTime),
					new SqlParameter("@complete_time", SqlDbType.DateTime),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};
            parameters[0].Value = model.order_no;
            parameters[1].Value = model.trade_no;
            parameters[2].Value = model.user_id;
            parameters[3].Value = model.user_name;
            parameters[4].Value = model.payment_id;
            parameters[5].Value = model.payment_fee;
            parameters[6].Value = model.payment_status;
            parameters[7].Value = model.payment_time;
            parameters[8].Value = model.express_id;
            parameters[9].Value = model.express_no;
            parameters[10].Value = model.express_fee;
            parameters[11].Value = model.express_status;
            parameters[12].Value = model.express_time;
            parameters[13].Value = model.accept_name;
            parameters[14].Value = model.post_code;
            parameters[15].Value = model.telphone;
            parameters[16].Value = model.mobile;
            parameters[17].Value = model.area;
            parameters[18].Value = model.address;
            parameters[19].Value = model.message;
            parameters[20].Value = model.remark;
            parameters[21].Value = model.payable_amount;
            parameters[22].Value = model.real_amount;
            parameters[23].Value = model.order_amount;
            parameters[24].Value = model.point;
            parameters[25].Value = model.status;
            parameters[26].Value = model.add_time;
            parameters[27].Value = model.confirm_time;
            parameters[28].Value = model.complete_time;
            parameters[29].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            //订单商品列表
            if (model.order_goods != null)
            {
                StringBuilder strSql2;
                foreach (Model.order_goods models in model.order_goods)
                {
                    strSql2 = new StringBuilder();
                    strSql2.Append("insert into " + databaseprefix + "order_goods(");
                    strSql2.Append("order_id,goods_id,goods_title,goods_price,real_price,quantity,point)");
                    strSql2.Append(" values (");
                    strSql2.Append("@order_id,@goods_id,@goods_title,@goods_price,@real_price,@quantity,@point)");
                    SqlParameter[] parameters2 = {
						    new SqlParameter("@order_id", SqlDbType.Int,4),
						    new SqlParameter("@goods_id", SqlDbType.Int,4),
						    new SqlParameter("@goods_title", SqlDbType.NVarChar,100),
						    new SqlParameter("@goods_price", SqlDbType.Decimal,5),
						    new SqlParameter("@real_price", SqlDbType.Decimal,5),
						    new SqlParameter("@quantity", SqlDbType.Int,4),
						    new SqlParameter("@point", SqlDbType.Int,4)};
                    parameters2[0].Direction = ParameterDirection.InputOutput;
                    parameters2[1].Value = models.goods_id;
                    parameters2[2].Value = models.goods_title;
                    parameters2[3].Value = models.goods_price;
                    parameters2[4].Value = models.real_price;
                    parameters2[5].Value = models.quantity;
                    parameters2[6].Value = models.point;
                    cmd = new CommandInfo(strSql2.ToString(), parameters2);
                    sqllist.Add(cmd);
                }
            }
            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[29].Value;
        }

        /// <summary>
        /// 修改一列数据
        /// </summary>
        public void UpdateField(int id, string strValue)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "orders set " + strValue);
            strSql.Append(" where id=" + id);
            DbHelperSQL.ExecuteSql(strSql.ToString());
        }

        /// <summary>
        /// 修改一列数据
        /// </summary>
        public bool UpdateField(string order_no, string strValue)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "orders set " + strValue);
            strSql.Append(" where order_no='" + order_no + "'");
            int rowsAffected = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (rowsAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.orders model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update " + databaseprefix + "orders set ");
            strSql.Append("order_no=@order_no,");
            strSql.Append("trade_no=@trade_no,");
            strSql.Append("user_id=@user_id,");
            strSql.Append("user_name=@user_name,");
            strSql.Append("payment_id=@payment_id,");
            strSql.Append("payment_fee=@payment_fee,");
            strSql.Append("payment_status=@payment_status,");
            strSql.Append("payment_time=@payment_time,");
            strSql.Append("express_id=@express_id,");
            strSql.Append("express_no=@express_no,");
            strSql.Append("express_fee=@express_fee,");
            strSql.Append("express_status=@express_status,");
            strSql.Append("express_time=@express_time,");
            strSql.Append("accept_name=@accept_name,");
            strSql.Append("post_code=@post_code,");
            strSql.Append("telphone=@telphone,");
            strSql.Append("mobile=@mobile,");
            strSql.Append("area=@area,");
            strSql.Append("address=@address,");
            strSql.Append("message=@message,");
            strSql.Append("remark=@remark,");
            strSql.Append("payable_amount=@payable_amount,");
            strSql.Append("real_amount=@real_amount,");
            strSql.Append("order_amount=@order_amount,");
            strSql.Append("point=@point,");
            strSql.Append("status=@status,");
            strSql.Append("add_time=@add_time,");
            strSql.Append("confirm_time=@confirm_time,");
            strSql.Append("complete_time=@complete_time");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@order_no", SqlDbType.NVarChar,100),
					new SqlParameter("@trade_no", SqlDbType.NVarChar,100),
					new SqlParameter("@user_id", SqlDbType.Int,4),
					new SqlParameter("@user_name", SqlDbType.NVarChar,100),
					new SqlParameter("@payment_id", SqlDbType.Int,4),
					new SqlParameter("@payment_fee", SqlDbType.Decimal,5),
					new SqlParameter("@payment_status", SqlDbType.TinyInt,1),
					new SqlParameter("@payment_time", SqlDbType.DateTime),
					new SqlParameter("@express_id", SqlDbType.Int,4),
					new SqlParameter("@express_no", SqlDbType.NVarChar,100),
					new SqlParameter("@express_fee", SqlDbType.Decimal,5),
					new SqlParameter("@express_status", SqlDbType.TinyInt,1),
					new SqlParameter("@express_time", SqlDbType.DateTime),
					new SqlParameter("@accept_name", SqlDbType.NVarChar,50),
					new SqlParameter("@post_code", SqlDbType.NVarChar,20),
					new SqlParameter("@telphone", SqlDbType.NVarChar,30),
					new SqlParameter("@mobile", SqlDbType.NVarChar,20),
					new SqlParameter("@area", SqlDbType.NVarChar,100),
					new SqlParameter("@address", SqlDbType.NVarChar,500),
					new SqlParameter("@message", SqlDbType.NVarChar,500),
					new SqlParameter("@remark", SqlDbType.NVarChar,500),
					new SqlParameter("@payable_amount", SqlDbType.Decimal,5),
					new SqlParameter("@real_amount", SqlDbType.Decimal,5),
					new SqlParameter("@order_amount", SqlDbType.Decimal,5),
					new SqlParameter("@point", SqlDbType.Int,4),
					new SqlParameter("@status", SqlDbType.TinyInt,1),
					new SqlParameter("@add_time", SqlDbType.DateTime),
					new SqlParameter("@confirm_time", SqlDbType.DateTime),
					new SqlParameter("@complete_time", SqlDbType.DateTime),
                    new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = model.order_no;
            parameters[1].Value = model.trade_no;
            parameters[2].Value = model.user_id;
            parameters[3].Value = model.user_name;
            parameters[4].Value = model.payment_id;
            parameters[5].Value = model.payment_fee;
            parameters[6].Value = model.payment_status;
            parameters[7].Value = model.payment_time;
            parameters[8].Value = model.express_id;
            parameters[9].Value = model.express_no;
            parameters[10].Value = model.express_fee;
            parameters[11].Value = model.express_status;
            parameters[12].Value = model.express_time;
            parameters[13].Value = model.accept_name;
            parameters[14].Value = model.post_code;
            parameters[15].Value = model.telphone;
            parameters[16].Value = model.mobile;
            parameters[17].Value = model.area;
            parameters[18].Value = model.address;
            parameters[19].Value = model.message;
            parameters[20].Value = model.remark;
            parameters[21].Value = model.payable_amount;
            parameters[22].Value = model.real_amount;
            parameters[23].Value = model.order_amount;
            parameters[24].Value = model.point;
            parameters[25].Value = model.status;
            parameters[26].Value = model.add_time;
            parameters[27].Value = model.confirm_time;
            parameters[28].Value = model.complete_time;
            parameters[29].Value = model.id;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 删除一条数据，及子表所有相关数据
        /// </summary>
        public bool Delete(int id)
        {
            List<CommandInfo> sqllist = new List<CommandInfo>();
            StringBuilder strSql2 = new StringBuilder();
            strSql2.Append("delete from " + databaseprefix + "order_goods ");
            strSql2.Append(" where order_id=@order_id ");
            SqlParameter[] parameters2 = {
					new SqlParameter("@order_id", SqlDbType.Int,4)};
            parameters2[0].Value = id;

            CommandInfo cmd = new CommandInfo(strSql2.ToString(), parameters2);
            sqllist.Add(cmd);
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from " + databaseprefix + "orders ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);
            int rowsAffected = DbHelperSQL.ExecuteSqlTran(sqllist);
            if (rowsAffected > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.orders GetModel(int id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 id,order_no,trade_no,user_id,user_name,payment_id,payment_fee,payment_status,payment_time,express_id,express_no,express_fee,express_status,express_time,accept_name,post_code,telphone,mobile,area,address,message,remark,payable_amount,real_amount,order_amount,point,status,add_time,confirm_time,complete_time");
            strSql.Append(" from " + databaseprefix + "orders ");
            strSql.Append(" where id=@id");
            SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
            parameters[0].Value = id;

            Model.orders model = new Model.orders();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                #region 父表信息
                if (ds.Tables[0].Rows[0]["id"].ToString() != "")
                {
                    model.id = int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
                }
                model.order_no = ds.Tables[0].Rows[0]["order_no"].ToString();
                model.trade_no = ds.Tables[0].Rows[0]["trade_no"].ToString();
                if (ds.Tables[0].Rows[0]["user_id"].ToString() != "")
                {
                    model.user_id = int.Parse(ds.Tables[0].Rows[0]["user_id"].ToString());
                }
                model.user_name = ds.Tables[0].Rows[0]["user_name"].ToString();
                if (ds.Tables[0].Rows[0]["payment_id"].ToString() != "")
                {
                    model.payment_id = int.Parse(ds.Tables[0].Rows[0]["payment_id"].ToString());
                }
                if (ds.Tables[0].Rows[0]["payment_fee"].ToString() != "")
                {
                    model.payment_fee = decimal.Parse(ds.Tables[0].Rows[0]["payment_fee"].ToString());
                }
                if (ds.Tables[0].Rows[0]["payment_status"].ToString() != "")
                {
                    model.payment_status = int.Parse(ds.Tables[0].Rows[0]["payment_status"].ToString());
                }
                if (ds.Tables[0].Rows[0]["payment_time"].ToString() != "")
                {
                    model.payment_time = DateTime.Parse(ds.Tables[0].Rows[0]["payment_time"].ToString());
                }
                if (ds.Tables[0].Rows[0]["express_id"].ToString() != "")
                {
                    model.express_id = int.Parse(ds.Tables[0].Rows[0]["express_id"].ToString());
                }
                model.express_no = ds.Tables[0].Rows[0]["express_no"].ToString();
                if (ds.Tables[0].Rows[0]["express_fee"].ToString() != "")
                {
                    model.express_fee = decimal.Parse(ds.Tables[0].Rows[0]["express_fee"].ToString());
                }
                if (ds.Tables[0].Rows[0]["express_status"].ToString() != "")
                {
                    model.express_status = int.Parse(ds.Tables[0].Rows[0]["express_status"].ToString());
                }
                if (ds.Tables[0].Rows[0]["express_time"].ToString() != "")
                {
                    model.express_time = DateTime.Parse(ds.Tables[0].Rows[0]["express_time"].ToString());
                }
                model.accept_name = ds.Tables[0].Rows[0]["accept_name"].ToString();
                model.post_code = ds.Tables[0].Rows[0]["post_code"].ToString();
                model.telphone = ds.Tables[0].Rows[0]["telphone"].ToString();
                model.mobile = ds.Tables[0].Rows[0]["mobile"].ToString();
                model.area = ds.Tables[0].Rows[0]["area"].ToString();
                model.address = ds.Tables[0].Rows[0]["address"].ToString();
                model.message = ds.Tables[0].Rows[0]["message"].ToString();
                model.remark = ds.Tables[0].Rows[0]["remark"].ToString();
                if (ds.Tables[0].Rows[0]["payable_amount"].ToString() != "")
                {
                    model.payable_amount = decimal.Parse(ds.Tables[0].Rows[0]["payable_amount"].ToString());
                }
                if (ds.Tables[0].Rows[0]["real_amount"].ToString() != "")
                {
                    model.real_amount = decimal.Parse(ds.Tables[0].Rows[0]["real_amount"].ToString());
                }
                if (ds.Tables[0].Rows[0]["order_amount"].ToString() != "")
                {
                    model.order_amount = decimal.Parse(ds.Tables[0].Rows[0]["order_amount"].ToString());
                }
                if (ds.Tables[0].Rows[0]["point"].ToString() != "")
                {
                    model.point = int.Parse(ds.Tables[0].Rows[0]["point"].ToString());
                }
                if (ds.Tables[0].Rows[0]["status"].ToString() != "")
                {
                    model.status = int.Parse(ds.Tables[0].Rows[0]["status"].ToString());
                }
                if (ds.Tables[0].Rows[0]["add_time"].ToString() != "")
                {
                    model.add_time = DateTime.Parse(ds.Tables[0].Rows[0]["add_time"].ToString());
                }
                if (ds.Tables[0].Rows[0]["confirm_time"].ToString() != "")
                {
                    model.confirm_time = DateTime.Parse(ds.Tables[0].Rows[0]["confirm_time"].ToString());
                }
                if (ds.Tables[0].Rows[0]["complete_time"].ToString() != "")
                {
                    model.complete_time = DateTime.Parse(ds.Tables[0].Rows[0]["complete_time"].ToString());
                }
                #endregion

                #region 子表信息
                StringBuilder strSql2 = new StringBuilder();
                strSql2.Append("select id,order_id,goods_id,goods_title,goods_price,real_price,quantity,point from " + databaseprefix + "order_goods ");
                strSql2.Append(" where order_id=@id ");
                SqlParameter[] parameters2 = {
					    new SqlParameter("@id", SqlDbType.Int,4)};
                parameters2[0].Value = id;

                DataSet ds2 = DbHelperSQL.Query(strSql2.ToString(), parameters2);
                if (ds2.Tables[0].Rows.Count > 0)
                {
                    int i = ds2.Tables[0].Rows.Count;
                    List<Model.order_goods> models = new List<Model.order_goods>();
                    Model.order_goods modelt;
                    for (int n = 0; n < i; n++)
                    {
                        modelt = new Model.order_goods();
                        if (ds2.Tables[0].Rows[n]["id"] != null && ds2.Tables[0].Rows[n]["id"].ToString() != "")
                        {
                            modelt.id = int.Parse(ds2.Tables[0].Rows[n]["id"].ToString());
                        }
                        if (ds2.Tables[0].Rows[n]["order_id"] != null && ds2.Tables[0].Rows[n]["order_id"].ToString() != "")
                        {
                            modelt.order_id = int.Parse(ds2.Tables[0].Rows[n]["order_id"].ToString());
                        }
                        if (ds2.Tables[0].Rows[n]["goods_id"] != null && ds2.Tables[0].Rows[n]["goods_id"].ToString() != "")
                        {
                            modelt.goods_id = int.Parse(ds2.Tables[0].Rows[n]["goods_id"].ToString());
                        }
                        if (ds2.Tables[0].Rows[n]["goods_title"] != null && ds2.Tables[0].Rows[n]["goods_title"].ToString() != "")
                        {
                            modelt.goods_title = ds2.Tables[0].Rows[n]["goods_title"].ToString();
                        }
                        if (ds2.Tables[0].Rows[n]["goods_price"] != null && ds2.Tables[0].Rows[n]["goods_price"].ToString() != "")
                        {
                            modelt.goods_price = decimal.Parse(ds2.Tables[0].Rows[n]["goods_price"].ToString());
                        }
                        if (ds2.Tables[0].Rows[n]["real_price"] != null && ds2.Tables[0].Rows[n]["real_price"].ToString() != "")
                        {
                            modelt.real_price = decimal.Parse(ds2.Tables[0].Rows[n]["real_price"].ToString());
                        }
                        if (ds2.Tables[0].Rows[n]["quantity"] != null && ds2.Tables[0].Rows[n]["quantity"].ToString() != "")
                        {
                            modelt.quantity = int.Parse(ds2.Tables[0].Rows[n]["quantity"].ToString());
                        }
                        if (ds2.Tables[0].Rows[n]["point"] != null && ds2.Tables[0].Rows[n]["point"].ToString() != "")
                        {
                            modelt.point = int.Parse(ds2.Tables[0].Rows[n]["point"].ToString());
                        }
                        models.Add(modelt);
                    }
                    model.order_goods = models;
                }
                #endregion

                return model;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 根据订单号返回一个实体
        /// </summary>
        public Model.orders GetModel(string order_no)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select id from " + databaseprefix + "orders");
            strSql.Append(" where order_no=@order_no");
            SqlParameter[] parameters = {
					new SqlParameter("@order_no", SqlDbType.NVarChar,100)};
            parameters[0].Value = order_no;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj != null)
            {
                return GetModel(Convert.ToInt32(obj));
            }
            return null;
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" id,order_no,trade_no,user_id,user_name,payment_id,payment_fee,payment_status,payment_time,express_id,express_no,express_fee,express_status,express_time,accept_name,post_code,telphone,mobile,area,address,message,remark,payable_amount,real_amount,order_amount,point,status,add_time,confirm_time,complete_time ");
            strSql.Append(" FROM " + databaseprefix + "orders ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM " + databaseprefix + "orders");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        #endregion  Method
    }
}