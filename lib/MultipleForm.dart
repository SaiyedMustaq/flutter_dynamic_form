import 'package:flutter/material.dart';
import 'package:flutter_dynamic_form/UserForm.dart';
import 'package:flutter_dynamic_form/user.dart';

class MultipleForm extends StatefulWidget {
  @override
  _MultipleFormState createState() => _MultipleFormState();
}

class _MultipleFormState extends State<MultipleForm> {
  List<User> userList = [];
  List<UserForm> userFormList = [];
  @override
  void initState() {
    userList.add(User());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userFormList.clear();
    for (int i = 0; i < userList.length; i++) {
      userFormList.add(UserForm(
        key: GlobalKey(),
        user: userList[i],
        onDelete: () => onDelete(
          i,
        ),
        onAddWidget: onAddForm,
        notRemove: notRemovableItem,
        listUSer: userList,
      ));
    }

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Block'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    onAddForm();
                  },
                  child: Text("add Block"),
                ),
                userList.length <= 0
                    ? Center(
                        child: Text(
                          "Add Form To BLock",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : ListView.builder(
                        primary: false, // take parent scroll
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) => userFormList[index],
                        itemCount: userList.length,
                      ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
            color: Colors.blue,
            onPressed: () {
              save();
            },
            child: Text('Save'),
          ),
        )
      ],
    );
  }

  void onDelete(int index) {
    setState(() {
      userList.removeAt(index);
    });
  }

  void onAddForm() {
    setState(() {
      userList.add(User());
    });
  }

  void notRemovableItem() {
    print('Not Remove');
  }

  void save() {
    userFormList.forEach((userFormList) => userFormList.isValidateForm());
    for(int i =0;i<userFormList.length;i++){


    }
  }
}
