
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_form/AddVat.dart';

import 'SelectVatCategory.dart';

class AddVATWidget extends StatefulWidget {
    AddVATWidget({BuildContext context});

  @override
  _AddVATWidgetState createState() => _AddVATWidgetState();
}

class _AddVATWidgetState extends State<AddVATWidget> {
  List<AddVat> addVATList = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey.withOpacity(
              0.3,
            ),
            height: 1,
          ),
           ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (ctx, index) => SelectVatCategory(
              addVatList: addVATList[index],
              removeVat: ()=>onDelete(
                index
              ),
            ),
            itemCount: addVATList.length,
          ),
          InkWell(
            onTap: (){
              onAddForm();
            },
            child: Container(
              height: 60,
              color: Colors.white,
              width: double.infinity,
              child: Center(
                child: Text(
                  '+ VAT Field',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey.withOpacity(
              0.3,
            ),
            height: 3,
          ),
        ],
      ),
    );
  }

  void onDelete(int index) {
    setState(() {
      addVATList.removeAt(index);
    });
  }
  void onAddForm(){
    setState(() {
      addVATList.add(AddVat());
    });
  }
  void notRemovableItem(){
    print('Not Remove');
  }
}
