//
//  HTTPSRequestURL.h
//  VTIME
//
//  Created by Louie on 2017/9/12.
//  Copyright © 2017年 MadridLee. All rights reserved.
//

#ifndef HTTPSRequestURL_h
#define HTTPSRequestURL_h


#endif /* HTTPSRequestURL_h */


/***********************************************
 
 --------            0.0.2              --------
 
 ***********************************************/


#pragma mark ******************** HTTPS请求 ********************
#define Auditing @"http://test.51moyo.com"// 审核服


//#define TEST // TODO: 此宏打开是测试服 注释掉 是正式服

#ifdef TEST /////////////////////////   分割线  if  测试服-----------------------
#pragma mark ################ 分割线 if 测试服 ################
//  域名
#define DOMAINNAME  @"hhttp://test.51moyo.com"  // @"http://time.tingting365.com"//@"http://test.api.sviptime.com"  @"http://time.tingting365.com"

//  分享域名地址
#define ThirdPartyShareURL @"http://H5.51moyo.com"  // @"http://time.tingting365.com"

//  https证书名称
#define CertificatePath @"moyoCertificate"

//  环信APPKey
#define HuanXinAppKey @"1181180105115318#moyo"  // @"1155170301115042#vage"

//  环信推送证书名称
#define HuanXinPushCer @"moyo-aps" //@"DevelopmentPush"

//  环信世界频道ID
#define WorldChannelID @"43020551520257"


#else /////////////////////////   分割线   else 正式服-----------------------
#pragma mark ################ 分割线 else 正式服 ################

//  域名
#define DOMAINNAME @"https://api.51moyo.com"

// 分享域名地址
#define ThirdPartyShareURL @"http://h5.sviptime.com"

//  证书名称
#define CertificatePath @"moyoCertificate"

//  环信APPKey
#define HuanXinAppKey @"1181180105115318#moyo"

//  环信推送证书名称
#define HuanXinPushCer @"PushServices"

//  环信世界频道ID
#define WorldChannelID @"43020551520257"

#endif



#pragma mark - ------------ 通用 ------------
//  上传文件
#define UploadFileURL @"/uploadapi/vt/upload/vi"

//  获取版本号
#define GetiOSVersion   @"/dataapi/ios/iosVersion"





#pragma mark - ------------ 登录 ------------
//  登录
#define LoginURL @"/sso/vt/login"
// 加入世界频道
#define AddWorldChannel @"/dataapi/cg/common/addWorldChannel"
//  发送验证码
#define GetCodeURL @"/sso/vt/sendCode"

//  获取标签
#define GetTagUrl @"/dataapi/cg/common/getTags"

//  验证Key
#define AutomaticLoginUrl @"/sso/vt/loginKeyVarify"


#pragma mark - ------------ 首页 ------------

// 最近活跃
#define HomeNativeUsersUrl @"/dataapi/cg/user/nativeUsers"

//  活跃
#define ActiveUsersURL @"/dataapi/cg/user/activeUsers"

// 最新加入
#define HomeNewAddUrl @"/dataapi/cg/user/newAdd"

// 个人信息
#define PersonalInfoUrl @"/dataapi/cg/user/userCenter"

//拉黑 取消拉黑
#define BlackUpdataUrl @"/dataapi/cg/user/black/update"

//获取举报列表
#define ReportReasonUrl @"/dataapi/cg/common/reportCause"
//举报个人
#define ReportUrl @"/dataapi/cg/feedback/addReport"

//上传相册
#define UploadPhotoUrl @"/dataapi/cg/user/uploadPhoto"

// 是否挂状态
#define GetFirstStatement @"/dataapi/cg/user/getFirstStatement"

//挂状态
#define AddStatementUrl @"/dataapi/cg/user/addStatement"

//  首页 banners
#define BannersHomepage @"/dataapi/cg/common/banners"

#pragma mark - - ---------------- 俱乐部 -----------

#define CreateClub @"/dataapi/cg/club/createClub"

//获取俱乐部列表
#define ClubListUrl @"/dataapi/cg/club/getAllClubList"

//获取俱乐部详情
#define ClubDetailUrl @"/dataapi/cg/club/clubInfo"

//获取世界频道10条聊天记录
#define GetFastLoginWorldUrl @"/dataapi/cg/club/getFastLoginWorld"

// 发红包
#define SendMultipleHongbao @"/dataapi/cg/user/sendMultipleHongbao"
// 发红包最大上限
#define SendMHongBaoLimit @"/dataapi/cg/club/getHongBaoLimit"
// 红包详情
#define ListMultipleHongbaoGrep @"/dataapi/cg/user/listMultipleHongbaoGrep"

//申请加入俱乐部
#define ClubApplyUrl @"/dataapi/cg/club/apply"

