import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portify/main.dart';

void main() {
  testWidgets('App loads login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: PortifyApp()));

    // Verify that the login screen title and button exist.
    expect(find.text('Portify'), findsOneWidget);
    expect(find.text('Continue with GitHub'), findsOneWidget);
  });
}
