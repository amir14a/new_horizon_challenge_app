import 'package:new_horizon_challenge_app/data/models/loan_box_model.dart';
import 'package:new_horizon_challenge_app/data/models/location_address_model.dart';

abstract class MockData {
  static final mockLoanBoxes = [
    LoanBox(
      id: 1,
      title: 'صندوق وام احسان',
      secondTitle: 'صندوق قرعه کشی',
      totalAmount: 5000000,
      position: 'مدیر',
      membersCount: 12,
      progressPercent: 34,
      billingDate: '2024-11-07 00:00:00',
    ),
    LoanBox(
      id: 2,
      title: 'صندوق وام امیر',
      secondTitle: 'صندوق خانوادگی',
      totalAmount: 20000000,
      position: 'شرکت کننده',
      membersCount: 20,
      progressPercent: 56,
      billingDate: '2024-11-02 00:00:00',
    ),
    LoanBox(
      id: 3,
      title: 'صندوق وام شرکت',
      secondTitle: 'صندوق کارمندی',
      totalAmount: 10000000,
      position: 'دستیار',
      membersCount: 7,
      progressPercent: 80,
      billingDate: '2024-12-15 00:00:00',
    ),
    LoanBox(
      id: 4,
      title: 'صندوق وام کارگاه',
      secondTitle: 'صندوق کارگران',
      totalAmount: 3000000,
      position: 'مدیر',
      membersCount: 30,
      progressPercent: 95,
      billingDate: '2024-12-26 00:00:00',
    ),
    LoanBox(
      id: 5,
      title: 'صندوق وام دوستان',
      secondTitle: 'صندوق دوستانه',
      totalAmount: 12000000,
      position: 'شرکت کننده',
      membersCount: 3,
      progressPercent: 10,
      billingDate: '2025-01-01 00:00:00',
    ),
    LoanBox(
      id: 6,
      title: 'صندوق وام منزل',
      secondTitle: 'صندوق خانواده',
      totalAmount: 2000000,
      position: 'دستیار',
      membersCount: 4,
      progressPercent: 50,
      billingDate: '2025-02-07 00:00:00',
    ),
  ];
  static final mockAddresses = [
    LocationAddress(
      id: 1,
      fullAddress: 'تهران، محله 22، برج آزادی، پلاک 15',
      shortAddress: 'محله 22، تهران',
    ),
    LocationAddress(
      id: 1,
      fullAddress: 'اصفهان، میدان امام خمینی (ره)، روبروی عمارت عالی‌قاپو، پلاک 37',
      shortAddress: 'میدان امام خمینی، اصفهان',
    ),
    LocationAddress(
      id: 1,
      fullAddress: 'مشهد، منطقه 14، کنارگذر حرم مطهر، پلاک 8',
      shortAddress: 'منطقه 14، مشهد',
    ),
  ];
}
