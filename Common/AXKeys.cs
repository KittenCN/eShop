using System;
using System.Collections.Generic;
using System.Text;

namespace Common
{
    public class AXKeys
    {
        //系统版本
        /// <summary>
        /// 版本号全称
        /// </summary>
        public const string ASSEMBLY_VERSION = "3.0.0";
        /// <summary>
        /// 版本年号
        /// </summary>
        public const string ASSEMBLY_YEAR = "2013";
        //File======================================================
        /// <summary>
        /// 插件配制文件名
        /// </summary>
        public const string FILE_PLUGIN_XML_CONFING = "plugin.config";
        /// <summary>
        /// 站点配置文件名
        /// </summary>
        public const string FILE_SITE_XML_CONFING = "Configpath";
        /// <summary>
        /// URL配置文件名
        /// </summary>
        public const string FILE_URL_XML_CONFING = "Urlspath";
        /// <summary>
        /// 用户配置文件名
        /// </summary>
        public const string FILE_USER_XML_CONFING = "Userpath";
        /// <summary>
        /// 订单配置文件名
        /// </summary>
        public const string FILE_ORDER_XML_CONFING = "Orderpath";
        /// <summary>
        /// 升级代码
        /// </summary>
        public const string FILE_URL_UPGRADE_CODE = "267C2643EE401DD2F0A06084F7931C4DEC76E7CAA1996481FE8F5081A8936409058D07A6F5E2941C";
        /// <summary>
        /// 消息代码
        /// </summary>
        public const string FILE_URL_NOTICE_CODE = "267C2643EE401DD2F0A06084F7931C4DEC76E7CAA1996481FE8F5081A8936409D037BEA6A623A0A1";

        //Directory==================================================
        /// <summary>
        /// ASPX目录名
        /// </summary>
        public const string DIRECTORY_REWRITE_ASPX = "aspx";
        /// <summary>
        /// HTML目录名
        /// </summary>
        public const string DIRECTORY_REWRITE_HTML = "html";
        /// <summary>
        /// MOBILE目录名
        /// </summary>
        public const string DIRECTORY_REWRITE_MOBILE = "mobile";
        /// <summary>
        /// 插件目录名
        /// </summary>
        public const string DIRECTORY_REWRITE_PLUGIN = "plugin";

        //Cache======================================================
        /// <summary>
        /// 站点配置
        /// </summary>
        public const string CACHE_SITE_CONFIG = "ax_cache_site_config";
        /// <summary>
        /// 用户配置
        /// </summary>
        public const string CACHE_USER_CONFIG = "ax_cache_user_config";
        /// <summary>
        /// 订单配置
        /// </summary>
        public const string CACHE_ORDER_CONFIG = "ax_cache_order_config";
        /// HttpModule映射类
        /// </summary>
        public const string CACHE_SITE_HTTP_MODULE = "ax_cache_http_module";
        /// <summary>
        /// 绑定域名
        /// </summary>
        public const string CACHE_SITE_HTTP_DOMAIN = "ax_cache_http_domain";
        /// <summary>
        /// 站点一级目录名
        /// </summary>
        public const string CACHE_SITE_DIRECTORY = "ax_cache_site_directory";
        /// <summary>
        /// 站点ASPX目录名
        /// </summary>
        public const string CACHE_SITE_ASPX_DIRECTORY = "ax_cache_site_aspx_directory";
        /// <summary>
        /// URL重写映射表
        /// </summary>
        public const string CACHE_SITE_URLS = "ax_cache_site_urls";
        /// <summary>
        /// URL重写LIST列表
        /// </summary>
        public const string CACHE_SITE_URLS_LIST = "ax_cache_site_urls_list";
        /// <summary>
        /// 升级通知
        /// </summary>
        public const string CACHE_OFFICIAL_UPGRADE = "ax_official_upgrade";
        /// <summary>
        /// 官方消息
        /// </summary>
        public const string CACHE_OFFICIAL_NOTICE = "ax_official_notice";

        //Session=====================================================
        /// <summary>
        /// 网页验证码
        /// </summary>
        public const string SESSION_CODE = "ax_session_code";
        /// <summary>
        /// 短信验证码
        /// </summary>
        public const string SESSION_SMS_CODE = "ax_session_sms_code";
        /// <summary>
        /// 后台管理员
        /// </summary>
        public const string SESSION_ADMIN_INFO = "ax_session_admin_info";
        /// <summary>
        /// 会员用户
        /// </summary>
        public const string SESSION_USER_INFO = "ax_session_user_info";

        //Cookies=====================================================
        /// <summary>
        /// 防重复顶踩KEY
        /// </summary>
        public const string COOKIE_DIGG_KEY = "ax_cookie_digg_key";
        /// <summary>
        /// 防重复评论KEY
        /// </summary>
        public const string COOKIE_COMMENT_KEY = "ax_cookie_comment_key";
        /// <summary>
        /// 防止下载重复扣各分
        /// </summary>
        public const string COOKIE_DOWNLOAD_KEY = "ax_download_attach_key";
        /// <summary>
        /// 记住会员用户名
        /// </summary>
        public const string COOKIE_USER_NAME_REMEMBER = "ax_cookie_user_name_remember";
        /// <summary>
        /// 记住会员密码
        /// </summary>
        public const string COOKIE_USER_PWD_REMEMBER = "ax_cookie_user_pwd_remember";
        /// <summary>
        /// 购物车
        /// </summary>
        public const string COOKIE_SHOPPING_CART = "ax_cookie_shopping_cart";
        /// <summary>
        /// 返回上一页
        /// </summary>
        public const string COOKIE_URL_REFERRER = "ax_cookie_url_referrer";
    }
}
