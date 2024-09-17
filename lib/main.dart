import 'package:enchanted/view/screens/home.dart';
import 'package:enchanted/view/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: EnchantedApp()));
}

class EnchantedApp extends StatelessWidget {
  const EnchantedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enchanted',
      theme: ThemeData(        
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          elevation: 2,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 31, 8, 72),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: kBodyText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          hintStyle: kBodyText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kSoftTextColor,
            ),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kSoftTextColor,
            ),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              textStyle: kBodyText.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w600)),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: kSoftTextColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
