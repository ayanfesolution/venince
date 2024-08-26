import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vinance/core/utils/dimensions.dart';
import 'package:vinance/core/utils/my_color.dart';
import 'package:vinance/core/utils/style.dart';

import 'package:web3modal_flutter/widgets/buttons/simple_icon_button.dart';

import '../../../../../core/route/route.dart';
import '../../../../../core/utils/my_icons.dart';
import '../../../../../core/utils/my_strings.dart';
import '../../../../../data/controller/auth/auth/metamask/metamask_reg_controller.dart';
import '../../../../components/buttons/rounded_button.dart';
import '../../../../components/divider/custom_spacer.dart';
import '../../../../components/image/my_local_image_widget.dart';
import '../../../../components/loading_border/loading_border.dart';

class ConnectToMetamaskRegistrationBottomSheet extends StatelessWidget {
  const ConnectToMetamaskRegistrationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MetaMaskAuthRegController>(builder: (metaRegController) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          metaRegController.clearMetamaskOldData();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                verticalSpace(Dimensions.space20),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space20),
                  child: Center(
                      child: Text(
                    MyStrings.metaMask.tr.toUpperCase(),
                    style: boldOverLarge.copyWith(color: MyColor.getPrimaryTextColor()),
                  )),
                ),
                verticalSpace(Dimensions.space20),
                LoadingBorderIndicator(
                  animate: metaRegController.walletErrorEvent == null,
                  borderRadius: 20,
                  strokeWidth: 3,
                  color: MyColor.pendingColor,
                  bgColor: MyColor.getScreenBgSecondaryColor(),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyLocalImageWidget(
                      imagePath: MyIcons.metaMaskIcon,
                      width: 20.0,
                      height: 20.0,
                    ),
                  ),
                ),
                verticalSpace(Dimensions.space30),
                if (metaRegController.messageData != '' && metaRegController.walletAddressData != '') ...[
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space20),
                    child: Center(
                        child: Text(
                      metaRegController.messageData.tr,
                      style: regularLarge.copyWith(color: MyColor.getPrimaryTextColor()),
                    )),
                  ),
                  verticalSpace(Dimensions.space30),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space10),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: RoundedButton(
                              isOutlined: true,
                              color: MyColor.colorRed,
                              borderColor: MyColor.grayColor3,
                              text: MyStrings.cancel.tr,
                              child: FittedBox(
                                child: Text(
                                  MyStrings.cancel.tr,
                                  style: regularLarge.copyWith(
                                    color: MyColor.getPrimaryButtonTextColor(),
                                  ),
                                ),
                              ),
                              press: () {
                                metaRegController.clearMetamaskOldData(disconnected: true);
                              },
                            ),
                          ),
                          horizontalSpace(Dimensions.space15),
                          Expanded(
                            flex: 2,
                            child: RoundedButton(
                              isOutlined: true,
                              color: MyColor.colorRed,
                              borderColor: MyColor.pendingColor,
                              text: MyStrings.verifyMetamaskLogin.tr,
                              child: FittedBox(
                                child: Text(
                                  MyStrings.verifyMetamaskLogin.tr,
                                  style: regularLarge.copyWith(
                                    color: MyColor.getPrimaryButtonTextColor(),
                                  ),
                                ),
                              ),
                              press: () async {
                                var address = "${metaRegController.w3mService.session?.address?.toLowerCase()}";
                                if (address.toString() != 'null') {
                                  await metaRegController.getSignatureCodeFromMetamask(address: address, message: metaRegController.messageData);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(Dimensions.space10),
                ] else ...[
                  if (metaRegController.isInitializing == false && metaRegController.walletErrorEvent != null) ...[
                    verticalSpace(Dimensions.space10),
                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space10),
                      child: Column(
                        children: [
                          Text(
                            "${MyStrings.donNotHave.tr} ${metaRegController.w3mWalletInfo.listing.name}?",
                            style: regularLarge.copyWith(color: MyColor.getPrimaryTextColor()),
                          ),
                          verticalSpace(Dimensions.space30),
                          RoundedButton(
                            isOutlined: false,
                            color: MyColor.colorRed,
                            borderColor: MyColor.colorRed,
                            text: MyStrings.download.tr,
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.download_rounded,
                                    color: MyColor.getPrimaryButtonTextColor(),
                                  ),
                                  horizontalSpace(Dimensions.space10),
                                  Text(
                                    MyStrings.download.tr,
                                    style: regularLarge.copyWith(
                                      color: MyColor.getPrimaryButtonTextColor(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            press: () {
                              metaRegController.launchMetaMaskUrl();
                            },
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    verticalSpace(Dimensions.space30),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: Dimensions.space20, vertical: Dimensions.space10),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: RoundedButton(
                                isOutlined: true,
                                color: MyColor.colorRed,
                                borderColor: MyColor.grayColor3,
                                text: MyStrings.cancel.tr,
                                child: FittedBox(
                                  child: Text(
                                    MyStrings.cancel.tr,
                                    style: regularLarge.copyWith(
                                      color: MyColor.getPrimaryButtonTextColor(),
                                    ),
                                  ),
                                ),
                                press: () {
                                  metaRegController.clearMetamaskOldData(disconnected: true);
                                },
                              ),
                            ),
                            horizontalSpace(Dimensions.space15),
                            Expanded(
                              flex: 2,
                              child: RoundedButton(
                                isOutlined: false,
                                color: MyColor.pendingColor,
                                borderColor: MyColor.pendingColor,
                                text: MyStrings.verifyMetamaskLogin.tr,
                                child: FittedBox(
                                  child: Text(
                                    MyStrings.connectMetamask.tr,
                                    style: regularLarge.copyWith(
                                      color: MyColor.getPrimaryButtonTextColor(),
                                    ),
                                  ),
                                ),
                                press: () async {
                                  // metaRegController.w3mService.openModal(context);

                                  metaRegController.signInWithMetamask(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    verticalSpace(Dimensions.space10),
                  ]
                ],
              ],
            ),
          ),
        ),
      );
    });
  }
}
