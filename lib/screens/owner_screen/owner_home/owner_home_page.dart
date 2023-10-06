import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_bloc/add_edit_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_model/playground_model.dart';
import 'package:sportify/screens/owner_screen/add_edit_page/add_edit_page.dart';
import 'package:sportify/screens/owner_screen/booking_page/booking_ppage.dart';
import 'package:sportify/screens/profile/profile_page.dart';
import 'package:sportify/screens/shared_functions/signup_functions.dart';
import 'package:sportify/screens/type_of_user/type_of_user_screen.dart';
import 'package:sportify/utilities/colors/utilities.dart';
import 'package:sportify/utilities/fonts/fonts.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddEditBloc(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AddEditBloc, AddEditState>(
            listener: (context, state) {
              if (state is LoadingState) {
                const Center(child: CircularProgressIndicator());
              }
              if (state is AddedPlaygroundState) {}
            },
          ),
        ],
        child: Scaffold(
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
                    context, const AddEditPage(isEdit: false));
              },
              child: const Icon(
                Icons.add,
                color: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
