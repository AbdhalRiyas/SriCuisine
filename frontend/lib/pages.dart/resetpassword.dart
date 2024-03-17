import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        //brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    Text(
                      "Reset Your Password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                          ),
                    ),

                    SizedBox(height: 10),

                    // Text(
                    //   "Enter your email address and we'll send you a link to reset your password",
                    //   style: TextStyle(
                    //     fontSize: 15, 
                    //     color: Colors.grey[700],
                    //     ),
                    // )
                    
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile(label: "New Password"),
                      inputFile(label: "Confirm Password"),
                    ],
                  ),
                ),
            
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 2, left: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )
                        ),

                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {},
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),

                      child: const Text(
                        "Reset",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),


                // Container(
                //   padding: EdgeInsets.only(top: 100),
                //   height: 200,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("images/appLogo.png"),
                //         fit: BoxFit.fitHeight),
                //   ),
                // )

              ],
            ))
          ],
        ),
      ),
    );
  }
}

//creating a widget for text field

Widget inputFile({label, obscureText = false})
{

  //label text style edit
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style:const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color:Colors.black87
        ),

      ),

      const SizedBox( height: 5),  //text and text field between space

      //text fied edited stuff
      TextField(
        obscureText: obscureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10), //text fild size
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 175, 165, 165)  // display border color
            ),
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color:  Color.fromARGB(255, 172, 151, 151))  //when user clicked popup color
          )
        ),
      ),

      const SizedBox(height: 10,)  //text field between space

    ],
  );
}