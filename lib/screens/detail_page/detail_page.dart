import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/data/add_edit/add_edit_model/main_playground_model.dart';
import 'package:sportify/data/add_edit/add_edit_model/sub_playground_model.dart';
import 'package:sportify/data/login_register/login_register_models/player/player_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sportify/utilities/fonts/fonts.dart';

import '../../utilities/colors/utilities.dart';

class DetailPage extends StatefulWidget {
  final SubPlaygroundModel playground;
  final bool isOwner;
  const DetailPage(
      {super.key, required this.playground, required this.isOwner});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic> carList = {};
  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: white,
        child: Stack(
          children: [
            SizedBox(
              width: pageWidth,
              height: pageHeight * 0.4,
              child: Image.network(widget.playground.playgroundImage),
            ),
            Positioned(
                top: pageHeight * 0.06,
                left: pageWidth * 0.04,
                child: SizedBox(
                  width: pageWidth * 0.08,
                  height: pageHeight * 0.04,
                  child: CircleAvatar(
                    backgroundColor: white,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: mMainColor,
                          size: 17,
                        )),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                top: pageHeight * 0.3,
              ),
              child: Container(
                width: pageWidth,
                height: pageHeight * 0.65,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: white,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: pageHeight * 0.1,
                      left: pageWidth * 0.15,
                      child: Text(
                        widget.playground.playgroundSize,
                        style: homeTypeFont,
                      ),
                    ),
                    Positioned(
                      top: pageHeight * 0.06,
                      left: pageWidth * 0.7,
                      child: Text(
                        "${widget.playground.playgroundPrice} \$",
                        style: homePriceFont,
                      ),
                    ),
                    Positioned(
                        top: pageHeight * 0.05,
                        left: pageWidth * 0.15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: widget.playground.playgroundNumber,
                                style: homeNameFont,
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          '   ${widget.playground.playgroundType}',
                                      style: homeTypeFont),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: pageHeight * 0.04,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),

            // Positioned(
            //   top: pageHeight * 0.21,
            //   left: pageWidth * 0.28,
            //   child: Text(
            //     widget.car.carDate,
            //     style: modelOfCarDetailFont,
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
