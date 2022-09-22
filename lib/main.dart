import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/db/database.dart';
import 'package:todo_app/services/router_generator.dart';
import 'package:todo_app/state_management/main_task/main_task_bloc.dart';
import 'package:todo_app/state_management/theme_handler/theme_handler_bloc.dart';
import 'package:todo_app/ui/tabs_screen/tabs_screen.dart';
import 'package:todo_app/utils/config/app_theme.dart';
import 'package:todo_app/utils/config/bloc_observer.dart';
import 'package:todo_app/utils/constant/constant.dart';
import 'package:todo_app/utils/enum/app_theme_enum.dart';
import 'package:todo_app/utils/theme/colour_palette.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Database.initHive();

  ///Zoned Errors
  //ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () async {
      await EasyLocalization.ensureInitialized();
      runZonedGuarded(
        /// Lock device orientation to portrait & Default StatusBar Colors
        () {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: ColourPalette.primary));
          runApp(EasyLocalization(
              supportedLocales: const [Locale('en-US'), Locale('id')],
              fallbackLocale: const Locale('id'),
              useOnlyLangCode: true,
              path: AssetsPath.pathTranslations,
              child: const MyAppMobile()));
        },
        (error, stackTrace) async {
          ///TODO Handle Error Purpose Outside of Zoned
        },
      );
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyAppMobile extends StatelessWidget {
  const MyAppMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeHandlerBloc()),
        BlocProvider(create: (context) => MainTaskBloc()),
      ],
      child: BlocBuilder<ThemeHandlerBloc, ThemeHandlerState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: ConstantValue.titleApps.tr(),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            theme: state.appTheme == AppTheme.light
                ? AppThemes.appThemeData[AppTheme.light]
                : AppThemes.appThemeData[AppTheme.dark],
            home: const TabsScreen(),
            onGenerateRoute: RouterGenerator.onGenerateRoute,
          );
        },
      ),
    );
  }
}
