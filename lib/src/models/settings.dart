import 'package:flyweb/src/models/navigationIcon.dart';
import 'package:flyweb/src/models/social.dart';

import 'menu.dart';

class Settings {
  String id = "";
  String title = "";
  String subTitle = "";
  String url = "";
  String admobId = "";
  String admobIdIos = "";
  String admobKeyAdBanner = "";
  String admobKeyAdInterstitial = "";
  String admobKeyAdBannerIos = "";
  String admobKeyAdInterstitialIos = "";
  String admobDealy = "";
  String navigatinBarStyle = "";
  String leftButton = "";
  String rightButton = "";
  String loader = "";
  String firstColor = "";
  String secondColor = "";
  String backgroundColor = "";
  String logo = "";
  String logoUrl = "";
  String javascript = "";
  String downloadWebview = "";
  String permissionDialog = "";
  String splachScreen = "";
  String swipeRefresh = "";
  String websiteZoom = "";
  String desktopMode = "";
  String fullScreen = "";
  String logoHeader = "";
  String logoHeaderUrl = "";
  String typeHeader = "text";
  String androidId = "";
  String iosId = "";
  String aboutUs = "";
  String share = "";
  String adBanner = "";
  String adBannerIos = "";
  String adInterstitial = "";
  String adInterstitialIos = "";
  NavigationIcon leftNavigationIcon;
  NavigationIcon rightNavigationIcon;

  List<Menu> menus;
  List<Social> socials;

  Settings.fromSettings(Map<String, dynamic> json) {
    url = "http://google.fr";
  }

  Settings(
      {this.id,
      this.title = "",
      this.subTitle,
      this.url,
      this.admobId,
      this.admobIdIos,
      this.admobKeyAdBanner,
      this.admobKeyAdInterstitial,
      this.admobKeyAdBannerIos,
      this.admobKeyAdInterstitialIos,
      this.admobDealy,
      this.navigatinBarStyle,
      this.leftButton,
      this.rightButton,
      this.loader,
      this.firstColor,
      this.secondColor,
      this.backgroundColor,
      this.logo,
      this.logoUrl,
      this.logoHeader,
      this.logoHeaderUrl,
      this.typeHeader,
      this.javascript,
      this.downloadWebview,
      this.permissionDialog,
      this.splachScreen,
      this.swipeRefresh,
      this.websiteZoom,
      this.desktopMode,
      this.fullScreen,
      this.androidId,
      this.iosId,
      this.aboutUs,
      this.share,
      this.adBanner,
      this.adBannerIos,
      this.adInterstitial,
      this.adInterstitialIos,
      this.menus,
      this.socials,
      this.leftNavigationIcon,
      this.rightNavigationIcon});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['sub_title'];
    url = json['url'];
    admobId = json['admob_id'];
    admobIdIos = json['admob_id_ios'];
    admobKeyAdBanner = json['admob_key_ad_banner'];
    admobKeyAdInterstitial = json['admob_key_ad_interstitial'];
    admobKeyAdBannerIos = json['admob_key_ad_banner_ios'];
    admobKeyAdInterstitialIos = json['admob_key_ad_interstitial_ios'];
    admobDealy = json['admob_dealy'];
    navigatinBarStyle = json['navigatin_bar_style'];
    leftButton = json['left_button'];
    rightButton = json['right_button'];
    loader = json['loader'];
    firstColor = json['firstColor'];
    secondColor = json['secondColor'];
    backgroundColor = json['backgroundColor'];
    logo = json['logo'];
    logoUrl = json['logo_url'];
    javascript = json['javascript'];
    downloadWebview = json['download_webview'];
    permissionDialog = json['permission_dialog'];
    splachScreen = json['splach_screen'];
    swipeRefresh = json['swipe_refresh'];
    websiteZoom = json['website_zoom'];
    desktopMode = json['desktop_mode'];
    fullScreen = json['full_screen'];
    logoHeader = json['logo_header'];
    logoHeaderUrl = json['logo_header_url'];
    typeHeader = json['type_header'];
    androidId = json['android_id'];
    iosId = json['ios_id'];
    aboutUs = json['about_us'];
    share = json['share'];

    adBanner = json['ad_banner'];
    adBannerIos = json['ad_banner_ios'];
    adInterstitial = json['ad_interstitial'];
    adInterstitialIos = json['ad_interstitial_ios'];

    if (json['menus'] != null) {
      menus = new List<Menu>();
      json['menus'].forEach((v) {
        menus.add(new Menu.fromJson(v));
      });
    }

    if (json['socials'] != null) {
      socials = new List<Social>();
      json['socials'].forEach((v) {
        socials.add(new Social.fromJson(v));
      });
    }

    if (json['leftNavigationIcon'] != null) {
      leftNavigationIcon =
          new NavigationIcon.fromJson(json['leftNavigationIcon']);
    }

    if (json['rightNavigationIcon'] != null) {
      rightNavigationIcon =
          new NavigationIcon.fromJson(json['rightNavigationIcon']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['url'] = this.url;
    data['admob_id'] = this.admobId;
    data['admob_id_ios'] = this.admobIdIos;
    data['admob_key_ad_banner'] = this.admobKeyAdBanner;
    data['admob_key_ad_interstitial'] = this.admobKeyAdInterstitial;
    data['admob_key_ad_banner_ios'] = this.admobKeyAdBannerIos;
    data['admob_key_ad_interstitial_ios'] = this.admobKeyAdInterstitialIos;
    data['admob_dealy'] = this.admobDealy;
    data['navigatin_bar_style'] = this.navigatinBarStyle;
    data['left_button'] = this.leftButton;
    data['right_button'] = this.rightButton;
    data['loader'] = this.loader;
    data['firstColor'] = this.firstColor;
    data['secondColor'] = this.secondColor;
    data['backgroundColor'] = this.backgroundColor;
    data['logo'] = this.logo;
    data['logo_url'] = this.logoUrl;
    data['javascript'] = this.javascript;
    data['download_webview'] = this.downloadWebview;
    data['permission_dialog'] = this.permissionDialog;
    data['splach_screen'] = this.splachScreen;
    data['swipe_refresh'] = this.swipeRefresh;
    data['website_zoom'] = this.websiteZoom;
    data['desktop_mode'] = this.desktopMode;
    data['full_screen'] = this.fullScreen;
    data['logo_header'] = this.logoHeader;
    data['logo_header_url'] = this.logoHeaderUrl;
    data['type_header'] = this.typeHeader;
    data['android_id'] = this.androidId;
    data['ios_id'] = this.iosId;
    data['about_us'] = this.aboutUs;
    data['share'] = this.share;
    data['ad_banner'] = this.adBanner;
    data['ad_banner_ios'] = this.adBannerIos;
    data['ad_interstitial'] = this.adInterstitial;
    data['ad_interstitial_ios'] = this.adInterstitialIos;

    if (this.menus != null) {
      data['menus'] = this.menus.map((v) => v.toJson()).toList();
    }

    if (this.socials != null) {
      data['socials'] = this.socials.map((v) => v.toJson()).toList();
    }

    if (this.rightNavigationIcon != null) {
      data['rightNavigationIcon'] = this.rightNavigationIcon.toJson();
    }

    if (this.leftNavigationIcon != null) {
      data['leftNavigationIcon'] = this.leftNavigationIcon.toJson();
    }

    return data;
  }
}
