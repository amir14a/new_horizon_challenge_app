import 'package:bloc/bloc.dart';
import 'package:new_horizon_challenge_app/data/models/location_address_model.dart';
import 'package:new_horizon_challenge_app/data/repositories/mock_api.dart';
import 'package:new_horizon_challenge_app/presentation/widgets/addresses/cubit/addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit() : super(InitAddressesState()) {
    fetchAddresses();
  }

  fetchAddresses() async {
    emit(LoadingAddressesState());
    var addresses = await MockApi.getAddresses();
    emit(ResponseAddressesState(addresses, addresses.first));
  }

  changeSelected(LocationAddress newSelected) {
    if (state is ResponseAddressesState) {
      emit(ResponseAddressesState((state as ResponseAddressesState).list, newSelected));
    }
  }
}
