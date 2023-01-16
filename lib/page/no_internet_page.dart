import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_notes_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_notes_app/style/app_styles.dart';

class NoInternetPage extends StatelessWidget
{
  const NoInternetPage({super.key});

  _netCheck(context) async
  {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult != ConnectivityResult.none)
    {
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const NetCheck()),
      (route) => false);
    }
  }

  @override
  Widget build(BuildContext context)
  {
    final localText = AppLocalizations.of(context)!;

    return Scaffold
    (
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            SizedBox
            (
              height: 140,
              width: 140,
              child: Image.asset("images/no-internet.png")
            ),
            const SizedBox(height: 30),
            Text(localText.noInternetLbl,style: AppStyle().noNet,),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () => _netCheck(context), child: Text(localText.tryAgainBtn))
          ],
        ),
      ),
    );
  }
}