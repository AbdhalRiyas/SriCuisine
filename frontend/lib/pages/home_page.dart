import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/home_appbar.dart';
import 'package:flutter_application_1/components/poprecipelist.dart';
import 'package:flutter_application_1/pages/BMIScreen.dart';
import 'package:flutter_application_1/services/UserApi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  var bmi = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bmi = UserApi.user.weight! /
        ((UserApi.user.height! / 100) * (UserApi.user.height! / 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.home), SizedBox(width: 10), Text('Home')]),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                const SizedBox(height: 20),
                // const HomeSearchBar(),
                // const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 170,
                      height: 170,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your BMI\n${bmi.toStringAsFixed(2)}kg/m2",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      width: 170,
                      height: 170,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Daily \nCalorie Intake\n2250 kcal/day",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BMIPageScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.yellow[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: const Text('BMI & Calorie Intake Calculator'),
                  ),
                ),
                const SizedBox(height: 20),
                const PopRecipesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double containerSize =
    //     (screenWidth - 40) / 2; // Subtracting padding and spacing

    // return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.yellow,
      //   title: const Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [Icon(Icons.home), SizedBox(width: 10), Text('Home')]),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             width: containerSize,
      //             height: containerSize,
      //             padding: EdgeInsets.all(20),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(30),
      //               color: Colors.yellow,
      //             ),
      //             child: const Center(
      //               child: Text(
      //                 'BMI',
      //                 style: TextStyle(
      //                   fontSize: 30,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.black,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           SizedBox(width: 20),
      //           Container(
      //             width: containerSize,
      //             height: containerSize,
      //             padding: EdgeInsets.all(20),
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(30),
      //               color: Colors.yellow,
      //             ),
      //             child: const Center(
      //               child: Text(
      //                 'Calorie',
      //                 style: TextStyle(
      //                   fontSize: 30,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.black,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(height: 30),
      //       Container(
      //         width: 390,
      //         height: 100,
      //         padding: EdgeInsets.all(20),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(30),
      //           color: Colors.yellow, // Making color transparent
      //         ),
      //         child: const Center(
      //           child: Text(
      //             'Rectangle',
      //             style: TextStyle(
      //               fontSize: 30,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.black,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    // );
//   }
// }
