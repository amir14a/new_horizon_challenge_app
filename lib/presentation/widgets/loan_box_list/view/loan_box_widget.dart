import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_horizon_challenge_app/data/models/loan_box_model.dart';
import 'package:new_horizon_challenge_app/utils/assets.dart';
import 'package:new_horizon_challenge_app/utils/colors.dart';

class LoanBoxWidget extends StatefulWidget {
  final LoanBox model;

  const LoanBoxWidget(this.model, {super.key});

  @override
  State<LoanBoxWidget> createState() => _LoanBoxWidgetState();
}

class _LoanBoxWidgetState extends State<LoanBoxWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        elevation: 8,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.model.title ?? '',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      widget.model.secondTitle ?? '',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox.square(
                      dimension: 90,
                      child: CircularProgressIndicator(
                        color: appPrimaryColor,
                      ),
                    ),
                    Text(
                      widget.model.secondTitle ?? '',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(USER_ICON),
                const SizedBox(width: 8),
                Text(
                  'سمت : ${widget.model.position}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            Divider(color: dividerColor),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(USERS_GROUP_ICON),
                        const SizedBox(width: 8),
                        Text(
                          'اعضاء',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: normalTextColor),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.model.membersCount} نفر',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: smallTextColor),
                    ),
                  ],
                ),
                VerticalDivider(color: dividerColor),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(CALENDER_ICON),
                        const SizedBox(width: 8),
                        Text(
                          'تاریخ سررسید',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: normalTextColor),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.model.billingDate}',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: smallTextColor),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
