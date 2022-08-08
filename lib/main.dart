import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ftp_games/core/cache/prefs_manager.dart';
import 'package:ftp_games/core/constants/app_constants.dart';
import 'package:ftp_games/core/navigation/navigation_service.dart';
import 'package:ftp_games/core/navigation/routes.dart';
import 'package:ftp_games/core/navigation/screen_router.dart';
import 'package:ftp_games/core/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await PrefsManager.instance.init();

  runApp(DevicePreview(
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(
          create: (context) => ThemeManager(),
        )
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      title: AppConstants.appName,
      theme: context.watch<ThemeManager>().theme,
      onGenerateRoute: ScreenRouter.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: Routes.init.slash,
    );
  }
}
