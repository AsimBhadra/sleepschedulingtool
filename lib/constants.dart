import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Username',
  hintStyle: TextStyle(
    color: Color(0xFF4e4d4d),
  ),
  contentPadding:
    EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0
    ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFFC3D23),
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(22.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFFC3D23),
      width: 3.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(22.0),
    ),
  ),
);

const kBlueColor = Color(0xff0A3C91);
const kRedColor = Color(0xFFFC3D23);
const kLabelText = TextStyle(
  color: Colors.white,
  fontSize: 12.5,
  fontFamily: 'SourceSansPro',
);
const kTimeText = TextStyle(
  color: Colors.white,
  fontSize: 22.5,
  fontFamily: 'SourceSansPro',
);
const kNormalText = TextStyle(
  color: Colors.white,
  fontSize: 18.5,
  fontFamily: 'SourceSansPro',
);
const kNormalBoldText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
  fontFamily: 'SourceSansPro',
);
const kTempText = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  fontFamily: 'SourceSansPro',
);
const kTitleText = TextStyle(
  wordSpacing: 1.0,
  color: Colors.white,
  fontSize: 20.0,
  fontFamily: 'SourceSansPro',
);
const kInsightsText = TextStyle(
  color: Colors.white,
  fontSize: 13,
  fontFamily: 'SourceSansPro',
);
const kTitleTextBold = TextStyle(
  wordSpacing: 1.0,
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'SourceSansPro',
);
const kLightBlueColor = Color(0xFF44CAFF);