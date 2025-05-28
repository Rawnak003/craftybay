import 'package:flutter/material.dart';
import '../constants/strings.dart';
import '../routes/app_route_configs.dart';
import '../routes/app_route_names.dart';
import 'app_theme.dart';


class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutesName.splash,
      onGenerateRoute: AppRouteConfigs.generateRoute,
      theme: AppTheme.lightThemeData,
      home: const Scaffold(
        body: Center(
          child: Text('Crafty Bay'),
        ),
      ),
    );
  }
}
