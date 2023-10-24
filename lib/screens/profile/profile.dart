// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';
import 'package:sportify/data/profile/profile_bloc/profile_bloc.dart';
import 'package:sportify/utilities/colors/utilities.dart';

import '../../data/login_register/login_register_models/owner/owner_model.dart';
import '../../utilities/fonts/fonts.dart';

class ProfilePage extends StatefulWidget {
  final OwnerInfo? ownerInfo;
  final PlayerInfo? playerInfo;

  final bool isOwner;
  const ProfilePage({
    Key? key,
    this.ownerInfo,
    this.playerInfo,
    required this.isOwner,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  PlayerInfo? playerInfo;
  OwnerInfo? ownerInfo;
  bool changeButton = false;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
        text: widget.isOwner
            ? widget.ownerInfo!.ownerName
            : widget.playerInfo!.playerName);
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ChangeNameState) {
            _nameController.text = state.nameOfUser;
            changeButton = false;
            Fluttertoast.showToast(
              msg: "The name is change successfully",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              backgroundColor: mMainColor,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mMainColor,
              title: const Text('Profile Informations'),
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: mMainColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 0, bottom: 0),
                              child: Icon(
                                Icons.perm_identity_rounded,
                                size: 35,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: pageWidth * 0.05,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: mMainColor,
                              ),
                              width: pageWidth * 0.7,
                              height: pageHeight * 0.06,
                              child: TextField(
                                key: _nameKey,
                                controller: _nameController,
                                textAlign: TextAlign.center,
                                style: nameOfProfilePage,
                                onChanged: (value) {
                                  changeButton = true;
                                },
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: mMainColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 0, bottom: 0),
                              child: Icon(
                                Icons.email_outlined,
                                size: 35,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: pageWidth * 0.05,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: mMainColor,
                              ),
                              width: pageWidth * 0.7,
                              height: pageHeight * 0.06,
                              child: Center(
                                child: widget.isOwner
                                    ? Text(
                                        widget.ownerInfo!.ownerEmail,
                                        style: profilePagefont,
                                      )
                                    : Text(widget.playerInfo!.playerName,
                                        style: profilePagefont),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: mMainColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 0, bottom: 0),
                              child: Icon(
                                Icons.phone_enabled_outlined,
                                size: 35,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: pageWidth * 0.05,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: mMainColor,
                              ),
                              width: pageWidth * 0.7,
                              height: pageHeight * 0.06,
                              child: Center(
                                child: widget.isOwner
                                    ? Text('0${widget.ownerInfo!.ownerPhone}',
                                        style: profilePagefont)
                                    : Text('0${widget.playerInfo!.playerPhone}',
                                        style: profilePagefont),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: mMainColor,
                            child: Padding(
                              padding: EdgeInsets.only(left: 0, bottom: 0),
                              child: Icon(
                                Icons.numbers_outlined,
                                size: 35,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: pageWidth * 0.05,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: mMainColor,
                              ),
                              width: pageWidth * 0.7,
                              height: pageHeight * 0.06,
                              child: Center(
                                child: widget.isOwner
                                    ? Text(widget.ownerInfo!.ownerUUId,
                                        style: profilePagefont)
                                    : Text(widget.playerInfo!.playerUUId,
                                        style: profilePagefont),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: pageHeight * 0.07),
                      child: Visibility(
                          visible: changeButton,
                          child: MaterialButton(
                              color: mMainColor,
                              child: Text("Save Change", style: nameOfCarFont),
                              onPressed: () {
                                BlocProvider.of<ProfileBloc>(context).add(
                                    ChangeNameEvent(
                                        isOwner: widget.isOwner,
                                        nameOfUser: _nameController.text));
                              })),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
