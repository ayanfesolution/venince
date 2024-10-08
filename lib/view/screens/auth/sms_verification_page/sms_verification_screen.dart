import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vinance/core/route/route.dart';
import 'package:vinance/core/utils/dimensions.dart';
import 'package:vinance/core/utils/my_color.dart';
import 'package:vinance/core/utils/my_strings.dart';
import 'package:vinance/core/utils/style.dart';
import 'package:vinance/data/controller/auth/auth/sms_verification_controler.dart';
import 'package:vinance/data/repo/auth/sms_email_verification_repo.dart';
import 'package:vinance/data/services/api_service.dart';
import 'package:vinance/view/components/buttons/rounded_button.dart';
import 'package:vinance/view/components/will_pop_widget.dart';

import '../../../components/app-bar/app_main_appbar.dart';
import '../../../components/divider/custom_spacer.dart';
import '../../../components/otp_field_widget/otp_field_widget.dart';
import '../../../components/text/default_text.dart';
import '../../../components/text/header_text.dart';

class SmsVerificationScreen extends StatefulWidget {
  const SmsVerificationScreen({super.key});

  @override
  State<SmsVerificationScreen> createState() => _SmsVerificationScreenState();
}

class _SmsVerificationScreenState extends State<SmsVerificationScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(SmsEmailVerificationRepo(apiClient: Get.find()));
    final controller = Get.put(SmsVerificationController(repo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // controller.isProfileCompleteEnable = Get.arguments[0];
      controller.isProfileCompleteEnable = false;
      controller.loadBefore();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SmsVerificationController>(builder: (controller) {
      return WillPopWidget(
        nextRoute: RouteHelper.authenticationScreen,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: MyColor.getScreenBgColor(),
            appBar: AppMainAppBar(
              showCrossIconInBackBtn: true,
              isTitleCenter: true,
              isProfileCompleted: false,
              bgColor: MyColor.transparentColor,
              titleStyle: boldOverLarge.copyWith(fontSize: Dimensions.fontOverLarge, color: MyColor.getPrimaryTextColor()),
              leadingWidgetOnTap: () {
                controller.repo.apiClient.clearOldAuthData();
                Get.offAllNamed(RouteHelper.authenticationScreen);
              },
              actions: [
                horizontalSpace(Dimensions.space10),
              ],
            ),
            body: controller.isLoading
                ? Center(child: CircularProgressIndicator(color: MyColor.getPrimaryColor()))
                : SingleChildScrollView(
                    padding: Dimensions.screenPaddingHV,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: Dimensions.space30),
                          HeaderText(
                            text: MyStrings.smsVerification.tr,
                            textStyle: semiBoldOverLarge.copyWith(color: MyColor.getPrimaryTextColor()),
                          ),
                          const SizedBox(height: Dimensions.space15),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 25), child: DefaultText(text: MyStrings.smsVerificationMsg.tr, textAlign: TextAlign.center, textStyle: regularLarge.copyWith(color: MyColor.getSecondaryTextColor()))),
                          const SizedBox(height: Dimensions.space25),
                          OTPFieldWidget(
                            onChanged: (value) {
                              controller.updateText(value);
                            },
                          ),
                          const SizedBox(height: Dimensions.space30),
                          RoundedButton(
                            isLoading: controller.submitLoading,
                            text: MyStrings.submitOTP.tr,
                            isDisabled: controller.currentText.trim().length == 6 ? false : true,
                            press: () {
                              controller.verifyYourSms(controller.currentText);
                            },
                          ),
                          const SizedBox(height: Dimensions.space30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(MyStrings.didNotReceiveCode.tr, style: regularDefault.copyWith(color: MyColor.getLabelTextColor())),
                              const SizedBox(width: Dimensions.space10),
                              controller.resendLoading
                                  ? Container(
                                      margin: const EdgeInsets.all(5),
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: MyColor.getPrimaryColor(),
                                      ))
                                  : GestureDetector(
                                      onTap: () {
                                        controller.sendCodeAgain();
                                      },
                                      child: Text(MyStrings.resendCode.tr, style: regularDefault.copyWith(decoration: TextDecoration.underline, decorationColor: MyColor.getPrimaryColor(), color: MyColor.getPrimaryColor()))),
                            ],
                          )
                        ],
                      ),
                    )),
          ),
        ),
      );
    });
  }
}
