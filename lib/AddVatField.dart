
import 'package:flutter/material.dart';

class AddVatField extends StatefulWidget {
  AddVatField({Key key}) : super(key: key);

  @override
  _AddVatFieldState createState() => _AddVatFieldState();
}

class _AddVatFieldState extends State<AddVatField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0)),
      child: Row(
        children: [
          Container(
            width: 350,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey, width: 0)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/icon/all_order_icon.png',
                    height: 180,
                    width: 100,
                  ),
                ),
                Column(

                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
