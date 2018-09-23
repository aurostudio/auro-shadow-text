import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auro_shadow_text/auro_shadow_text.dart';

void main() {
  testWidgets('Verify ShadowText widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return MaterialApp(
            home: Material(
              child: Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: ShadowText(
                        'Shadow Text!',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        shadowTop: 2.5,
                        shadowLeft: 2.5,
                        opacityStyle: Colors.grey.withOpacity(1.0),
                        softWrap: true,
                        textScaleFactor: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is ShadowText && widget.data.startsWith('Shadow'),
        ),
        findsOneWidget);
  });
}
