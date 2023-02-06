import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pikkup/routes/app_routes.dart';
import 'package:pikkup/routes/providers.dart';
import 'package:pikkup/screens/home/home_screen.dart';
import 'package:pikkup/utils/dimensions.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: app_colors.background,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: app_colors.background,
        systemNavigationBarIconBrightness: Brightness.dark));*/

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      //systemNavigationBarIconBrightness: Brightness.dark,
    ));

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark
    // ));
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light));*/

    //Initialize the Dimensions class by passing the BuildContext
    Dimensions.init(context);

    return MultiProvider(
      providers: Providers.getProviders(),
      child: MaterialApp(
        title: 'Pikkup',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        //Force the textScaleFactor to be 1 throughout the app
        //This will hard scale the text to make sure it does not change with the device font size
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },

        initialRoute: HomeScreen.id,
        //initialRoute: ResetPasswordSuccessfulDialogScreen.id,
        //initialRoute: OpenMailDialogScreen.id,
        //initialRoute: BankTransferScreen.id,
        //initialRoute: PaymentOptionScreen.id,
        //initialRoute: PromoScreen.id,
        //initialRoute: AddACardScreen.id,
        //initialRoute: EnterAmountScreen.id,
        //initialRoute: OnboardingScreen.id,
        //initialRoute: WelcomeScreen.id,
        //initialRoute: SendAPackageScreen.id,
        //initialRoute: ResetPasswordScreen.id,
        //initialRoute: PaymentCardsScreen.id,
        //Because the id variable of WelcomeScreen is static, we can use it without creating an object of the screen, i.e WelcomeScreen().id, thereby making our code more efficient.

        routes: AppRoutes.routes(context),
      ),
    );
  }
}
