part of 'theme_handler_bloc.dart';

class ThemeHandlerState extends Equatable {
  final AppTheme appTheme;

  const ThemeHandlerState({required this.appTheme});

  @override
  List<Object> get props => [appTheme];
}

class ThemeHandlerInitial extends ThemeHandlerState {
  const ThemeHandlerInitial({required AppTheme appTheme})
      : super(appTheme: appTheme);
}
