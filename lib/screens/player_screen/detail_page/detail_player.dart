// import 'package:flutter/material.dart';
// import 'package:sportify/utilities/colors/utilities.dart';

// import '../../../data/add_edit/add_edit_model/main_playground_model.dart';
// import '../../../utilities/fonts/fonts.dart';

// class DetailPlayer extends StatefulWidget {
//   final MainPlaygroundModel playground;
//   final bool isOwner;
//   const DetailPlayer(
//       {super.key, required this.playground, required this.isOwner});

//   @override
//   State<DetailPlayer> createState() => _DetailPlayerState();
// }

// class _DetailPlayerState extends State<DetailPlayer> {
//   bool selected5x5 = false;
//   bool selected6x6 = false;
//   @override
//   Widget build(BuildContext context) {
//     double pageWidth = MediaQuery.of(context).size.width;
//     double pageHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           color: white,
//           height: pageHeight,
//           width: pageWidth,
//           child: Stack(
//             children: [
//               SizedBox(
//                 width: pageWidth,
//                 height: pageHeight * 0.34,
//                 child: Image.network(widget.playground.playgroundImage),
//               ),
//               Positioned(
//                 top: pageHeight * 0.06,
//                 left: pageWidth * 0.04,
//                 child: SizedBox(
//                   width: pageWidth * 0.08,
//                   height: pageHeight * 0.04,
//                   child: CircleAvatar(
//                     backgroundColor: white,
//                     child: IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(
//                         Icons.arrow_back_ios_new_sharp,
//                         color: mMainColor,
//                         size: 17,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: pageWidth * 0.05,
//                 top: pageHeight * 0.01,
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                     top: pageHeight * 0.25,
//                   ),
//                   child: Container(
//                     width: pageWidth * 0.9,
//                     height: pageHeight * 0.15,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15.0),
//                       color: white,
//                       border: Border.all(
//                         color: Colors.black.withOpacity(0.1), // Border color
//                         width: 2.0, // Border width
//                       ),
//                     ),
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: pageHeight * 0.01,
//                           left: pageWidth * 0.09,
//                           child: Text(
//                             widget.playground.playgroundNumber,
//                             style: cardText,
//                           ),
//                         ),
//                         Positioned(
//                           left: pageWidth * 0.3,
//                           child: IconButton(
//                             icon: const Icon(
//                               Icons.info,
//                               color: Colors.cyan,
//                               size: 18,
//                             ),
//                             onPressed: () {},
//                           ),
//                         ),
//                         Positioned(
//                           top: pageHeight * 0.015,
//                           right: pageWidth * 0.04,
//                           child: SizedBox(
//                             width: pageWidth * 0.08,
//                             height: pageHeight * 0.04,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Colors.black
//                                       .withOpacity(0.1), // Grey border color
//                                   width: 2.0, // Border width
//                                 ),
//                               ),
//                               child: CircleAvatar(
//                                 backgroundColor: Colors
//                                     .white, // Set your background color here
//                                 child: Center(
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: const Icon(
//                                       Icons.phone,
//                                       color: Colors.green,
//                                       size: 13,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: pageHeight * 0.049,
//                           left: pageWidth * 0.09,
//                           child: Text(
//                             widget.playground.playgroundType,
//                             style: homeSizeFont,
//                           ),
//                         ),
//                         Positioned(
//                           left: pageWidth * 0.05,
//                           top: pageHeight * 0.068,
//                           child: TextButton.icon(
//                             onPressed: () {},
//                             icon: const Icon(
//                               Icons.star,
//                               color: mPrimaryColor,
//                               size: 15,
//                             ),
//                             label: Text('4.0', style: homeText4),
//                           ),
//                         ),
//                         Positioned(
//                           top: pageHeight * 0.086,
//                           right: pageWidth * 0.30,
//                           child: Text(
//                             'Price',
//                             style: homePriceFont,
//                           ),
//                         ),
//                         Positioned(
//                           top: pageHeight * 0.11,
//                           right: pageWidth * 0.31,
//                           child: Text(
//                             '\$${widget.playground.playgroundPrice}',
//                             style: homeText3,
//                           ),
//                         ),
//                         Positioned(
//                           top: pageHeight *
//                               0.09, // Use the same top position as the second Text widget
//                           right: (pageWidth * 0.21 + pageWidth * 0.28) /
//                               2, // Calculate the horizontal center
//                           child: Container(
//                             width:
//                                 1.0, // Line thickness (this will make it vertical)
//                             height: pageHeight *
//                                 0.04, // Adjust the height as needed
//                             color: Colors.black.withOpacity(0.4), // Line color
//                           ),
//                         ),
//                         Positioned(
//                           top: pageHeight * 0.086,
//                           right: pageWidth * 0.13,
//                           child: Text(
//                             'Size',
//                             style: homePriceFont,
//                           ),
//                         ),
//                         Positioned(
//                           top: pageHeight * 0.11,
//                           right: pageWidth * 0.13,
//                           child: Text(
//                             widget.playground.playgroundSize,
//                             style: homeText3,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: pageHeight * 0.42,
//                 child: SizedBox(
//                   width: pageWidth,
//                   height: pageHeight * 0.5,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 20.0,
//                           top: 4,
//                         ),
//                         child: Text(
//                           'Playgrounds',
//                           style: cardText2,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0),
//                         child: SizedBox(
//                           height:
//                               pageHeight * 0.16, // Adjust the height as needed
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 2,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(
//                                   top: pageHeight * 0.003,
//                                   bottom: pageHeight * 0.02,
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.only(
//                                     left: pageWidth * 0.2,
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             selected6x6 = !selected6x6;
//                                           });
//                                         },
//                                         child: Container(
//                                           width: pageWidth * 0.23,
//                                           height: pageHeight * 0.13,
//                                           decoration: BoxDecoration(
//                                               color: selected6x6
//                                                   ? mPrimaryColor
//                                                   : mMainColor,
//                                               shape: BoxShape.circle),
//                                           child: Center(
//                                             child: Text(
//                                               widget.playground.playgroundSize,
//                                               style: sizeOfPlaygroundFont,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
