import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/cubit/home_cubit.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/cubit/home_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/addresses/addresses.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/loan_box_list/loan_box_list.dart';
import 'package:new_horizon_challenge_app/utils/assets.dart';
import 'package:new_horizon_challenge_app/utils/colors.dart';
import 'package:new_horizon_challenge_app/utils/extension_functions.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Row(
                    children: [
                      InkResponse(
                        onTap: () {},
                        child: SvgPicture.asset(MENU_ICON),
                      ),
                      Expanded(
                        child: AddressesWidget(),
                      ),
                      InkResponse(
                        onTap: () {},
                        child: SvgPicture.asset(SEARCH_ICON),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        'صندوق های من',
                        style: TextStyle(fontSize: 18, color: normalTextColor, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        DateTime.now().toPersianDate,
                        style: TextStyle(fontSize: 18, color: normalTextColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(child: LoanBoxListWidget())
              ],
            ),
          ),
        );
      },
    );
  }
}
