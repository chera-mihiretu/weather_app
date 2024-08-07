import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/presentation/bloc/weather_block.dart';
import 'package:flutter_basics/presentation/bloc/weather_event.dart';
import 'package:flutter_basics/presentation/bloc/weather_state.dart';
import 'package:flutter_basics/presentation/pages/weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock class for WeatherBloc
class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  late MockWeatherBloc mockWeatherBloc;

  // Setup mockWeatherBloc before each test
  setUp(() {
    mockWeatherBloc = MockWeatherBloc();

  });

  // Function to make the widget testable by providing the necessary Bloc
  Widget _makeTestable(Widget body) {
    return BlocProvider<WeatherBloc>(
      create: (context) => mockWeatherBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  // Test to ensure the widget is working correctly
  testWidgets(
    'This test shows that the Widget is working correctly',
        (WidgetTester testerWidget) async {
      when(() => mockWeatherBloc.state).thenReturn(()=>WeatherEmpty());
      // Act
      await testerWidget.pumpWidget(_makeTestable(const WeatherPage()));
      final textField = find.byType(TextField);

      // Expect
      expect(textField, findsOneWidget);

      // Act
      await testerWidget.enterText(textField, 'New York');
      await testerWidget.pump(); // Ensure the widget tree is updated
      expect(find.text('New York'), findsOneWidget);
    },
  );
}
