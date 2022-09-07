import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF356849);
const Color primaryColor2 = Color(0xFF37966F);
const Color primaryColor3 = Color(0xFFB9E4C9);
const Color secondaryColor = Color(0xFFFD5523);
const Color backGroundColor = Color(0xFFFFFBE6);

final TextTheme basilTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
    fontSize: 97,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
    color: primaryColor,
  ),
  headline2: GoogleFonts.montserrat(
    fontSize: 61,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: primaryColor,
  ),
  headline3: GoogleFonts.montserrat(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),
  headline4: GoogleFonts.montserrat(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: secondaryColor,
  ),
  headline5: GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: secondaryColor,
  ),
  headline6: GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: primaryColor,
  ),
  subtitle1: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: primaryColor,
  ),
  subtitle2: GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: primaryColor2,
  ),
  bodyText1: GoogleFonts.lekton(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    color: primaryColor,
  ),
  bodyText2: GoogleFonts.lekton(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: primaryColor,
  ),
  button: GoogleFonts.lekton(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    color: primaryColor,
  ),
  caption: GoogleFonts.lekton(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: primaryColor,
  ),
  overline: GoogleFonts.lekton(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: primaryColor,
  ),
);
