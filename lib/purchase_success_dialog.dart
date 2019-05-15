import 'package:flutter/material.dart';

class PurchaseSuccessDialog extends StatefulWidget {
  @override
  _PurchaseSuccessDialogState createState() => _PurchaseSuccessDialogState();
}

class _PurchaseSuccessDialogState extends State<PurchaseSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle, color: Colors.green[300], size: 80.0),
            Text('Pick up before: 22:30', textAlign: TextAlign.center, style: TextStyle(color: Colors.red[400], fontSize: 20.0),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('You\'ve save food. Well done!\n Don\'t forget to collect your food and enjoy!', textAlign: TextAlign.center),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              color: Colors.amber[300],
              textColor: Colors.grey[700],
              child: Text('No problem!'),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
