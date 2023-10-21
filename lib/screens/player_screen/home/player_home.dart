import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/screens/player_screen/detail_page/detail_player.dart';
import 'package:sportify/screens/type_of_user/type_of_user_screen.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:sportify/utilities/fonts/fonts.dart';

import '../../../data/add_edit/add_edit_model/playground_model.dart';
import '../../../data/player_home/bloc/player_home_bloc.dart';
import '../../profile/profile.dart';
import '../../shared_functions/signup_functions.dart';

class PlayerHome extends StatefulWidget {
  final bool isOwner;
  const PlayerHome({super.key, required this.isOwner});

  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
    List<PlaygroundInfo> playgroundList = [];
    List<Map> categories = [
      {'name': 'football', 'imagePath': 'assets/images/football.jpg'},
      {'name': 'basketball', 'imagePath': 'assets/images/basketball.jpg'},
      {'name': 'padel', 'imagePath': 'assets/images/padel.jpg'},
      {'name': 'tennis', 'imagePath': 'assets/images/tennis.jpg'},
      {'name': 'volleyball', 'imagePath': 'assets/images/volleyball.jpg'},
    ];
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayerHomeBloc>(
          create: (context) => PlayerHomeBloc()..add(LoadAllPlaygroundEvent()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PlayerHomeBloc, PlayerHomeState>(
            listener: (context, state) {
              if (state is LoadedAllPlaygroundState) {
                playgroundList = state.playgroungList;
              }
            },
          ),
        ],
        child: BlocBuilder<PlayerHomeBloc, PlayerHomeState>(
          builder: (context, state) {
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
                              backgroundImage:
                                  AssetImage('assets/images/logo.png'),
                            ),
                            SizedBox(
                              width: pageWidth * 0.05,
                            ),
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
              body: SingleChildScrollView(
                child: SafeArea(
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
                              height: pageHeight * 0.03,
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
                              height: pageHeight * 0.01,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: pageHeight * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category',
                              style: homeText3,
                            ),
                            SizedBox(
                              height: pageHeight * 0.015,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                height: pageHeight * 0.16,
                                width: double.infinity,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right:
                                              10.0), // Add your desired padding

                                      child: Column(
                                        children: [
                                          Container(
                                            height: pageHeight * 0.1,
                                            width: pageWidth *
                                                0.21, // Use pageWidth if you have it defined
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    categories[index]
                                                        ['imagePath']),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            categories[index]['name'],
                                            style: homeText3,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: pageHeight * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Suggested',
                              style: homeText3,
                            ),
                            SizedBox(
                              height: pageHeight * 0.015,
                            ),
                            SizedBox(
                              height: pageHeight * 0.28,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: playgroundList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right:
                                            10.0), // Add your desired padding
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                        SharedFunction.navigatorPushFunction(
                                            context,
                                            DetailPlayer(
                                              isOwner: false,
                                              playground: playgroundList[index],
                                            )),
                                          child: Container(
                                            height: pageHeight * 0.28,
                                            width: pageWidth *
                                                0.7, // Use pageWidth if you have it defined
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    playgroundList[index]
                                                        .playgroundImage),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      15)),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        colors: <Color>[
                                                          Color.fromARGB(
                                                              255,
                                                              240,
                                                              240,
                                                              240), // Lighter color
                                                          Color.fromARGB(
                                                              255,
                                                              220,
                                                              220,
                                                              220), // Lighter color
                                                          Color.fromARGB(255,
                                                              230, 230, 230),
                                                        ],
                                                      ),
                                                    ),
                                                    width: pageWidth * 0.55,
                                                    height: pageHeight * 0.08,
                                                    child: Stack(children: [
                                                      Positioned(
                                                        left: pageWidth * 0.04,
                                                        child: Text(
                                                          playgroundList[index]
                                                              .playgroundName,
                                                          style: cardText,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: pageWidth * 0.45,
                                                        child: Text(
                                                          playgroundList[index]
                                                              .playgroundSize,
                                                          style: homeSizeFont,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: pageWidth * 0.04,
                                                        top: pageHeight * 0.04,
                                                        child: Text(
                                                            playgroundList[
                                                                    index]
                                                                .playgroundPrice,
                                                            style:
                                                                homePriceFont),
                                                      ),
                                                      Positioned(
                                                        left: pageWidth * 0.35,
                                                        top: pageHeight * 0.04,
                                                        child: Container(
                                                          width: 76,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color:
                                                                mPrimaryColor,
                                                          ),
                                                          child: MaterialButton(
                                                            onPressed: () {},
                                                            padding:
                                                                EdgeInsets.zero,
                                                            child: const Center(
                                                              child: Text(
                                                                'Book',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ]),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 2,
                                          left: pageWidth * 0.64,
                                          child:
                                              const Icon(Icons.sports_soccer),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
