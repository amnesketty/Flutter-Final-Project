import 'package:flutter/material.dart';

class PopUpDialog extends StatelessWidget {
  final VoidCallback function;
  final String tipePopUpDialog;
  final String popUpButton;

  const PopUpDialog({
    super.key,
    required this.function,
    required this.tipePopUpDialog,
    required this.popUpButton
  });

  @override
  Widget build(BuildContext context) {
    return buildPopupDialog(context, function);
  }

  Widget buildPopupDialog(BuildContext context, VoidCallback function) {
      return AlertDialog(
        titlePadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        title: Container(
          alignment: Alignment.centerLeft,
          height: 50,
          width: 311,
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)
              ),
              color: Color(0XFFE67E22)
          ),
          child: const Text('SUCCESS',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700,
                fontSize: 14
            ),
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        content: 
        
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              tipePopUpDialog == "registerSuccess" ? "Your registration has been successfully completed" 
              : tipePopUpDialog == "bookingSuccess" ? "Your booking has been successfully completed"
              : "Unknown Error"
              ,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                ),
                side: const BorderSide(width: 1.0, color: Color(0XFFE67E22)),
                elevation: 0,
                primary: const Color(0xFFFFFFFF)
            ),
            onPressed: function,
            child:  Text(
              popUpButton == "registerSuccess" ? "SIGN IN"
              : popUpButton == "bookingSuccess" ? "Close"
              : "Unknown Error"
              ,
              style: TextStyle(
                  color: Color(0XFFE67E22),
                  fontWeight: FontWeight.w700,
                  fontSize: 14
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
      );
    }
    
      
}