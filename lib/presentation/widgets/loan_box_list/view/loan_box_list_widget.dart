import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/loan_box_list/cubit/loan_box_list_cubit.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/loan_box_list/cubit/loan_box_list_state.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/loan_box_list/view/loan_box_widget.dart';
import 'package:shimmer/shimmer.dart';

class LoanBoxListWidget extends StatelessWidget {
  const LoanBoxListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoanBoxListCubit(),
      child: BlocBuilder<LoanBoxListCubit, LoanBoxListState>(
        builder: (BuildContext context, LoanBoxListState state) {
          var pageController = PageController(viewportFraction: .85);
          Widget child = SizedBox();
          if (state is LoadingLoanBoxListState) {
            child = Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(.5),
              highlightColor: Colors.grey,
              period: kThemeAnimationDuration * 4,
              child: PageView(
                controller: pageController,
                children: [
                  ...[0, 1, 2].map((e) => AnimatedBuilder(
                        animation: pageController,
                        builder: (BuildContext context, Widget? child) => Align(
                          alignment: Alignment.topCenter,
                          child: Transform.scale(
                            scaleY: 1 - (e - (pageController.page ?? 0)).abs() / 10,
                            child: Container(
                              margin: EdgeInsets.all(6),
                              width: double.infinity,
                              height: 300,
                              decoration:
                                  BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            );
          } else if (state is ResponseLoanBoxListState) {
            child = PageView(
              controller: pageController,
              children: [
                for (int i = 0; i < state.list.length; i++)
                  AnimatedBuilder(
                    animation: pageController,
                    builder: (BuildContext context, Widget? child) => Align(
                      alignment: Alignment.topCenter,
                      child: Transform.scale(
                          scaleY: 1 - (i - (pageController.page ?? 0)).abs() / 10,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: LoanBoxWidget(state.list[i]),
                          )),
                    ),
                  )
              ],
            );
          }
          return AnimatedSize(
            duration: kThemeAnimationDuration,
            child: AnimatedSwitcher(
              duration: kThemeAnimationDuration,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
