
/** 域名 */
NSString * const HTZDomainString = @"http://api.jiuduge.com";

/***************************************用户模块******************************************/
/** 登录接口 */
NSString * const HTZUserLoginInterface = @"/user/login";
/** 注册接口 */
NSString * const HTZUserRegisterInterface = @"/user/create";
/** 找回密码接口 */
NSString * const HTZUserFindPasswordSecurityCodeInterface = @"/user/findpwd_auth";
/** 找回密码-重置密码接口 */
NSString * const HTZUserFindPasswordResetInterface = @"/user/findpwd";
/** 更新密码接口 */
NSString * const HTZUserResetPasswordInterface = @"/user/resetpwd";
/** 用户详情接口 */
NSString * const HTZUserDetailInterface = @"/user/detail";

/***************************************订单模块******************************************/
/** 创建订单接口 */
NSString * const HTZOrderCreateInterface = @"/order/create";
/** 订单详情接口 */
NSString * const HTZOrderDetailInterface = @"/order/detail";
/** 订单列表接口 */
NSString * const HTZOrderListInterface = @"/order/list";
/** 删除订单接口 */
NSString * const HTZOrderDeleteInterface = @"/order/delete";

/***************************************物流模块******************************************/
/** 创建物流单接口 */
NSString * const HTZExpressCreateInterface = @"/express/create";
/** 物流单详情接口 */
NSString * const HTZExpressDetailInterface = @"/express/detail";
/** 物流单信息同步接口 */
NSString * const HTZExpressInformationSyncInterface = @"/express/sync";
/** 物流单状态变更接口 */
NSString * const HTZExpressStateInterface = @"/express/sync_status";

/***************************************物流模块******************************************/
/** 订单评价接口 */
NSString * const HTZCommentOrderInterface = @"/comment/order";
/** 物流评价接口 */
NSString * const HTZCommentExpressInterface = @"/comment/express";
/** 客户评价接口 */
NSString * const HTZCommentCustomerInterface = @"/comment/express";
/** 搅拌厂评价接口 */
NSString * const HTZCommentMixPlantInterface = @"/comment/login";


/** 边缘距离 */
CGFloat const HTZMargin = 10;
/** iPhoneX Tabbar的高度 */
CGFloat const HTZIPhoneXTabbarHeight = 83;
/** iPhoneX NavigationBar的高度 */
CGFloat const HTZIPhoneXNavigationBarHeight = 88;
/** 非iPhoneX NavigationBar的高度 */
CGFloat const HTZNotIPhoneNavigationBarHeight = 64;
/** Layer边宽宽度 */
CGFloat const HTZLayerBorderWidth = 0.6;
/** Layer圆角 */
CGFloat const HTZLayerCornerRadius = 4.0;

/** Layer圆角 */
NSString * const HTZModifyTabBarChildController = @"ModifyTabBarChildController";

/** 自动登录key */
NSString * const HTZAutomaticLoginKey = @"AutomaticLoginKey";

/** 角色key */
NSString * const kHTZRole = @"role";
/** 客户角色key */
NSString * const kHTZCustomerRole = @"CUSTOMER";
/** 搅拌厂角色key */
NSString * const kHTZPlantRole = @"PLANT";
/** 物流公司角色key */
NSString * const kHTZExpressRole = @"EXPRESS";
/** 司机角色key */
NSString * const kHTZDriverRole = @"DRIVER";

