import 'package:flutter/material.dart';
import 'package:sportify/screens/player_screen/home/player_home.dart';
import 'package:sportify/utilities/colors/utilities.dart';

import '../shared_functions/signup_functions.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          color: mMainColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(
                      Icons.home,
                      color: mBackgroundColor,
                    ),
                    // onTap: () => SharedFunction.navigatorPushFunction(
                    //     context,
                    //     const PlayerHome(
                    //       isOwner: false,
                    //     )),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      color: mBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.history,
                      color: mBackgroundColor,
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.person,
                      color: mBackgroundColor,
                    ),
                    onTap: () {},
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
