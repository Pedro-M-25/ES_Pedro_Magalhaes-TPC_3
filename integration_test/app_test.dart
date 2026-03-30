import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:tpc_3/main.dart' as app;


void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Hello Name App - Acceptance Tests Avançados', () {

    testWidgets('Deve validar todas as configurações visuais e estruturais da app', (WidgetTester tester) async {

      app.main();
      await tester.pumpAndSettle();


      final materialAppFinder = find.byType(MaterialApp);
      expect(materialAppFinder, findsOneWidget, reason: 'A app deve usar um MaterialApp');
      
      final MaterialApp materialAppWidget = tester.widget<MaterialApp>(materialAppFinder);
      expect(materialAppWidget.debugShowCheckedModeBanner, false, reason: 'O banner de debug deve estar desativado');

      // vê a configuração do tema (Material 3 desativado)
      expect(materialAppWidget.theme?.useMaterial3, false, reason: 'A app deve estar configurada com useMaterial3: false');


      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget, reason: 'Deve existir uma AppBar no ecrã');
      
      final AppBar appBarWidget = tester.widget<AppBar>(appBarFinder);
      expect(appBarWidget.centerTitle, true, reason: 'O título da AppBar deve estar centrado');
      expect(find.descendant(of: appBarFinder, matching: find.text('Hello')), findsOneWidget, reason: 'O título da AppBar deve ser "Hello"');


      final greetingMessage = 'Hi! my name is Pedro';
      final textFinder = find.text(greetingMessage);
      expect(textFinder, findsOneWidget, reason: 'A mensagem principal deve estar visível');


      final Text textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.fontSize, 28, reason: 'A fonte deve ter tamanho 28');
      expect(textWidget.style?.fontWeight, FontWeight.w500, reason: 'A espessura da fonte deve ser w500');
      expect(textWidget.textAlign, TextAlign.center, reason: 'O alinhamento interno do texto deve ser centrado');


      // layout
      final centerFinder = find.ancestor(of: textFinder, matching: find.byType(Center));
      expect(centerFinder, findsWidgets, reason: 'O texto deve estar envolvido por um widget Center para garantir o layout');

    });

  });

}

