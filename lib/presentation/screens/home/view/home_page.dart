import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/cubit/home_cubit.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: HomePageView(),
    );
  }
}
