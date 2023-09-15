import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_software_flutter_task/core/utils/app_constants.dart';
import 'package:solid_software_flutter_task/core/utils/theme_constants.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/providers/random_color_provider.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/views/page/random_color_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => RandomColorProvider(),
        ),
      ],
      child: const SolidSoftwareFlutterTask(),
    ),
  );
}

class SolidSoftwareFlutterTask extends StatelessWidget {
  /// Constructor for creating a `SolidSoftwareFlutterTask` instance.
  ///
  /// [key]: An optional key for identifying the instance.
  const SolidSoftwareFlutterTask();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeConstants.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const RandomColorPage(),
    );
  }
}
