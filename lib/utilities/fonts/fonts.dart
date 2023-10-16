import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/utilities.dart';

TextStyle appBarFont = GoogleFonts.teko(
  fontSize: 28,
  color: mBackgroundColor,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
);

TextStyle inFont = GoogleFonts.poppins(
  fontSize: 20,
  color: mPrimaryColor,
  decoration: TextDecoration.none,
);

TextStyle loginText = GoogleFonts.poppins(
  fontSize: 9,
  color: mMainColor,
  decoration: TextDecoration.none,
);

TextStyle loginFontButton = GoogleFonts.staatliches(
  fontSize: 12,
  color: mPrimaryColor,
  decoration: TextDecoration.none,
);

TextStyle sizeOfPlaygroundFont = GoogleFonts.teko(
  fontSize: 28,
  color: mBackgroundColor,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
);
TextStyle drawerListTile = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: white,
  decoration: TextDecoration.none,
);
TextStyle addEditText = GoogleFonts.poppins(
  fontSize: 16,
  color: white,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.bold,
);
TextStyle chooseImageText = GoogleFonts.poppins(
  fontSize: 10,
  color: white,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.bold,
);
TextStyle typeOfPlaygroundText = GoogleFonts.poppins(
  fontSize: 14,
  color: black,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.bold,
);

TextStyle homeSizeFont = GoogleFonts.poppins(
  fontSize: 15,
  color: mPrimaryColor,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
  shadows: [
    Shadow(
      offset: Offset(
          2.0, 2.0), // Change the offset values for your desired shadow effect
      blurRadius: 4.0, // Adjust the blur radius for your desired shadow effect
      color: Color.fromARGB(255, 39, 38, 38).withOpacity(0.5), // Shadow color
    ),
  ],
);

TextStyle homeNameFont = GoogleFonts.poppins(
  fontSize: 21,
  color: black,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
  shadows: [
    Shadow(
      offset: Offset(
          2.0, 2.0), // Change the offset values for your desired shadow effect
      blurRadius: 4.0, // Adjust the blur radius for your desired shadow effect
      color:
          Color.fromARGB(255, 188, 188, 188).withOpacity(0.5), // Shadow color
    ),
  ],
);
TextStyle homeTypeFont = GoogleFonts.poppins(
  fontSize: 12,
  color: mPrimaryColor,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
  // shadows: [
  //   Shadow(
  //     offset: Offset(
  //         2.0, 2.0), // Change the offset values for your desired shadow effect
  //     blurRadius: 4.0, // Adjust the blur radius for your desired shadow effect
  //     color:
  //         Color.fromARGB(255, 243, 212, 103).withOpacity(0.5), // Shadow color
  //   ),
  // ],
);
TextStyle homeDetailButtonFont = GoogleFonts.poppins(
  fontSize: 12,
  color: mPrimaryColor,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
);

TextStyle homePriceFont = GoogleFonts.poppins(
  fontSize: 16,
  color: green,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
);
