import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/resetpassword.dart';

class OtpPage extends StatefulWidget {
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formfield = GlobalKey<FormState>();
  final otpnumberController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Otp Page"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Form(
                key: _formfield,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset("images/whiteLogo.jpg",
                    // height: 150,
                    // width: 200,
                    // ),
                    const SizedBox(height: 10),

                    // Username Validate part

                    TextFormField(
                        keyboardType: TextInputType.number,
                        controller: otpnumberController,
                        decoration: const InputDecoration(
                          labelText: "OtpNumber",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.numbers)
                        ),
                        validator: (value) {
                          bool otpNumberValid =
                              RegExp(r'^').hasMatch(value!);

                          if (value.isEmpty) {
                            return "Enter recieved OtpNumber";

                          } else if (!otpNumberValid) {
                            return "Enter Valid OtpNumber";
                          }
                        }),

                    const SizedBox(
                      height: 20,
                    ),

                    // Password Validate part

                    

                    const SizedBox(height: 30),

                    InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          print("Data Addeed Successfully");
                          otpnumberController.clear();

                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext)=>ResetPassPage()));
                        }
                         
                      },

                      //button editing

                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child:const  Center(
                            child: Text(
                          " Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),

                    const SizedBox(height: 25,),

                  ],
                )
              ),
          ),
        )
        
      );
  }
}
       



                   