import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:enquantum/src/feature/auth/common/decoration/auth_background_decoration.dart';
import 'package:enquantum/src/feature/auth/common/decoration/auth_input_decoration.dart';
import 'package:enquantum/src/feature/auth/common/widget/auth_page_header.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: authBackgroundDecoration(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AuthPageHeader(subTitle: 'reset_password_forgot_password'.i18n()),
                  const Spacer(),
                  Expanded(
                      child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          children: [
                        SendEmailForgotPassword(sendEmail: _sendEmailAndNavigate),
                        const EmailSentForgotPassword()
                      ])),
                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _sendEmailAndNavigate() {
    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}

class EmailSentForgotPassword extends StatelessWidget {
  const EmailSentForgotPassword({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("reset_password_email_sent".i18n(),
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "reset_password_email_arravied".i18n(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 13),
            )),
      ],
    );
  }
}

class SendEmailForgotPassword extends StatelessWidget {
  const SendEmailForgotPassword({
    super.key,
    required this.sendEmail
  });

  final dynamic sendEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("reset_password_forgot_question".i18n(),
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "reset_password_put_email".i18n(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: authInputDecoration('E-mail', false)),
          const SizedBox(height: 16),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(42),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => sendEmail(),
              child: Text(
                "send".i18n(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ))
        ],
      ),
    );
  }
}
