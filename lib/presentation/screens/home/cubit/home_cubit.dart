import 'package:bloc/bloc.dart';
import 'package:new_horizon_challenge_app/presentation/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitHomeState());
}
