import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';
import 'package:sportify/data/login_register/login_register_models/owner/owner_model.dart';
import 'package:sportify/data/profile/profile_bloc/profile_bloc.dart';
import 'package:sportify/screens/detail_page/detail_page.dart';
import 'package:sportify/screens/owner_screen/add_edit_page/add_edit_page.dart';
import 'package:sportify/screens/type_of_user/type_of_user_screen.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:sportify/utilities/fonts/fonts.dart';

import '../../../data/add_edit/bloc/add_edit_bloc.dart';
import '../../../data/owner_home/bloc/owner_home_bloc.dart';
import '../../profile/profile.dart';
import '../../shared_functions/signup_functions.dart';
import '../booking_page/booking_page.dart';

class OwnerHomePage extends StatefulWidget {
  bool isOwner;
  OwnerHomePage({super.key, required this.isOwner});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  List<PlaygroundInfo> playgroundList = [];
  OwnerInfo? ownerInfo;
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider<OwnerHomeBloc>(
          create: (context) => OwnerHomeBloc()..add(LoadAllPlaygroundEvent()),
        ),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc())
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<OwnerHomeBloc, OwnerHomeState>(
            listener: (context, state) {
              // if (state is LoadingState) {
              //   const Center(child: CircularProgressIndicator());
              // }
              if (state is LoadedAllPlaygroundState) {
                playgroundList = state.playgroungList;
              }
            },
          ),
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is LoadingProfileDataState) {
                const CircularProgressIndicator();
              }
              if (state is LoadedOwnerProfileDataState) {
                ownerInfo = state.ownerInfo;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage(isOwner: true, ownerInfo: ownerInfo),
                    ));
              }
            },
          ),
        ],
        child: BlocBuilder<OwnerHomeBloc, OwnerHomeState>(
          builder: (context, state) {
            return Scaffold(
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
                        child: Text(
                          "more options ",
                          style: appBarFont,
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
                        onTap: () {
                          BlocProvider.of<ProfileBloc>(context)
                              .add(LoadOwnerProfileEvent(isOwner: true));
                        }),
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
                      onTap: () => SharedFunction.navigatorPushFunction(
                          context, const BookingPage()),
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
              appBar: AppBar(
                backgroundColor: mMainColor,
                title: const Text('Home Page'),
              ),
              floatingActionButton: CircleAvatar(
                maxRadius: Checkbox.width + 10,
                backgroundColor: mMainColor,
                child: FloatingActionButton(
                  elevation: 30,
                  hoverColor: black,
                  heroTag: "button2",
                  backgroundColor: mMainColor,
                  onPressed: () {
                    SharedFunction.navigatorPushFunction(
                        context, AddEditPage(isEdit: false));
                  },
                  child: const Icon(
                    Icons.add,
                    color: white,
                  ),
                ),
              ),
              body: SizedBox(
                width: pageHeight * 0.6,
                height: pageHeight,
                child: ListView.builder(
                  itemCount: playgroundList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 7, bottom: 10),
                      child: GestureDetector(
                        onLongPress: () {
                          showModalBottomSheet(
                            backgroundColor: mMainColor,
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5),
                                  bottom: Radius.circular(0)),
                            ),
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                  color: white,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          child: ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddEditPage(
                                                      isEdit: true,
                                                      playground:
                                                          playgroundList[index],
                                                    ),
                                                  ));
                                            },
                                            title: Center(
                                              child: Text("Edit",
                                                  style: homeDetailButtonFont),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: mMainColor,
                                        height: 10,
                                      ),
                                      ListTile(
                                        onTap: () {
                                          // BlocProvider.of<OwnerHomeBloc>(
                                          //         blocContext)
                                          //     .add(DeleteCarEvent(
                                          //         carUID: carsList[index]
                                          //             .carUUID));
                                        },
                                        title: Center(
                                          child: Text("Delete",
                                              style: homeDetailButtonFont),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        onTap: () {
                          SharedFunction.navigatorPushFunction(
                              context,
                              DetailPage(
                                  playground: playgroundList[index],
                                  isOwner: true));
                        },
                        child: Container(
                          width: pageWidth * 0.6,
                          height: pageHeight * 0.22,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: NetworkImage(
                                playgroundList[index].playgroundImage,
                              ))),
                          child: Padding(
                            padding: EdgeInsets.only(right: pageWidth * 0.05),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Color.fromARGB(255, 220, 220, 220)
                                          .withAlpha(210),
                                      Color.fromARGB(31, 197, 197, 197)
                                          .withAlpha(210),
                                      Color.fromARGB(179, 205, 205, 205)
                                          .withAlpha(210),
                                    ],
                                  ),
                                ),
                                width: pageWidth * 0.6,
                                height: pageHeight * 0.1,
                                child: Stack(
                                  children: [
                                    Positioned(
                                        left: pageWidth * 0.5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: mMainColor),
                                          width: 40,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              playgroundList[index]
                                                  .playgroundSize,
                                              style: homeSizeFont,
                                            ),
                                          ),
                                        )),
                                    Positioned(
                                        top: 0,
                                        left: 10,
                                        child: Text(
                                          playgroundList[index].playgroundName,
                                          style: homeNameFont,
                                        )),
                                    Positioned(
                                      top: 30,
                                      left: 10,
                                      child: Text(
                                        playgroundList[index].playgroundType,
                                        style: homeTypeFont,
                                      ),
                                    ),
                                    Positioned(
                                      top: 50,
                                      left: 10,
                                      child: Text(
                                        "${playgroundList[index].playgroundPrice} \$",
                                        style: homePriceFont,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 0.4, right: 0.5),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                              ),
                                              color: mMainColor),
                                          width: 85,
                                          height: 30,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: pageWidth * 0.03),
                                                  child: Text("Details",
                                                      style:
                                                          homeDetailButtonFont),
                                                ),
                                                const Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: mPrimaryColor,
                                                  size: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
