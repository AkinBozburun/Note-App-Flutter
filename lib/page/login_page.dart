import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';
import 'package:my_notes_app/tools/utils.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget
{
  final VoidCallback onClickedRegister;

  const LoginPage({super.key, required this.onClickedRegister});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _logIn() async
  {
    showDialog
    (
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator())
    );

    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: _mailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
    on FirebaseAuthException catch (e)
    {
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose()
  {
    _mailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    final localText = AppLocalizations.of(context)!;

    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: tranparentStatusBar(),
        title: Text(localText.logIn,style: AppStyle.loginTitleStyle),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView
      (
        child: Padding
        (
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column
          (
            children:
            [
              mailTxtField(_mailController,context),
              const SizedBox(height: 15),
              passwordTxtField(_passwordController,context),
              const SizedBox(height: 30),
              registerButton(() => _logIn(),localText.logIn),
              const SizedBox(height: 30),
              orSeparate(localText.orSeparate),
              const SizedBox(height: 20),
              googleLogIn(context),
              const SizedBox(height: 30),
              Text.rich(TextSpan(children:
              [
                TextSpan(text: localText.noAccount),
                TextSpan
                (
                  text: localText.createAccount,style: AppStyle.singUpTxt,
                  recognizer: TapGestureRecognizer()..onTap = widget.onClickedRegister
                ),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
