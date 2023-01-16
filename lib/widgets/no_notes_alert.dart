import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_notes_app/style/app_styles.dart';

class NoNotesAlert extends StatefulWidget
{
  const NoNotesAlert({super.key});

  @override
  State<NoNotesAlert> createState() => _NoNotesAlertState();
}

class _NoNotesAlertState extends State<NoNotesAlert>
{
  @override
  Widget build(BuildContext context)
  {
    final localText = AppLocalizations.of(context)!;
    return Center
    (
      child: SizedBox
      (
        width: 210,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            SizedBox
            (
              height: 150,
              width: 150,
              child: Image.asset("images/note.png")
            ),
            const SizedBox(height: 20),
            Text("${localText.noNote} :(",style: AppStyle.noNotes1),
            const SizedBox(height: 10),
            Text(localText.takeNote,style: AppStyle.noNotes2),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}