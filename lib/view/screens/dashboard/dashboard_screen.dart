import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinance/core/utils/util.dart';
import 'package:vinance/data/controller/common/theme_controller.dart';
import 'package:vinance/data/services/api_service.dart';

import '../../../core/route/route.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';
import '../../../core/utils/my_icons.dart';
import '../../../core/utils/my_strings.dart';
import '../../../data/controller/dashbaord/dashboard_controller.dart';
import '../../../data/controller/pusher_controller/pusher_service_controller.dart';
import '../../components/will_pop_widget.dart';
import 'screen/wallet/wallet_screen.dart';
import 'screen/home/home_screen.dart';
import 'screen/market/market_screen.dart';
import 'screen/profile_and_settings/profile_and_settings_screen.dart';
import 'widgets/nav_bar_item_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardController dashboardController;
  late PusherServiceController pusherServiceController;
  late GlobalKey<ScaffoldState> _dashBoardScaffoldKey;
  late List<Widget> _widgets;

  @override
  void initState() {
    super.initState();
    Get.put(ApiClient(sharedPreferences: Get.find()));
    dashboardController = Get.put(DashboardController(apiClient: Get.find()));
    pusherServiceController =
        Get.put(PusherServiceController(apiClient: Get.find()));
    _dashBoardScaffoldKey = GlobalKey<ScaffoldState>();

    _widgets = <Widget>[
      // const HomeScreen(),
      // const MarketScreen(),
      const WalletScreen(),
      const ProfileAndSettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return GetBuilder<ThemeController>(builder: (themeController) {
        return WillPopWidget(
          child: Scaffold(
              backgroundColor: MyColor.getScreenBgColor(),
              key: _dashBoardScaffoldKey,
              extendBody: true,
              body: _widgets[controller.selectedBottomNavIndex],
              bottomNavigationBar: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.space10, horizontal: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: MyColor.getScreenBgColor(),
                    boxShadow: [
                      BoxShadow(
                        color: MyColor.getPrimaryColor().withOpacity(0.2),
                        offset: const Offset(0, -4),
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // NavBarItem(
                      //     label: MyStrings.home.tr,
                      //     imagePath: MyIcons.naveHome,
                      //     index: 0,
                      //     isSelected: controller.selectedBottomNavIndex == 0,
                      //     press: () {
                      //       controller.changeSelectedIndex(0);
                      //       MyUtils.vibrationOn();
                      //     }),
                      // NavBarItem(
                      //     label: MyStrings.market.tr,
                      //     imagePath: MyIcons.navMarket,
                      //     index: 1,
                      //     isSelected: controller.selectedBottomNavIndex == 1,
                      //     press: () {
                      //       controller.changeSelectedIndex(1);
                      //       MyUtils.vibrationOn();
                      //     }),
                      // NavBarItem(
                      //     label: MyStrings.market.tr,
                      //     imagePath: MyIcons.tradeIconAction,
                      //     index: 6,
                      //     isSelected: controller.selectedBottomNavIndex == 6,
                      //     press: () {
                      //       Get.toNamed(RouteHelper.tradeBuySellScreen,
                      //           arguments: ['', 'buy'],
                      //           preventDuplicates: true);
                      //     }),
                      NavBarItem(
                          label: MyStrings.wallet.tr,
                          imagePath: MyIcons.navWallet,
                          index: 0,
                          isSelected: controller.selectedBottomNavIndex == 0,
                          press: () {
                            if (controller.checkUserIsLoggedInOrNot()) {
                              controller.changeSelectedIndex(0);
                            } else {
                              Get.toNamed(RouteHelper.authenticationScreen);
                            }
                            MyUtils.vibrationOn();
                          }),
                      NavBarItem(
                          label: MyStrings.portfolio.tr,
                          imagePath: MyIcons.navProfile,
                          index: 1,
                          isSelected: controller.selectedBottomNavIndex == 1,
                          press: () {
                            controller.changeSelectedIndex(1);
                            MyUtils.vibrationOn();
                          }),
                    ],
                  ),
                ),
              )),
        );
      });
    });
  }
}
