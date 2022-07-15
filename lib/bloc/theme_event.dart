part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeModeSwitchedEvent extends ThemeEvent {
  final ThemeMode themeMode;

  const ThemeModeSwitchedEvent({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}
