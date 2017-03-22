using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    /// <summary>
    /// 订单配置信息
    /// </summary>
    [Serializable]
    public class orderconfig
    {
        public orderconfig()
        { }
        private int _anonymous = 0;
        private int _confirmmsg = 0;
        private string _confirmcallindex = "";
        private int _expressmsg = 0;
        private string _expresscallindex = "";
        private int _completemsg = 0;
        private string _completecallindex = "";

        /// <summary>
        /// 开启匿名购物0否1是
        /// </summary>
        public int anonymous
        {
            get { return _anonymous; }
            set { _anonymous = value; }
        }
        /// <summary>
        /// 订单确认通知0关闭1短信2邮件
        /// </summary>
        public int confirmmsg
        {
            get { return _confirmmsg; }
            set { _confirmmsg = value; }
        }
        /// <summary>
        /// 通知模板别名
        /// </summary>
        public string confirmcallindex
        {
            get { return _confirmcallindex; }
            set { _confirmcallindex = value; }
        }
        /// <summary>
        /// 订单送货通知0关闭1短信2邮件
        /// </summary>
        public int expressmsg
        {
            get { return _expressmsg; }
            set { _expressmsg = value; }
        }
        /// <summary>
        /// 通知模板别名
        /// </summary>
        public string expresscallindex
        {
            get { return _expresscallindex; }
            set { _expresscallindex = value; }
        }
        /// <summary>
        /// 订单完成通知0关闭1短信2邮件
        /// </summary>
        public int completemsg
        {
            get { return _completemsg; }
            set { _completemsg = value; }
        }
        /// <summary>
        /// 通知模板别名
        /// </summary>
        public string completecallindex
        {
            get { return _completecallindex; }
            set { _completecallindex = value; }
        }
    }
}
