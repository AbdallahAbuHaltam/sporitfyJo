import 'package:flutter/material.dart';
import 'package:sportify/utilities/colors/utilities.dart';

import '../../../data/add_edit/add_edit_model/playground_model.dart';
import '../../../utilities/fonts/fonts.dart';

class DetailPlayer extends StatefulWidget {
  final PlaygroundInfo playground;
  final bool isOwner;
  const DetailPlayer(
      {super.key, required this.playground, required this.isOwner});

  @override
  State<DetailPlayer> createState() => _DetailPlayerState();
}

class _DetailPlayerState extends State<DetailPlayer> {
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
                height: pageHeight * 0.34,
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
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: pageHeight * 0.25,
                ),
                child: Container(
                  width: pageWidth,
                  height: pageHeight * 0.69,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: white,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: pageHeight * 0.025,
                        left: pageWidth * 0.09,
                        child: Text(
                          widget.playground.playgroundName,
                          style: cardText,
                        ),
                      ),
                      Positioned(
                        top: pageHeight * 0.025,
                        right: pageWidth * 0.04,
                        child: SizedBox(
                          width: pageWidth * 0.08,
                          height: pageHeight * 0.04,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black
                                    .withOpacity(0.1), // Grey border color
                                width: 2.0, // Border width
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors
                                  .white, // Set your background color here
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.phone,
                                    color: Colors.green,
                                    size: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: pageHeight * 0.063,
                        left: pageWidth * 0.09,
                        child: Text(
                          widget.playground.playgroundType,
                          style: homeSizeFont,
                        ),
                      ),
                      //
                      Positioned(
                        top: pageHeight * 0.12,
                        left: pageWidth * 0.09,
                        child: Text(
                          'Price',
                          style: homePriceFont,
                        ),
                      ),
                      Positioned(
                        top: pageHeight * 0.15,
                        left: pageWidth * 0.1,
                        child: Text(
                          '\$${widget.playground.playgroundPrice}',
                          style: homeText3,
                        ),
                      ),
                      Positioned(
                        top: pageHeight *
                            0.12, // Use the same top position as the second Text widget
                        left: (pageWidth * 0.19 + pageWidth * 0.28) /
                            2, // Calculate the horizontal center
                        child: Container(
                          width:
                              1.0, // Line thickness (this will make it vertical)
                          height:
                              pageHeight * 0.058, // Adjust the height as needed
                          color: Colors.black.withOpacity(0.4), // Line color
                        ),
                      ),
                      //
                      Positioned(
                        top: pageHeight * 0.12,
                        left: pageWidth * 0.28,
                        child: Text(
                          'Size',
                          style: homePriceFont,
                        ),
                      ),
                      Positioned(
                        top: pageHeight * 0.15,
                        left: pageWidth * 0.28,
                        child: Text(
                          widget.playground.playgroundSize,
                          style: homeText3,
                        ),
                      ),
                      Positioned(
                        top: pageHeight *
                            0.12, // Use the same top position as the second Text widget
                        left: (pageWidth * 0.55 + pageWidth * 0.28) /
                            2, // Calculate the horizontal center
                        child: Container(
                          width:
                              1.0, // Line thickness (this will make it vertical)
                          height:
                              pageHeight * 0.058, // Adjust the height as needed
                          color: Colors.black.withOpacity(0.4), // Line color
                        ),
                      ),
                      //
                      Positioned(
                        top: pageHeight * 0.12,
                        left: pageWidth * 0.5,
                        child: Text(
                          'Date',
                          style: homePriceFont,
                        ),
                      ),
                      Positioned(
                        top: pageHeight * 0.154,
                        left: pageWidth * 0.47,
                        child: Text(
                          '12/5/2023',
                          style: homeText4,
                        ),
                      ),
                      Positioned(
                        top: pageHeight *
                            0.12, // Use the same top position as the second Text widget
                        right: (pageWidth * 0.34 + pageWidth * 0.28) /
                            2, // Calculate the horizontal center
                        child: Container(
                          width:
                              1.0, // Line thickness (this will make it vertical)
                          height:
                              pageHeight * 0.058, // Adjust the height as needed
                          color: Colors.black.withOpacity(0.4), // Line color
                        ),
                      ),
                      Positioned(
                        top: pageHeight * 0.12,
                        right: pageWidth * 0.13,
                        child: Text(
                          'Time',
                          style: homePriceFont,
                        ),
                      ),
                      Positioned(
                        top: pageHeight * 0.154,
                        right: pageWidth * 0.07,
                        child: Text(
                          '(9:00-11:00)',
                          style: homeText4,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: pageWidth * 0.09,
                        child: Container(
                          width: pageWidth * 0.8,
                          height: pageHeight * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mPrimaryColor,
                          ),
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: const Center(
                              child: Text(
                                'Book',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
