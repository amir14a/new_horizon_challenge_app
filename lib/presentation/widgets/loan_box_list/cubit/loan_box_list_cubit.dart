import 'package:bloc/bloc.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/loan_box_list/cubit/loan_box_list_state.dart';

class LoanBoxListCubit extends Cubit<LoanBoxListState> {
  LoanBoxListCubit() : super(InitLoanBoxListState());
}
