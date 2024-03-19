import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/trackerpage.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(10), // adjust the radius as needed
          child: const Image(
            image: AssetImage("assets/images/appLogoWhite.jpg"),
            width: 100,
            height: 100,
          ),
        ),
        const Text(
          "Welcome to\n  SriCuisine!",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1,
              // color: Colors.grey[700]
              ),
        ),
        const Spacer(),
        // const Image(image: AssetImage("images/appLogo.jpg"), width: 100, height: 100,),
        //  Container(
        //   width: double.infinity,
        //   height: 130,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(15),
        //     image: const DecorationImage(
        //       image: AssetImage("images/appLogo.jpg"),
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),frontend/assets/images/AppLogoWithoutBGjpg.jpg
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TrackerPage()),
            );
          },
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.white,
            fixedSize: const Size(55, 55),
          ),
          icon: const Icon(Iconsax.notification),
        ),
      ],
    );
  }
}
