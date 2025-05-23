import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/utils/uri_utils.dart';

import '../../bean/ad_info_bean.dart';
import '../../utils/image_utils.dart';

class AdBannerLogic extends AppGetXBaseLogic {
  @override
  void onLoad() {}
}

///广告轮播图组件
class AdBannerWidget extends AppGetXBasePage<AdBannerLogic> {
  AdBannerWidget({this.onTap, this.adList, this.adHeight = AD_SIZE_LARGE, super.key});

  static const double AD_SIZE_LARGE = 150;
  static const double AD_SIZE_SMALL = 75;

  GestureTapCallback? onTap;
  List<AdInfoBean>? adList;
  final double adHeight;

  @override
  bool isWidgetMode() {
    return true;
  }

  @override
  bool showLoadingPage() {
    return false;
  }

  @override
  Widget buildChild(BuildContext context) {
    if (adList == null || adList!.isEmpty) {
      return Container();
    }
    if (adHeight != 0) {
      return SizedBox(
        height: adHeight,
        child: _buildBody(context),
      );
    }
    return _buildBody(context);
  }

  @override
  AdBannerLogic createController() {
    return AdBannerLogic();
  }

  Widget _buildBody(BuildContext context) {
    if (adList!.length > 1) {
      return _buildMultiAd(adList!);
    }
    return _buildSingleAd(adList![0], context);
  }

  ///多个广告
  Widget _buildMultiAd(List<AdInfoBean> adBean) {
    return Swiper(
      autoplay: true,
      autoplayDelay: 2000,
      itemBuilder: (BuildContext context, int index) {
        var item = adBean[index];
        return GestureDetector(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ImageUtils.loadEncryptImage(item.image,
                  radius: 10, fit: BoxFit.fill)),
          onTap: () {
            _onTab(item);
          },
        );
      },
      itemCount: adBean.length,
      pagination: const SwiperPagination(),
    );
  }

  ///单个广告
  Widget _buildSingleAd(AdInfoBean adBean, BuildContext context) {
    return GestureDetector(
      child: SizedBox(
          height: adHeight,
          width: MediaQuery.of(context).size.width,
          child: ImageUtils.loadEncryptImage(
            fit: BoxFit.fill,
            adBean.image,
            radius: 10,
          )),
      onTap: () {
        _onTab(adBean);
      },
    );
  }

  _onTab(AdInfoBean item) {
    item.getOpenUrl().openUrl();
  }
}
