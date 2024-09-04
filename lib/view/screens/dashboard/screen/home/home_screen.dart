import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinance/core/utils/my_color.dart';
import 'package:vinance/data/controller/home/home_controller.dart';
import 'package:vinance/view/components/divider/custom_spacer.dart';
import 'package:vinance/view/screens/dashboard/screen/home/section/news/home_app_latest_news_list.dart';
import 'package:vinance/view/screens/dashboard/screen/home/widgets/home_screen_action_menu_list.dart';
import 'package:vinance/view/screens/dashboard/screen/home/section/market_overview_list/home_screen_market_coin_list.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../../data/controller/pusher_controller/pusher_service_controller.dart';
import '../../../../../data/repo/home/home_repo.dart';
import 'widgets/home_screen_appbar.dart';
import 'widgets/home_screen_balance_card.dart';
import 'section/highlight_coin/home_screen_high_lights_coin_list.dart';
import 'widgets/home_screen_login_or_reg_card.dart';
import 'section/new_coin/home_screen_new_coin_list.dart';
import 'section/top_exchange_coin/home_top_exchanges_coin.dart';
import 'widgets/kyc_warning_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PusherServiceController pusherServiceController = Get.find();

  final ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (Get.find<HomeController>().hasNext()) {
        Get.find<HomeController>().loadMarketListPairData();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Get.put(HomeRepo(apiClient: Get.find()));
    var controller = Get.put(HomeController(homeRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // pusherServiceController.initPusher("market-data");
      // pusherServiceController.initPusher("trade");
      controller.initialData();
      scrollController.addListener(scrollListener);
      pusherServiceController.addListener(_onMarketDataUpdate);
    });
  }

  void _onMarketDataUpdate() {
    Get.find<HomeController>().updateMarketDataBasedOnPusherEvent();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          appBar: HomeScreenAppBar(
            controller: controller,
            appBarSize: Dimensions.space100,
            isProfileCompleted: true,
            bgColor: MyColor.transparentColor,
          ),
          body: RefreshIndicator(
            color: MyColor.getPrimaryColor(),
            onRefresh: () async {
              controller.initialData();
            },
            child: SingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
                child: Column(
                  children: [
                    if (controller.checkUserIsLoggedInOrNot() == true) ...[
                      HomeScreenBalanceCard(controller: controller),
                      KYCWarningSection(controller: controller),
                      const HomeScreenActionMenu(),
                    ] else ...[
                      HomeScreenLoginOrRegCard(
                        controller: controller,
                      ),
                    ],
                    HomeTopExchangesCoinList(
                      controller: controller,
                    ),
                    HomeScreenHighLightsCoinList(
                      controller: controller,
                    ),
                    HomeScreenNewCoinList(
                      controller: controller,
                    ),
                    HomeAppLatestNewsWidget(
                      controller: controller,
                    ),
                    HomeScreenMarketPairCoinList(
                      controller: controller,
                    ),
                    verticalSpace(Dimensions.space100),
                  ],
                )),
          ));
    });
  }
}
