import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<OnChangeTheme>(_onChangeTheme);
  }

  void _onChangeTheme(OnChangeTheme event, Emitter emitter) {
    emitter(state.copyWith(isDark: event.isDark));
  }
}
