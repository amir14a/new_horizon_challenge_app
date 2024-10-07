import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_horizon_challenge_app/data/models/loan_box_model.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/loan_box_list/view/progress_painter.dart';
import 'package:new_horizon_challenge_app/utils/assets.dart';
import 'package:new_horizon_challenge_app/utils/colors.dart';

class LoanBoxWidget extends StatefulWidget {
  final LoanBox model;

  const LoanBoxWidget(this.model, {super.key});

  @override
  State<LoanBoxWidget> createState() => _LoanBoxWidgetState();
}

class _LoanBoxWidgetState extends State<LoanBoxWidget> with SingleTickerProviderStateMixin {
  late AnimationController animation;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    Future.delayed(Duration(seconds: 1)).then((_) => animation.forward());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey.shade100,
        color: Colors.white,
        elevation: 6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.title ?? '',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.model.secondTitle ?? '',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => animation.forward(from: 0),
                          child: AnimatedBuilder(
                            animation: animation,
                            builder: (context, _) {
                              var progress =
                                  Tween<double>(begin: 0, end: widget.model.progressPercent?.toDouble() ?? 0)
                                      .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic))
                                      .value;
                              return SizedBox.square(
                                dimension: 120,
                                child: CustomPaint(
                                  painter: ProgressPainter(progressPercent: progress),
                                  size: Size(120, 120),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'مبلغ کل : ${widget.model.formattedTotalAmount}',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(USER_ICON),
                const SizedBox(width: 4),
                Text(
                  'سمت : ${widget.model.position}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: dividerColor,
              height: 0,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(USERS_GROUP_ICON),
                            const SizedBox(width: 4),
                            Text(
                              'اعضاء',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: normalTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${widget.model.membersCount} نفر',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: smallTextColor),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(color: dividerColor),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(CALENDER_ICON),
                            const SizedBox(width: 4),
                            Text(
                              'تاریخ سررسید',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: normalTextColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.model.persianBillingDate,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: smallTextColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
