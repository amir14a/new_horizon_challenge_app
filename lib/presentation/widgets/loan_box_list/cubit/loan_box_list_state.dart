import 'package:new_horizon_challenge_app/data/models/loan_box_model.dart';

abstract class LoanBoxListState {}

class InitLoanBoxListState extends LoanBoxListState {}

class LoadingLoanBoxListState extends LoanBoxListState {}

class ResponseLoanBoxListState extends LoanBoxListState {
  final List<LoanBox> list;

  ResponseLoanBoxListState(this.list);
}
