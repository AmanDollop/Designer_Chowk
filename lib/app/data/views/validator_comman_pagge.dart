import 'package:get/get.dart';

class validatorpage {
  static String? validationName({String? name}) {
    if (name == null || name.isEmpty) {
      return "NameRequired".tr;
    }
    return null;
  }

  static String? validationEmail({String? email}) {
    if (email == null || email.isEmpty) {
      return 'EmailRequired';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      /*if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){*/

      return "Please enter a valid email id";
    }

    return null;
  }

  static String? validationPassword({String? password}) {
    if (password == null) {
      return "Please enter pin".tr;
    } else if (password.trim().isEmpty) {
      return "PinRequired".tr;
    } else if (password.trim().length < 4) {
      return "Pin must be  4 number".tr;
    }/* else if (!RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password)) {
      return 'Please enter strong Password';
    }*/

    return null;
  }

  static String? validationCon_Password(
      {String? Con_password, String? password}) {
    if (Con_password == null || Con_password.isEmpty) {
      return 'This field is required';
    } else if (Con_password != password) {
      return 'Confirmation password does not match the entered password';
    }

    return null;
  }

  static String? validationMobile({String? Phone}) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (Phone?.length == 0) {
      return 'Please enter mobile number'.tr;
    } else if (!regExp.hasMatch(Phone!)) {
      return 'Please enter valid mobile number'.tr;
    }
    return null;
  }
}
