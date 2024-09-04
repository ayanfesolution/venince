import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vinance/core/helper/date_converter.dart';
import 'package:vinance/core/route/route.dart';
import 'package:vinance/core/utils/my_strings.dart';
import 'package:vinance/data/model/kyc/kyc_form_model.dart';
import 'package:vinance/data/model/profile/profile_response_model.dart';
import 'package:vinance/data/model/withdraw/withdraw_request_response_model.dart';
import 'package:vinance/view/components/snack_bar/show_custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../model/withdraw/withdraw_confirmation_response_model.dart';
import '../../repo/account/profile_repo.dart';
import '../../repo/withdraw/withdraw_repo.dart';

class WithdrawConfirmController extends GetxController {
  WithdrawRepo repo;
  ProfileRepo profileRepo;
  WithdrawConfirmController({required this.repo, required this.profileRepo});

  List<KycFormModel> formList = [];
  bool isLoading = true;
  String trxId = '';
  String selectOne = MyStrings.selectOne;

  void initData(WithdrawRequestResponseModel model) async {
    isLoading = true;

    update();

    isTwoFactorRequired = (model.data?.user?.ts ?? '0') == '1' ? true : false;

    trxId = model.data?.trx ?? '';

    List<KycFormModel>? tList = model.data?.form?.list;

    if (tList != null && tList.isNotEmpty) {
      formList.clear();

      for (var element in tList) {
        if (element.type == 'select') {
          bool? isEmpty = element.options?.isEmpty;

          bool empty = isEmpty ?? true;

          if (element.options != null && empty != true) {
            element.options?.insert(0, selectOne);

            element.selectedValue = element.options?.first;

            formList.add(element);
          }
        } else {
          formList.add(element);
        }
      }
    }

    await checkTwoFactorStatus();

    isLoading = false;

    update();
  }

  clearData() {
    formList.clear();
  }

  TextEditingController googleAuthenticatorCodeController = TextEditingController(text: '');
  bool isTwoFactorRequired = false;
  bool submitLoading = false;

  Future<void> submitConfirmWithdrawRequest() async {
    List<String> list = hasError();
    if (list.isNotEmpty) {
      CustomSnackBar.error(errorList: list);
      return;
    }

    submitLoading = true;
    update();

    try {
      WithdrawConfirmationResponseModel model = await repo.confirmWithdrawRequest(trxId, formList, googleAuthenticatorCodeController.text);

      if (model.status?.toLowerCase() == MyStrings.success.toLowerCase()) {
        CustomSnackBar.success(successList: model.message?.success ?? [MyStrings.requestSuccess]);

        Get.offAndToNamed(RouteHelper.withdrawDetailsScreen, arguments: model.data?.withdraw);
      } else {
        CustomSnackBar.error(errorList: model.message?.error ?? [MyStrings.requestFail]);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      submitLoading = false;
      update();
    }
  }

  List<String> hasError() {
    List<String> errorList = [];
    errorList.clear();

    for (var element in formList) {
      if (element.isRequired == 'required') {
        if (element.type == 'checkbox') {
          if (element.cbSelected == null) {
            errorList.add('${element.name} ${MyStrings.isRequired}');
          }
        } else if (element.type == 'file') {
          if (element.imageFile == null) {
            errorList.add('${element.name} ${MyStrings.isRequired}');
          }
        } else {
          if (element.selectedValue == '' || element.selectedValue == selectOne) {
            errorList.add('${element.name} ${MyStrings.isRequired}');
          }
        }
      }
    }

    return errorList;
  }

  setStatusTrue() {
    isLoading = true;

    update();
  }

  setStatusFalse() {
    isLoading = false;

    update();
  }

  void changeSelectedValue(value, int index) {
    formList[index].selectedValue = value;

    update();
  }

  void changeSelectedRadioBtnValue(int listIndex, int selectedIndex) {
    formList[listIndex].selectedValue = formList[listIndex].options?[selectedIndex];

    update();
  }

  //NEW DATE TIME
  void changeSelectedDateTimeValue(int index, BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        formList[index].selectedValue = DateConverter.estimatedDateTime(selectedDateTime);
        // formList[index].selectedValue = selectedDateTime.toIso8601String();
        formList[index].textEditingController?.text = DateConverter.estimatedDateTime(selectedDateTime);
        print(formList[index].textEditingController?.text);
        print(formList[index].selectedValue);
        update();
      }
    }

    update();
  }

  void changeSelectedDateOnlyValue(int index, BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final DateTime selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
      );

      formList[index].selectedValue = DateConverter.estimatedDate(selectedDateTime);
      formList[index].textEditingController?.text = DateConverter.estimatedDate(selectedDateTime);
      print(formList[index].textEditingController?.text);
      print(formList[index].selectedValue);
      update();
    }

    update();
  }

  void changeSelectedTimeOnlyValue(int index, BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final DateTime selectedDateTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        pickedTime.hour,
        pickedTime.minute,
      );

      formList[index].selectedValue = DateConverter.estimatedTime(selectedDateTime);
      formList[index].textEditingController?.text = DateConverter.estimatedTime(selectedDateTime);
      print(formList[index].textEditingController?.text);
      print(formList[index].selectedValue);
      update();
    }

    update();
  }
//

  void changeSelectedCheckBoxValue(int listIndex, String value) {
    List<String> list = value.split('_');

    int index = int.parse(list[0]);

    bool status = list[1] == 'true' ? true : false;

    List<String>? selectedValue = formList[listIndex].cbSelected;

    if (selectedValue != null) {
      String? value = formList[listIndex].options?[index];

      if (status) {
        if (!selectedValue.contains(value)) {
          selectedValue.add(value!);

          formList[listIndex].cbSelected = selectedValue;

          update();
        }
      } else {
        if (selectedValue.contains(value)) {
          selectedValue.removeWhere((element) => element == value);

          formList[listIndex].cbSelected = selectedValue;

          update();
        }
      }
    } else {
      selectedValue = [];

      String? value = formList[listIndex].options?[index];

      if (status) {
        if (!selectedValue.contains(value)) {
          selectedValue.add(value!);

          formList[listIndex].cbSelected = selectedValue;

          update();
        }
      } else {
        if (selectedValue.contains(value)) {
          selectedValue.removeWhere((element) => element == value);

          formList[listIndex].cbSelected = selectedValue;

          update();
        }
      }
    }
  }

  void changeSelectedFile(File file, int index) {
    formList[index].imageFile = file;

    update();
  }

  bool isTFAEnable = false;
  Future<void> checkTwoFactorStatus() async {
    ProfileResponseModel model = await profileRepo.loadProfileInfo();
    if (model.status?.toLowerCase() == MyStrings.success.toLowerCase()) {
      isTFAEnable = model.data?.user?.ts == '1' ? true : false;
    }
  }

  void pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.custom, allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf', 'doc', 'docx']);

    if (result == null) return;

    formList[index].imageFile = File(result.files.single.path!);
    String fileName = result.files.single.name;

    formList[index].selectedValue = fileName;
    update();

    return;
  }
}
