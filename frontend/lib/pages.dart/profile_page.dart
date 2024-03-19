import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart/user_info_tile.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              SizedBox(width: 10),
              Text('Profile')
            ]),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: ClipRect(
                  child: Image.asset('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              Text("User Name",
                  style: TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              Text("Email@email.com",
                  style: TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {}
                  // => Get.to(()=> const UpdateProfileScreen() )
                  ,
                  child: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
//               ProfileMenuWidget(
//                 title: "Account",
//                 icon: Icons.person,
//                 onPress: () {},
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: "Account",
//                 icon: Icons.person,
//                 onPress: () {},
//                 endIcon: true,
//               ),
//               ProfileMenuWidget(
//                 title: "Account",
//                 icon: Icons.person,
//                 onPress: () {},
//                 endIcon: true,
//               ),

              UserInfoTile(label: "Full Name", value: "John Doe"),
              UserInfoTile(label: "Email", value: "JohnDoe@gmail.com"),
              UserInfoTile(label: "Height", value: "170 cm"),
              UserInfoTile(label: "Weight", value: "70 kg"),
              UserInfoTile(label: "Gender", value: "Male"),
              UserInfoTile(label: "Allergies", value: "None"),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout_sharp,
                onPress: () {},
                endIcon: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.person, color: Colors.black),
      ),
      title: Text(
        title,
        style: TextStyle(),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black),
            )
          : null,
    );
  }
}

// class ProfilePage extends StatelessWidget {
//   // final User user;
//   // const ProfilePage({Key? key, required this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow,
//         title: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.person),
//               SizedBox(width: 10),
//               Text('Profile')
//             ]),
//       ),
//       // leading: IconButton(
//       //   icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//       //   onPressed: () {
//       //     Navigator.of(context).pop();
//       //   },
//       // ),
//       // actions: [
//       //   TextButton(
//       //     onPressed: () {},
//       //     child: Text(
//       //       'Edit',
//       //       style: TextStyle(
//       //           color: Colors.white,
//       //           fontSize: 14,
//       //           fontWeight: FontWeight.w600),
//       //     ),
//       //     style: TextButton.styleFrom(
//       //         foregroundColor: Colors.white,
//       //         shape: RoundedRectangleBorder(
//       //             borderRadius: BorderRadius.circular(100))),
//       //   ),
//       // ],
//       // systemOverlayStyle: SystemUiOverlayStyle.dark,
//       // ),
//       body: ListView(
//         shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         children: [
//           // Section 1 - Profile Picture Wrapper
//           Container(
//             color: Colors.yellow[100],
//             padding: EdgeInsets.symmetric(vertical: 24),
//             child: GestureDetector(
//               onTap: () {
//                 //print('Code to open file manager');
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 130,
//                     height: 130,
//                     margin: EdgeInsets.only(bottom: 15),
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(100),
//                       // Profile Picture
//                       image: const DecorationImage(
//                           image: AssetImage('assets/images/profile.jpg'),
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('User Name',
//                           style: TextStyle(
//                               fontFamily: 'inter',
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black)),
//                       SizedBox(width: 8),
//                       Icon(Icons.camera_alt, color: Colors.black),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           // Section 2 - User Info Wrapper
//           Container(
//             margin: EdgeInsets.only(top: 24),
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 UserInfoTile(
//                   margin: EdgeInsets.only(bottom: 16),
//                   label: 'Email',
//                   value: 'JohnDoe@gmail.com',
//                 ),
//                 UserInfoTile(
//                   margin: EdgeInsets.only(bottom: 16),
//                   label: 'Full Name',
//                   value: 'John Doe',
//                 ),
//                 UserInfoTile(
//                   margin: EdgeInsets.only(bottom: 16),
//                   label: 'Height, Weight',
//                   value: ' -- ',
//                   valueBackground: Colors.white,
//                 ),
//                 UserInfoTile(
//                   margin: EdgeInsets.only(bottom: 16),
//                   label: 'Allergies',
//                   value: '#,#,#,#',
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
