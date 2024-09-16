import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vinance/core/utils/dimensions.dart';
import 'package:vinance/core/utils/my_color.dart';
import 'package:vinance/data/controller/dashbaord/dashboard_controller.dart';
import 'package:vinance/data/services/api_service.dart';
import 'package:vinance/view/components/app-bar/app_main_appbar.dart';
import 'package:vinance/view/components/divider/custom_spacer.dart';
import 'package:vinance/view/screens/deposit/widgets/webview/webview_widget.dart';

import '../../../../../core/utils/style.dart';

class SwapWebview extends StatefulWidget {
  const SwapWebview({super.key});

  @override
  State<SwapWebview> createState() => _SwapWebviewState();
}

class _SwapWebviewState extends State<SwapWebview> {
  late DashboardController dashboardController;
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    dashboardController = Get.put(DashboardController(apiClient: Get.find()));
    print('UserID: ${dashboardController.getUserID()}');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.getScreenBgColor(),
      appBar: AppMainAppBar(
        isTitleCenter: true,
        isProfileCompleted: true,
        title: 'Swap',
        bgColor: MyColor.transparentColor,
        titleStyle: regularLarge.copyWith(
            fontSize: Dimensions.fontLarge,
            color: MyColor.getPrimaryTextColor()),
        actions: [
          horizontalSpace(Dimensions.space10),
        ],
      ),
      body: GetBuilder<DashboardController>(
        builder: (controller) => DepositAppWebViewWidget(
          url:
              'https://app.rexxtoria.com/user/wallet/swap/${controller.getUserID()}',
        ),
      ),
    );
  }

  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.photos,
      Permission.microphone,
      Permission.mediaLibrary,
      Permission.camera,
      Permission.storage,
    ].request();

    return statuses;
  }
}
