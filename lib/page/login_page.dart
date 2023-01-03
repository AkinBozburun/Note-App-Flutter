import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/widgets.dart';

class LoginPage extends StatefulWidget
{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{

  final TextEditingController _mailTxt = TextEditingController();
  final TextEditingController _passwordTxt = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: tranparentStatusBar(),
        title: Text("Log In",style: AppStyle.loginTitleStyle),
        toolbarHeight: 150,
      ),
      body: Center
      (
        child: Column
        (
          children:
          [
            const SizedBox(height: 20),
            TextField //Mail Text
            (
              controller: _mailTxt,
              decoration: InputDecoration
              (
                hintText: "Email Adresi",
                prefixIcon: const Icon(Icons.email),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: AppStyle.txtFieldBorder,
                focusedBorder: AppStyle.txtFieldBorder,
              ),
            ),
            const SizedBox(height: 20),
            TextField //Password Text
            (
              controller: _passwordTxt,
              decoration: InputDecoration
              (
                hintText: "Şifre",
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: AppStyle.txtFieldBorder,
                focusedBorder: AppStyle.txtFieldBorder,
              ),
            ),
            const SizedBox(height: 10),
            Text.rich(TextSpan(children:
            [
              const TextSpan(text: "Üye değil misiniz? "),
              TextSpan
              (
                text: "Üye ol",style: AppStyle.singUpTxt,
                recognizer: TapGestureRecognizer()..onTap=() => print("Üye ol"),
              ),
            ]
             )),
            const SizedBox(height: 20),

            InkWell
            (
              onTap: () => print("Log In"),
              child: Ink
              (
                height: 50,
                width: 300,
                decoration: BoxDecoration
                (
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(child: Text("Giriş Yap",style: TextStyle(color: Colors.white,fontSize: 16),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}