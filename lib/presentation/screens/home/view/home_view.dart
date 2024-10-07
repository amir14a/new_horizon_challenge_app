import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/cubit/home_cubit.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/cubit/home_state.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Center(
            child: Text('Hello World!'),
          ),
        );
      },
    );
  }
}
