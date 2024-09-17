import 'package:enchanted/main.dart';
import 'package:enchanted/model/house_model.dart';
import 'package:enchanted/model/spell_model.dart';
import 'package:enchanted/view/screens/home.dart';
import 'package:enchanted/view/screens/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Shows StartScreen on launch', (WidgetTester tester) async {
    await tester.pumpWidget(const EnchantedApp());
    expect(find.byType(StartScreen), findsOneWidget);
  });

  testWidgets('Tap start button', (WidgetTester tester) async {
    await tester.pumpWidget(const EnchantedApp());
    await tester.tap(find.text('Start your adventure'));
    await tester.pumpAndSettle();
  });

  testWidgets('Verify HouseScreen is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const EnchantedApp());
    await tester.tap(find.text('Start your adventure'));
    await tester.pumpAndSettle();
    await tester.pumpWidget(const EnchantedApp());
    expect(find.byType(FutureBuilder<List<House>?>), findsOneWidget);
  });

  testWidgets('Tap the Houses tab', (WidgetTester tester) async {
    await tester.pumpWidget(const EnchantedApp());
    await tester.tap(find.text('Start your adventure'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Houses'));
    await tester.pumpAndSettle();
    expect(find.byType(FutureBuilder<List<House>?>), findsOneWidget);
  });

  testWidgets('Tap the Spells tab', (WidgetTester tester) async {
    await tester.pumpWidget(const EnchantedApp());
    await tester.tap(find.text('Start your adventure'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Spells'));
    await tester.pumpAndSettle();
    expect(
        find.byType(FutureBuilder<Map<String, List<Spell>>?>), findsOneWidget);
  });

  testWidgets('Tap the Elixirs tab', (WidgetTester tester) async {
    await tester.pumpWidget(const EnchantedApp());
    await tester.tap(find.text('Start your adventure'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Elixirs'));
    await tester.pumpAndSettle();
    expect(find.byType(ElixirScreenWithData), findsOneWidget);
  });
}
