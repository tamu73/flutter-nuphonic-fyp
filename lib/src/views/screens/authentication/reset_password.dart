import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuphonic_front_end/src/app_logics/services/api_services/auth_service.dart';
import 'package:nuphonic_front_end/src/views/reusable_widgets/custom_app_bar.dart';
import 'package:nuphonic_front_end/src/views/reusable_widgets/custom_button.dart';
import 'package:nuphonic_front_end/src/views/reusable_widgets/custom_snackbar.dart';
import 'package:nuphonic_front_end/src/views/reusable_widgets/custom_textfield.dart';
import 'package:nuphonic_front_end/src/views/reusable_widgets/error_indicator.dart';
import 'package:nuphonic_front_end/src/views/reusable_widgets/eye_indicator.dart';
import 'package:nuphonic_front_end/src/views/reusable_widgets/warning.dart';
import 'package:nuphonic_front_end/src/views/utils/consts.dart';
import 'package:nuphonic_front_end/src/views/utils/validation.dart';

class ResetPassword extends StatefulWidget {
  final String email;

  ResetPassword({this.email});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  AuthService _auth = AuthService();
  Validation validate = Validation();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _resetPasswordController = TextEditingController();
  GlobalKey _toolTipKey = GlobalKey();

  String password;

  bool isLoading = false;

  bool isOn = true;
  bool isOnR = true; //for retype password

  //0 means error, 1 means success and null means default
  int isErrorR; //for retype password
  int isErrorP; //for password

  void _checkPassword(String val) {
    setState(() {
      isErrorP = val == ""
          ? null
          : val.length >= 8
              ? 1
              : 0;
      if (isErrorP == 1) password = val;
    });
  }

  void _checkRetypePassword(String val) {
    setState(() {
      isErrorR = val == ""
          ? null
          : val == password
              ? 1
              : 0;
    });
  }

  Future resetPassword(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    dynamic result = await _auth.resetPassword(email, password);
    setState(() {
      isLoading = false;
    });
    if (result == null) {
      await CustomSnackBar().buildSnackBar("Network Error", false);
    } else {
      print(result.data['msg']);
      await CustomSnackBar()
          .buildSnackBar(result.data['msg'], result.data['success']);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                CustomAppBar(
                  label: 'Reset Password',
                  endChild: Warning(
                    toolTipKey: _toolTipKey,
                    text:
                        "Going back is not recommended.\nPlease complete the process.",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelName: 'New Password',
                  hint: '8+ character password',
                  obSecureText: isOn,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (val) {
                    _checkPassword(val);
                    setState(() {
                      _resetPasswordController.clear();
                      isErrorR = null;
                    });
                  },
                  icons: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() => isOn = !isOn);
                        },
                        child: EyeIndicator(isOn: isOn),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ErrorIndicator(isError: isErrorP),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: _resetPasswordController,
                  labelName: 'Re-type Password',
                  hint: 'Re-type password as above',
                  obSecureText: isOnR,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (val) {
                    _checkRetypePassword(val);
                  },
                  icons: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() => isOnR = !isOnR);
                        },
                        child: EyeIndicator(isOn: isOnR),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ErrorIndicator(isError: isErrorR),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  labelName: 'RESET',
                  isLoading: isLoading,
                  onPressed: isErrorP == 1 && isErrorR == 1
                      ? () => resetPassword(widget.email, password)
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
