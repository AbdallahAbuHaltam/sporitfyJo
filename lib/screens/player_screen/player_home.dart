import 'package:flutter/material.dart';
import 'package:sportify/screens/type_of_user/type_of_user_screen.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:sportify/utilities/fonts/fonts.dart';

import '../profile/profile.dart';
import '../shared_functions/signup_functions.dart';

class PlayerHome extends StatefulWidget {
  final bool isOwner;
  const PlayerHome({super.key, required this.isOwner});

  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
    List<Map> categories = [
      {'name': 'football', 'imagePath': 'assets/images/football.jpg'},
      {'name': 'basketball', 'imagePath': 'assets/images/basketball.jpg'},
      {'name': 'padel', 'imagePath': 'assets/images/padel.jpg'},
      {'name': 'tennis', 'imagePath': 'assets/images/tennis.jpg'},
      {'name': 'volleyball', 'imagePath': 'assets/images/volleyball.jpg'},
    ];
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: mMainColor,
        elevation: 0,
        
      ),
       drawer: Drawer(
            backgroundColor: mMainColor,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0, -2),
                    end: Alignment(0, 0.5),
                    colors: [
                      Color(0xFF1F1F2B),
                      Color(0xFF1F1F2B),
                      Color(0xFF1F1F2B),
                      Color.fromARGB(255, 39, 39, 54),
                      Color.fromARGB(255, 42, 42, 58),
                    ]),
              ),
              child: ListView(children: [
                DrawerHeader(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        ),
                         SizedBox(width: pageWidth * 0.05,),
                        Text(
                          "Abdullah AbuHaltam",
                          style: appBarFont2,
                        ),
                      ],
                    )),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: white,
                  ),
                  title: Text(
                    'Profile',
                    style: drawerListTile,
                  ),
                  onTap: () => SharedFunction.navigatorPushFunction(
                      context, const ProfilePage()),
                ),
                SizedBox(
                  height: pageHeight * 0.01,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: white,
                  ),
                  title: Text(
                    'Booking Page',
                    style: drawerListTile,
                  ),
                  // onTap: () => SharedFunction.navigatorPushFunction(
                  //     context, const BookingPage()),
                ),
                SizedBox(
                  height: pageHeight * 0.01,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.login_outlined,
                    color: white,
                  ),
                  title: Text(
                    'Logout',
                    style: drawerListTile,
                  ),
                  onTap: () =>
                      SharedFunction.navigatorPushAndRemoveUntilFunction(
                          context, const TypeOfUser()),
                )
              ]),
            ),
          ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: pageWidth,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Find Your', style: homeText),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Playground',
                    style: homeText2,
                  ),
                   SizedBox(
                    height: pageHeight*0.03,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(244, 243, 243, 1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: mMainColor,
                        ),
                        hintText: "Search what you're looking for",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: pageHeight*0.01,
                  )
                ],
              ),
            ),

             SizedBox(
              height: pageHeight*0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: homeText3,
                  ),
                   SizedBox(
                    height: pageHeight*0.015,
                  ),
                  Container(
                    height: pageHeight * 0.12,
                    color: white,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle the tap action for the image here.
                                  print(
                                      'Tapped on ${categories[index]['name']}');
                                },
                                child: SizedBox(
                                  width:
                                      80.0, // Set your desired width for the image
                                  child: Image.asset(
                                      categories[index]['imagePath']),
                                ),
                              ),
                              Text(categories[index]['name'],style: homeText3,)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: pageHeight*0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                      'Suggested',
                      style: homeText3,
                    ),
                     SizedBox(
                      height: pageHeight*0.015,
                    ),
                    
                  Container(
                    color: white,
                    height: pageHeight*0.28,
                    width: double.infinity,
                    
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
