using System;
using System.Collections.Generic;

namespace Model
{
    public partial class link
    {
        public link()
        { }
        #region Model
        private int _id;
        private string _title;
        private string _user_name;
        private string _user_tel;
        private string _email;
        private string _site_url;
        private string _img_url;
        private int _is_image = 0;
        private int _sort_id = 99;
        private int _is_red = 0;
        private int _is_lock;
        private DateTime? _add_time = DateTime.Now;
        /// <summary>
        /// 
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string title
        {
            set { _title = value; }
            get { return _title; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string user_name
        {
            set { _user_name = value; }
            get { return _user_name; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string user_tel
        {
            set { _user_tel = value; }
            get { return _user_tel; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string email
        {
            set { _email = value; }
            get { return _email; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string site_url
        {
            set { _site_url = value; }
            get { return _site_url; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string img_url
        {
            set { _img_url = value; }
            get { return _img_url; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int is_image
        {
            set { _is_image = value; }
            get { return _is_image; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int sort_id
        {
            set { _sort_id = value; }
            get { return _sort_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int is_red
        {
            set { _is_red = value; }
            get { return _is_red; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int is_lock
        {
            set { _is_lock = value; }
            get { return _is_lock; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? add_time
        {
            set { _add_time = value; }
            get { return _add_time; }
        }
        #endregion Model
    }
}
