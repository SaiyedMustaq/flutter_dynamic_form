import 'package:flutter/material.dart';
import 'package:flutter_dynamic_form/user.dart';

import 'AddVATWidget.dart';
import 'AppColor.dart';

typedef OnDelete();
typedef OnAdd();
typedef NotRemove();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;
  final OnAdd onAddWidget;
  final NotRemove notRemove;
  List<User> listUSer;

  UserForm(
      {Key key,
      this.onDelete,
      this.user,
      this.onAddWidget,
      this.listUSer,
      this.notRemove})
      : super(key: key);

  @override
  _UserFormState createState() => state;

  bool isValidateForm() => state.isValid();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  margin: EdgeInsets.fromLTRB(
                    10,
                    5,
                    5,
                    15,
                  ),
                  child: Row(
                    children: [
                      //dotted box with camera
                      // _image == null
                      //     ? DottedBorder(
                      //   dashPattern: [2],
                      //   color: Colors.grey,
                      //   radius: Radius.circular(
                      //     10,
                      //   ),
                      //   borderType: BorderType.Rect,
                      //   child: Container(
                      //     margin: EdgeInsets.fromLTRB(
                      //       10,
                      //       0,
                      //       10,
                      //       0,
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment:
                      //       MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         InkWell(
                      //           onTap: () {
                      //             _showPicker(context);
                      //           },
                      //           child: Image.asset(
                      //             'assets/icon/receipt.png',
                      //             color: black,
                      //             width: 50,
                      //             height: 50,
                      //           ),
                      //         ),
                      //         Text(
                      //           'Capture receipt',
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             fontSize: 12,
                      //             color: secondaryColor,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                      //     : InkWell(
                      //   onTap: () {
                      //     _showPicker(context);
                      //   },
                      //   child: Stack(
                      //     children: [
                      //       Container(
                      //         child: Image.file(
                      //           _image,
                      //           height: 100,
                      //           width: 100,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //       Align(
                      //         alignment: Alignment.bottomCenter,
                      //         child: Container(
                      //           height: 36,
                      //           width: 100,
                      //           padding: EdgeInsets.all(10),
                      //           color: Colors.black45.withOpacity(0.5),
                      //           child: Center(
                      //             child: Text(
                      //               'view / change',
                      //               style: TextStyle(
                      //                 fontSize: 12,
                      //                 color: white,
                      //                 fontWeight: FontWeight.w600,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    //references editText
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 0,
                        top: 0,
                      ),
                      child: Container(
                        height: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            2,
                          ),
                          border: Border.all(
                            width: 1,
                            color: logOutColor.withOpacity(
                              0.3,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: TextFormField(
                            initialValue: widget.user.referencesName,
                            validator: (val) =>
                                val.length > 3 ? null : 'Invalid Name',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                              alignLabelWithHint: true,
                              hintText: 'reference (e.g till 1)',
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                    ),
                    //enter amount editText
                    Padding(
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
                            color: logOutColor.withOpacity(
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
                                  color: logOutColor,
                                  width: 0,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '???',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: black,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: TextFormField(
                                  initialValue: widget.user.referencesAmount,
                                  validator: (val) =>
                                      val.length > 3 ? null : 'Invalid Amount',
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 2),
                color: logOutColor.withOpacity(
                  0.3,
                ),
                width: 1,
                height: 150,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 7, left: 0),
                  child: InkWell(
                    onTap: () {},
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
                            print('Remove Block');
                            widget.listUSer.length < 2
                                ? widget.notRemove()
                                : widget.onDelete();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          AddVATWidget(context: context),
        ],
      ),
    );
  }

  bool isValid() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}
