import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  // Material design 3
  useMaterial3: true,

  // Couleur primaire
  primaryColor: const Color(0XFF000000),
  // primaryColor: Color(0XFFD23F57),
  // Couleur

  // Définir la couleur par défaut pour l'appbar
  appBarTheme: const AppBarTheme(
    color: Color(0XFF000000), // Couleur de l'appbar
    iconTheme: IconThemeData(
      color: Colors.white,
    ), // Couleur des icônes de l'appbar
  ),

  // Définir la couleur par défaut pour les boutons
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0XFF000000), // Couleur des boutons
    // buttonColor: Color(0XFFD23F57), // Couleur des boutons
    textTheme: ButtonTextTheme.primary, // Couleur du texte des boutons
  ),

  // Définir la couleur par défaut pour les icônes
  iconTheme: const IconThemeData(
    color: Color(0xFF2B3445), // Couleur des icônes
  ),

  // Définir la couleur par défaut pour le texte
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Color(0xFF2B3445),
      fontSize: 14,
      fontFamily: 'Nunito',
      // fontFamily: 'Muli',
      // color: Colors.red,
    ), // Couleur du texte par défaut
  ),

  // Définir la couleur par défaut pour le floating action button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    // backgroundColor: Color(0XFFD23F57), // Couleur du bouton
    backgroundColor: Color(0XFF000000), // Couleur du bouton
    foregroundColor: Colors.white, // Couleur de l'icône du bouton
  ),

  scaffoldBackgroundColor: const Color(0xFFF6F7F9),

  cardTheme: const CardTheme(
    color: Colors.white,
    surfaceTintColor: Colors.white,
  ),

  colorScheme: const ColorScheme(
    primary: Color(0XFF000000), // Variante de la couleur principale
    // primary: Color(0XFFD23F57), // Variante de la couleur principale
    secondary: Color(0XFF07C065), // Variante de la couleur secondaire
    surface: Colors.white, // Couleur de surface
    background: Color(0XFFF6F9FC), // Couleur d'arrière-plan
    error: Colors.red, // Couleur d'erreur
    onPrimary: Colors.white, // Couleur sur la couleur principale
    onSecondary: Colors.black, // Couleur sur la couleur secondaire
    onSurface: Colors.black, // Couleur sur la surface
    onBackground: Colors.black, // Couleur sur l'arrière-plan
    onError: Colors.white, // Couleur sur l'erreur
    brightness: Brightness.light, // Luminosité
  ),
);
