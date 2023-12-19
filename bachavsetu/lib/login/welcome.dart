import 'package:bachavsetu/login/form.dart';
import 'package:bachavsetu/login/socket_manager.dart';
import 'package:bachavsetu/providers/user_data_provider.dart';
import 'package:bachavsetu/utils/user_preferences.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '/init_page.dart';
import 'package:flutter/material.dart';

import 'package:bachavsetu/login/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _loginButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff7f6fb),
        elevation: 0,
        // <========================Back Doors (To be Removed)======================>
        actions: [
          IconButton(
            icon: const Icon(
              Icons.skip_next,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InitPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.skip_next,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormPage()),
              );
            },
          ),
        ],
        // <========================Back Doors (To be Removed)======================>
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Hero(
                tag: 'logoTag',
                child: Image.asset(
                  'assets/loginAssets/illustration-1.png',
                  width: 240,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Let's get started",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Never A Better Time Than Now To Start.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 38,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loginButtonEnabled ? _onPressFunction : null,
                  style: ButtonStyle(
                    foregroundColor: _loginButtonEnabled
                        ? MaterialStateProperty.all<Color>(Colors.purple)
                        : MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor: _loginButtonEnabled
                        ? MaterialStateProperty.all<Color>(Colors.white)
                        : MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Login(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityAnimation = animation.drive(tween);

        var scaleTween =
            Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

        var scaleAnimation = animation.drive(scaleTween);

        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: child,
          ),
        );
      },
    );
  }

  PageRouteBuilder _createPageRouteInit() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const InitPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityAnimation = animation.drive(tween);

        var scaleTween =
            Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

        var scaleAnimation = animation.drive(scaleTween);

        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: child,
          ),
        );
      },
    );
  }

  PageRouteBuilder _createPageRouteDetails() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const FormPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityAnimation = animation.drive(tween);

        var scaleTween =
            Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

        var scaleAnimation = animation.drive(scaleTween);

        return Opacity(
          opacity: opacityAnimation.value,
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: child,
          ),
        );
      },
    );
  }

  void updateDetails(String name, String phone, String gender, String dob,
      String Econtact, String Erelation, String BloodGroup, String token) {
    context.read<UserDataModel>().updateName(name);
    context.read<UserDataModel>().updatePhone(phone);
    context.read<UserDataModel>().updateGender(gender);
    context.read<UserDataModel>().updateDOB(dob);
    context.read<UserDataModel>().updateEContact(Econtact);
    context.read<UserDataModel>().updateERelation(Erelation);
    context.read<UserDataModel>().updateBloodGroup(BloodGroup);
    context.read<UserDataModel>().updateToken(token);
  }

  void _onPressFunction() {
    // grey here
    String? token = UserPreferences.getToken();
    print(token);
    String? phone = UserPreferences.getPhone();
    IO.Socket socket = SocketManager.getSocket();
    if (token == null) {
      Navigator.of(context).push(_createPageRoute());
    } else {
      socket.emit("verify_token", {'phone': phone, 'token': token});
    }
    socket.on("verify_token_result", (data) {
      if (data['status'] == "user_doesn't_exist" ||
          data['status'] == "wrong_token") {
        Navigator.of(context).push(_createPageRoute());
      } else if (data['status'] == 'details_not_filled') {
        Navigator.of(context).push(_createPageRouteDetails());
      } else if (data['status'] == 'details_filled') {
        updateDetails(
            data['name'] ?? "null",
            data["phone"] ?? "null",
            data['gender'] ?? "null",
            data['dob'] ?? "null",
            data['emergency_contact'] ?? "null",
            data['relation'] ?? "null",
            data['blood_group'] ?? "null",
            token!);
        Navigator.of(context).push(_createPageRouteInit());
      }
    });

    setState(() {
      _loginButtonEnabled = false;
    });
  }
}
