import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_dynamic_form/BlockModel.dart';
import 'package:image_picker/image_picker.dart';

import 'AddBlockWidget.dart';
import 'AddItemRowWidget.dart';
import 'AddVatModel.dart';


class PettyCashScreen extends StatefulWidget {
  static const routeName = '/pettycashScreen';

  PettyCashScreen();


  @override
  _PettyCashScreenState createState() =>
      _PettyCashScreenState();
}

class _PettyCashScreenState extends State<PettyCashScreen> {


  _PettyCashScreenState();
  List<Widget> addBlockList = List();
  List<Widget> addVATLis = [];
  File _image;
  var commentWidgets = List<Widget>();
  List<AddVatModel> addModelList = List();
  String dropDownZeroIndex;
  String catName;
  String catVat;


  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    // addBlockList.add(AddBlockWidget(context, addBlockList));
    // addModelList.add(AddVatModel(id: '01', name: 'Cat-1', vat: '13.5%'));
    // addModelList.add(AddVatModel(id: '02', name: 'Cat-2', vat: '15.5%'));
    // addModelList.add(AddVatModel(id: '03', name: 'Cat-3', vat: '10.5%'));
    // addModelList.add(AddVatModel(id: '04', name: 'Cat-4', vat: '11.5%'));
    // addModelList.add(AddVatModel(id: '05', name: 'Cat-1', vat: '13.5%'));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
      GestureDetector(
        child: Text('Camera'),
        onTap: () => {},
      ),
      GestureDetector(
        child: Text('Gallery'),
        onTap: () {},
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              "title",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  wordSpacing: 0,
                  fontSize: 19),
            ),
            Text(
              'Front Till',
              style: TextStyle(
                fontSize: 13,
                color: Colors.pink,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  'back',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Delete');
            },
            icon: Icon(
              Icons.delete,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 4,
                color: Colors.pink,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                   // addBlockList.add(AddBlockWidget());
                  });
                },
                child: AddItemRowWidget(
                  heightOfTile: 60,
                  textStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  buttonText: '+ Add Block',
                ),
              ),
              Container(
                height: 3,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: addBlockList.length,
                  itemBuilder: (
                      BuildContext ctx,
                      int index,
                      ) {
                    return Container(
                      color: Colors.white,
                     // child: addBlockList[index] = AddBlockWidget(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: AppBar().preferredSize.height,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          '€0.0',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        print('Done');
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
