import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';
import 'package:my_notes_app/tools/utils.dart';
import 'package:my_notes_app/style/app_styles.dart';
import 'package:my_notes_app/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends StatefulWidget
{
  final VoidCallback onClickedLogIn;

  const RegisterPage({super.key, required this.onClickedLogIn,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _register() async
  {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    showDialog
    (
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator())
    );

   try
    {
      final res = await FirebaseAuth.instance.createUserWithEmailAndPassword
      (
        email: _mailController.text.trim(),
        password: _passwordController.text.trim()
      );
      User? user = res.user;
      await user!.updateDisplayName(_nameController.text.trim());
    }
    on FirebaseAuthException catch (e)
    {
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
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
        title: Text(localText.createAccount,style: AppStyle().loginTitleStyle),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView
      (
        child: Padding
        (
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form
          (
            key: formKey,
            child: Column
            (
              children:
              [
                TextFormField //Name Text
                (
                  controller: _nameController,
                  validator: (name) => name != null && name.length < 2 ?
                  localText.validateName : null,
                  decoration: InputDecoration
                  (
                    hintText: localText.nameHint,
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: AppStyle.txtFieldBorder,
                    focusedBorder: AppStyle.txtFieldBorder,
                    errorBorder : AppStyle.txtFieldBorder,
                  ),
                ),
                const SizedBox(height: 15),
                mailTxtField(_mailController,context),
                const SizedBox(height: 15),
                passwordTxtField(_passwordController,context),
                const SizedBox(height: 15),
                confirmPassField(_passwordController, _passwordConfirmController, context),
                const SizedBox(height: 30),
                registerButton(() => _register(), localText.createAccount),
                const SizedBox(height: 30),
                Text.rich(TextSpan(children:
                [
                  TextSpan(text: localText.alreadyAccount),
                  TextSpan
                  (
                    text: localText.logIn,style: AppStyle().singUpTxt,
                    recognizer: TapGestureRecognizer()..onTap = widget.onClickedLogIn
                  ),
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}