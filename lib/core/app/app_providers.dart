import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tn_test/features/screens/map/cubit/map_cubit.dart';

import '../../features/screens/no_internet/cubit/internet_cubit.dart';
import '../../features/screens/theme/cubit/theme_cubit.dart';
import 'app_dependency.dart';

class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    BlocProvider<InternetCubit>(
        create: (BuildContext context) => instance<InternetCubit>()),
    BlocProvider<MapCubit>(
        create: (BuildContext context) => instance<MapCubit>()),
  ];
}
