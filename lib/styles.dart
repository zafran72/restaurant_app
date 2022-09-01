import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF356849);
const Color secondaryColor = Color(0xFFFD5523);
const Color backGroundColor = Color(0xFFFFFBE6);

final TextTheme basilTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.montserrat(
      fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.montserrat(
      fontSize: 48, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  headline4: GoogleFonts.montserrat(
      fontSize: 30, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: primaryColor),
  headline5: GoogleFonts.montserrat(
      fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 0.0),
  headline6: GoogleFonts.montserrat(
      fontSize: 17, fontWeight: FontWeight.w700, letterSpacing: 0.15),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.0),
  subtitle2: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.lekton(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.lekton(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.lekton(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.lekton(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.lekton(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
