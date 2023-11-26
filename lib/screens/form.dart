import 'dart:ffi';

import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController phoneNumber = TextEditingController();

  String? userName ;
  String? phone ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formstate,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'UserName : '),
                onSaved:(val){
                  userName = val ;
                  },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الحقل فارغ';
                  }
                  if (value.length > 20) {
                    return 'لا يمكن ان يكون اسم المستخدم اكبر من 20';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'PhoneNumber : '),
                onSaved:(val){
                  phone = val ;
                },
                controller: phoneNumber,
                validator: (value) {
                  if (value!.length > 12) {
                    return 'لا يمكن ان يكون رقم الهاتف اكبر من 12 ';
                  }
                  if (value.length < 9) {
                    return 'لا يمكن ان يكون رقم الهاتف اصغر من 9 ';
                  }
                },
              ),
              MaterialButton(
                onPressed: () {
                  print(phoneNumber.text);
                  if (formstate.currentState!.validate()) {
                    formstate.currentState!.save();
                    print(userName);
                    print(phone);

                  } else {
                    print('Not Vaild');
                  }
                },
                textColor: Colors.white,
                color: Colors.red,
                child: Text('Vaild'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
