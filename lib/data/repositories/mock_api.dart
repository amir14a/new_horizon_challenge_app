import 'package:new_horizon_challenge_app/data/models/loan_box_model.dart';
import 'package:new_horizon_challenge_app/data/models/location_address_model.dart';
import 'package:new_horizon_challenge_app/data/repositories/mock_data.dart';

abstract class MockApi {
  static Future<List<LoanBox>> getLoanBoxes() async {
    await Future.delayed(Duration(seconds: 2));
    return MockData.mockLoanBoxes;
  }

  static Future<List<LocationAddress>> getAddresses() async {
    await Future.delayed(Duration(seconds: 2));
    return MockData.mockAddresses;
  }
}