//获得所有邀请或申请信息
#define GetClubApplyUrl @"/dataapi/cg/club/getApplyInfo"

//同意申请
#define AgreeClubApplyUrl @"/dataapi/cg/club/agreeApply"

//不同意申请
#define DisagreeClubApplyUrl @"/dataapi/cg/club/disagreeApply"

//获得编辑俱乐部时所有成员列表
#define GetClubUserListUrl @"/dataapi/cg/club/getClubUserList"

//踢人
#define KickClubUserUrl @"/dataapi/cg/club/removeClubUser"

//获取用户邀请列表
#define ClubInvitedFriendList  @"/dataapi/cg/club/getInviteUserList"

//邀请用户加入俱乐部
#define ClubInviteFriendJoin  @"/dataapi/cg/club/inviteUser"

//设置管理员
#define ClubSetManagerUrl  @"/dataapi/cg/club/addClubManager"

//取消管理员
#define ClubRemoveManagerUrl  @"/dataapi/cg/club/removeClubManager"

//修改俱乐部信息
#define UpdateClubUrl  @"/dataapi/cg/club/update"

//退出俱乐部
#define QuitClubUrl  @"/dataapi/cg/club/quitClub"

// 抢群红包
#define GrabRedPacketUrl @"/dataapi/cg/user/grepMultipleHongbao"

// 清空请求列表
#define CleanAllApplyUrl @"/dataapi/cg/club/cleanApplyInfo"


//购买霸屏
#define BuyBupingUrl @"/dataapi/cg/user/buyBuping"

// 获得用户所在所有俱乐部
#define GetUserClubsUrl @"/dataapi/cg/club/getUserClubs"

//俱乐部当前霸屏
#define CurrentBpingUrl @"/dataapi/cg/club/getBaping"

//俱乐部协议
#define CurrentDealUrl @"/VEra/club_deal.html"

#pragma mark - ------------ 任务 ------------

// 发布任务
#define TaskPublishURL @"/dataapi/cg/task/publish"
//  任务列表
#define TaskListURL @"/dataapi/cg/task/list"
//  同意/拒绝 参与任务
#define TaskAgreeURL @"/dataapi/cg/task/agree"
//  完成任务
#define TaskFinishURL @"/dataapi/cg/task/finish"
//  终止任务
#define TaskOverURL @"/dataapi/cg/task/over"
//  拾取任务
#define TaskPickURL @"/dataapi/cg/task/pick"
//  活动报名者列表
#define TaskMembersURL @"/dataapi/cg/task/members"
//获得是否上首页和是否为贵族
#define TaskIdentity @"/dataapi/cg/user/userIdentity"

//  查询任务进度的接口
#define TaskqueryCourseURL @"/dataapi/cg/task/queryCourse"


#pragma mark - ------------ 动态 ------------
//  发布动态
#define DynamicAddUrl @"/dataapi/cg/dynamic/add"
//  动态列表
#define DynamicListURL @"/dataapi/cg/dynamic/list"
//  关注Or取消   0为关注，1为取消关注
#define AttentionURL @"/dataapi/cg/follow/add"
//  点赞 0 赞  1 取消
#define ZanURL @"/dataapi/cg/dynamic/zan"
//  举报
#define ReportDynamicURL @"/dataapi/cg/feedback/addReport"
//  删除动态
#define DeleteDynamicURL @"/dataapi/cg/dynamic/del/dynamic"
//  是否可以聊天
#define ChatStatusUrl @"/dataapi/cg/user/chatStatus"
//  浏览量
#define addViewUrl @"/dataapi/cg/dynamic/addView"

#pragma mark - ------------ 发现 ------------
//  隐藏自己
#define HideMeURL @"/dataapi/cg/user/setSecretStatus"
//  地图人大头针
#define AMPNearURL @"/dataapi/cg/user/mapNearbyUsers"
//  红包支付
#define SenderRedPacketURL @"/dataapi/cg/user/sendHongbao"
//私聊小红包
//#define SenderSingleRedPacketURL @"/dataapi/cg/user/sendSingleHongbao"
//动态打赏红包
#define SenderdynamicRedPacketURL @"/dataapi/cg/dynamic/dynamicEncourage"
//  确认或取消红包
#define GiveRedPacketURL @"/dataapi/cg/user/giveHongbao"
//  接受或拒绝红包
#define GrepRedPacketURL @"/dataapi/cg/user/grepHongbao"
//支付状态查询
#define GetPayStatusURL @"/dataapi/cg/common/getPayStatus"

#pragma mark - ------------ 信息 ------------
//  是否给聊天对象发红包
#define OrderRedPaceketURL @"/dataapi/cg/user/getHongbaoInfo"
//  通讯录
#define AddressListURL @"/dataapi/cg/follow/directories"
//  公众号 push_serviceElite.html 精英 push_serviceLive.html 生活
#define ServiceElitetURL @"push_serviceElite.html"
#define ServiceLiveURL @"push_serviceLive.html"


