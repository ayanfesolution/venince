// ignore_for_file: constant_identifier_names

class Environment {
/* ATTENTION Please update your desired data. */

  static const String appName = 'Rexxtoria';
  static const String appSubTitle = 'Rexxtoria Digital Trading Platform ';
  static const String appWebUrl = 'https://script.viserlab.com/vinance';
  static const String version = '1.0.0';

  static const bool DEV_MODE = false;
  static const APP_ONBOARD = true;
  static const APP_VIBRATION = true;

  //Guest MODE
  static const bool isGuestModeEnable = true;

  //App GS Settings Auth Key
  static const String appAuthKey = "vinance*123"; //Don't touch here

  // LOGIN AND REG PART
  static String defaultPhoneCode = "1"; //don't put + here
  static String defaultCountryCode = "US";
  //Metamask Login

  static const bool enableLoginWithMetamask =
      true; // Set to false => to disable it.
  static const String walletConnectProjectID =
      '88531e1a540bc537a40b3a6874828f8d'; //Insert your wallet connect Project ID Here
  //WalletConnect link - https://cloud.walletconnect.com/
}
