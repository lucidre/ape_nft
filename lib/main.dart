import 'package:flutter/services.dart';
import 'package:ape_nft/common_libs.dart';

void main() async {
  //GET INITS
  // permannent as the instance must persistet through out the application
  //Get.put(BottomBarController(), permanent: true);

  // WIDGET SETUPS
  WidgetsFlutterBinding.ensureInitialized();

//SYSTEM SETUPS
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: appName,
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: context.darkTheme,
      darkTheme: context.darkTheme,
    );
  }
}
