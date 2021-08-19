

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_form/AddVat.dart';

import 'AddVatModel.dart';

typedef onRemoveVat();
typedef onAddVat();
class SelectVatCategory extends StatefulWidget {
  final onRemoveVat removeVat;
  final onAddVat addVat;
  final AddVat addVatList;
  final state=_SelectVatCategoryState();


  SelectVatCategory({this.addVat,this.removeVat, this.addVatList});

  @override
  _SelectVatCategoryState createState() => state;
}

class _SelectVatCategoryState extends State<SelectVatCategory> {
  AddVatModel dropdownValue;
  List<AddVat> vatList=[];
  List<AddVatModel> addModelList = List();
  String dropDownZeroIndex;
  String catName;
  String catVat;
  TextEditingController textEditingController;
  var _selectedItemIndex = 0;
  String edValue;

  @override
  void initState() {
    addModelList.add(AddVatModel(id: '01', name: 'VAT Category', vat: '13.5%'));
    addModelList.add(AddVatModel(id: '02', name: 'VAT Category', vat: '15.5%'));
    addModelList.add(AddVatModel(id: '03', name: 'VAT Category', vat: '10.5%'));
    super.initState();
  }
  final formVat = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formVat,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 8),
                  height: 60,
                  child: DropdownButton<AddVatModel>(
                    value: dropdownValue,
                    hint: Text('Select Category'),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 0,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    onChanged: (AddVatModel data) {
                      setState(() {
                        dropdownValue = data;
                        catName = data.name;
                        catVat = data.vat;
                      });
                    },
                    underline: Container(
                      height: 0,
                      color: Colors.white,
                    ),
                    items: addModelList
                        .map<DropdownMenuItem<AddVatModel>>((AddVatModel value) {
                      return DropdownMenuItem<AddVatModel>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                value.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                value.vat,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 0,
                      top: 5,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                        border: Border.all(
                          color: Colors.grey.withOpacity(
                            0.3,
                          ),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 58,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '€',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'enter amount',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 2),
                color: Colors.grey.withOpacity(
                  0.3,
                ),
                width: 1,
                height: 60,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 7, left: 0),
                  child: InkWell(
                    onTap: () {
                      print('Remove Vat Item');
                      print('Vat Field List ${addModelList.length}');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 24,
                            color: Colors.grey.withOpacity(
                              0.5,
                            ),
                          ),
                          onPressed: () {
                            print('Remove Vat Item');
                            widget.removeVat();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  bool isVatValid(){
    var valid=formVat.currentState.validate();
    if(valid) formVat.currentState.save();
    return valid;
  }

}