#pragma mark - ------------ 我的 ------------
//  我的账户，收益明细
#define ConsumeDetailURL @"/dataapi/cg/wallet/consume/detail"
//  点赞记录
#define zanListURL @"/dataapi/cg/dynamic/myDynamicClickUsers"
//  打赏记录
#define dashangListURL @"/dataapi/cg/dynamic/getDynamicEncourage"
//  视频认证
#define VideoIDentityUrl @"/dataapi/cg/varify/video"
//  我的主页面
#define UserInfoMineUrl @"/dataapi/cg/user/info"
//  编辑资料
#define EditInfoUrl @"/dataapi/cg/user/updateInfo"
//  修改标签
#define EditUserTagUrl @"/dataapi/cg/user/updateUserTag"
//  拉黑和取消拉黑
#define BlackUpdataUrl @"/dataapi/cg/user/black/update"
//  黑名单列表
#define BlackListUrl @"/dataapi/cg/user/black"
//  接受的红包记录
#define GetPacketsRecordUrl @"/dataapi/cg/wallet/hongbao/getDetail"
//  发出的红包记录
#define SendPacketsRecordUrl @"/dataapi/cg/wallet/hongbao/sendDetail"

//  加V认证
#define vaddVarifyUrl @"/dataapi/cg/varify/vadd"
//  上首页
#define HomeVarifyUrl @"/dataapi/cg/varify/index"
//  获取自己余额
#define BalanceURL @"/dataapi/cg/wallet/info/simple"
//  余额支付
#define BuyItemURL @"/dataapi/cg/user/buyItem"
//  充值
#define RechargeURL @"/dataapi/cg/wallet/recharge"
//上首页认证
#define GetHomeVarityStateUrl @"/dataapi/cg/varify/getIndexVarify"
//  加V认证状态
#define GetVaddVarifyUrl @"/dataapi/cg/varify/getVaddVarify"
//  获取视频认证
#define GetVideoVarifyUrl @"/dataapi/cg/varify/getVideoVarify"
//  获取视频认证
#define MyDynamicURL @"/dataapi/cg/dynamic/myDynamics"
//  邀请好友H5
#define InvitedFriendsURL(userID) [NSString stringWithFormat:@"/VEra/friend_share.html?userId=%@",userID]
//  玩法攻略H5
#define PlayGameURL @"/VEra/strategyIndex.html"// [NSString stringWithFormat:@"%@/VEra/strategyIndex.html",ThirdPartyShareURL]
//  首页邀请好友H5
#define HomeInvilFriendURL [NSString stringWithFormat:@"/VEra/friend_shareOnIndex.html?userId=%@",USERID]

// http://h5.sviptime.com/VEra/friend_share.html?userId=1013239

//  提现
#define CheckOutMoney @"/dataapi/cg/wallet/checkout"
//  绑定银行卡
#define BindBankCard @"/dataapi/cg/wallet/bind/bank"
//  绑定银行卡验证码
#define GetTiXianCode @"/dataapi/cg/user/sendCode"
//  获取银行卡及提现数据
#define WalletInfoUrl @"/dataapi/cg/wallet/walletInfo"
//  获取贵族信息
#define GetNobleInfoUrl @"/dataapi/cg/user/getNobleInfo"
//  产品反馈
#define UserInfoAppFedd @"/dataapi/cg/feedback/fedd"
//  隐身设置
#define UserSetUpGetting @"/dataapi/cg/user/getSetInfo"
//  绑定所需验证码
#define BundUrlCode @"/dataapi/cg/user/sendCode"
//  绑定支付宝/微信
#define BundVXorZFBURL @"/dataapi/cg/wallet/bindingAliPay"
//  提交支付宝/微信提现
#define SubmitVXorZFBMoneyURL @"/dataapi/cg/wallet/checkout"
//  获取支付宝/微信提现详情
#define GetVXorZFBMoneyDetailURL @"/dataapi/cg/wallet/checkoutDetail"
//  删除照片
#define deleteUserPhotos    @"/dataapi/cg/user/deleteUserPhotos"
// 首页广告
#define getAdvertisement    @"/dataapi/cg/common/getAdvertisement"

//  H5 隐私政策 [Utility getH5Url:DealPrivacyURL]
#define DealPrivacyURL   @"/VEra/deal_privacy.html"


#pragma mark ------------ 分享 -----------
//  邀请好友分享
#define ShareInviteFriendUrl(userId,type) [NSString stringWithFormat:@"%@/VEra/login_share.html?userId=%@&type=%d",ThirdPartyShareURL,userId,type]

// 用户分享记录
#define UserShareUrl @"/dataapi/cg/common/beSpokesperson"



