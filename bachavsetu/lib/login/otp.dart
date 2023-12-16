import 'package:bachavsetu/init_page.dart';
import 'package:bachavsetu/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'form.dart';
import 'login.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'socket_manager.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late int _resendTimerInSeconds;
  late Timer _resendTimer;
  bool _resendButtonEnabled = false;
  List<String> otp_number = ['0', '0', '0', '0'];

  @override
  void initState() {
    super.initState();
    _resendTimerInSeconds = 30;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  @override
  void dispose() {
    _resendTimer.cancel();
    super.dispose();
  }

  void _updateTimer(Timer timer) {
    setState(() {
      if (_resendTimerInSeconds > 0) {
        _resendTimerInSeconds--;
      } else {
        _resendButtonEnabled = true;
        _resendTimer.cancel();
      }
    });
  }

  void _resendOtp() {
    // Add logic to resend OTP

    setState(() {
      _resendButtonEnabled = false;
      _resendTimerInSeconds = 60;
      _resendTimer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
    });
  }

  void showInvalidOTPPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Wrong OTP"),
          content: const Text("Please check your phone for the correct OTP!"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Widget _textFieldOTP({bool? first, last, required int order}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            otp_number[order] = value;
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.black12), borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Colors.purple), borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Hero(
                tag: 'logoTag',
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/loginAssets/illustration-3.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter Your OTP",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _textFieldOTP(first: true, last: false, order: 0),
                        ),
                        Expanded(
                          child: _textFieldOTP(first: false, last: false, order: 1),
                        ),
                        Expanded(
                          child: _textFieldOTP(first: false, last: false, order: 2),
                        ),
                        Expanded(
                          child: _textFieldOTP(first: false, last: true, order: 3),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform OTP verification logic
                          // If verification successful, navigate to FormPage
                          var userotp = otp_number[0] + otp_number[1] + otp_number[2] + otp_number[3];
                          IO.Socket socket = SocketManager.getSocket();
                          socket.on('verify_otp_result', (data) {
                            print(data);
                            if (data['status'] == 'Wrong OTP') {
                              showInvalidOTPPopup(context);
                            } else if (data['status'] == 'details_not_filled') {
                              if (data['token'] != null) {
                                context.read<UserDataModel>().updateToken(data['token']!);
                                print('The token is ${context.read<UserDataModel>().token} =====================================');
                                Navigator.of(context).push(_createPageRoute());
                              } else {
                                print("The token is null?");
                              }
                            } else {
                              Navigator.of(context).push(pageRouteInit());
                            }
                          });
                          socket.emit("verify_otp", {'phone': Login.getPhoneNumber(), 'otp': userotp});
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: _resendButtonEnabled ? _resendOtp : null,
                      child: Text(
                        "Resend New Code",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _resendButtonEnabled ? Colors.purple : Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'In $_resendTimerInSeconds Seconds',
                      style: TextStyle(
                        color: _resendButtonEnabled ? Colors.black38 : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageRouteBuilder<dynamic> pageRouteInit() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const FormPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityAnimation = animation.drive(tween);

        var scaleTween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

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

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const FormPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityAnimation = animation.drive(tween);

        var scaleTween = Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve));

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
}
