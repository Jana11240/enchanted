import 'package:flutter/material.dart';

// App Colours
const Color kPrimaryColor = Color(0xffA57B3C);
const Color kSecondaryColor = Color.fromARGB(255, 31, 8, 72);
const Color kTertiaryColor = Color.fromARGB(255, 135, 91, 179);
const kSoftTextColor = Color.fromARGB(255, 142, 142, 142);

// House Colours
const Map<String, Color> kHouseColorMap = {
  'G1': Color(0xff740001),
  'G2': Color(0xffae0001),
  'G3': Color(0xffeeba30),
  'G4': Color(0xffd3a625),
  'S1': Color(0xff1a472a),
  'S2': Color(0xff2a623d),
  'S3': Color(0xff5d5d5d),
  'S4': Color(0xffaaaaaa),
  'R1': Color(0xff0e1a40),
  'R2': Color(0xff222f5b),
  'R3': Color(0xffbebebe),
  'R4': Color(0xff946b2d),
  'H1': Color(0xffecb939),
  'H2': Color(0xfff0c75e),
  'H3': Color(0xff726255),
  'H4': Color(0xff372e29),
};

// House Icons
const Map<String, Icon> kHouseElementIconsMap = {
  'G': Icon(
    Icons.fireplace_rounded,
    color: Color(0xff740001),
    size: 40,
  ),
  'S': Icon(
    Icons.water_rounded,
    color: Color(0xff1a472a),
    size: 40,
  ),
  'R': Icon(
    Icons.air_rounded,
    color: Color(0xff0e1a40),
    size: 40,
  ),
  'H': Icon(
    Icons.grass_rounded,
    color: Color(0xffecb939),
    size: 40,
  ),
};

// Borders
const kBorderRadius = 10.0;

// TextStyles
const kHeadline = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

const kBodyText = TextStyle(
  fontSize: 15,
);

const kSmallText = TextStyle(
  fontSize: 13,
);

const kExtraSmallText = TextStyle(
  fontSize: 11,
);

const kButtonText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const kBodyText2 = TextStyle(fontSize: 28, fontWeight: FontWeight.w500);
const kBodyText3 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
