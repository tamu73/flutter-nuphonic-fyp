import 'package:flutter/material.dart';
import 'package:nuphonic_front_end/src/app_logics/services/shared_prefs_services/shared_pref_service.dart';
import 'package:nuphonic_front_end/src/views/screens/authentication/onboarding.dart';
import 'package:nuphonic_front_end/src/views/screens/home/bottom_navigation.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  Future<void> checkUser() async {
    String value = await SharedPreferenceService().read(id: 'user_id');
    setState(() {
      user = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null ? OnBoarding() : BottomNavigation();
  }
}