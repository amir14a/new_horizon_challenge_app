import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_horizon_challenge_app/data/models/location_address_model.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/addresses/addresses.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/addresses/cubit/addresses_state.dart';
import 'package:new_horizon_challenge_app/utils/assets.dart';
import 'package:new_horizon_challenge_app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class AddressesWidget extends StatelessWidget {
  const AddressesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AddressesCubit(),
      child: BlocBuilder<AddressesCubit, AddressesState>(
        builder: (BuildContext context, state) {
          Widget child = Container();
          if (state is LoadingAddressesState) {
            child = Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(.5),
              highlightColor: Colors.grey,
              period: kThemeAnimationDuration * 4,
              child: Container(
                width: 160,
                height: kMinInteractiveDimensionCupertino,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey),
              ),
            );
          } else if (state is ResponseAddressesState) {
            child = Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: appPrimaryColor)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LocationAddress>(
                  borderRadius: BorderRadius.circular(8),
                  icon: SvgPicture.asset(ARROW_DOWN_ICON),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  iconSize: 24,
                  menuWidth: MediaQuery.of(context).size.width - 48,
                  items: state.list
                      .map(
                        (e) => DropdownMenuItem<LocationAddress>(
                          alignment: Alignment.centerRight,
                          value: e,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  e.shortAddress ?? '',
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  e.fullAddress ?? '',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 12, color: smallTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  selectedItemBuilder: (c) => state.list
                      .map((e) => Text(
                            state.selected.shortAddress ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold, color: appPrimaryColor),
                          ))
                      .toList(),
                  elevation: 0,
                  isDense: true,
                  value: state.selected,
                  onChanged: (LocationAddress? value) {
                    if (value != null) {
                      context.read<AddressesCubit>().changeSelected(value);
                    }
                  },
                ),
              ),
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
