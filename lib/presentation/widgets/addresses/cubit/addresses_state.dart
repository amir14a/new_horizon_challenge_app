import 'package:new_horizon_challenge_app/data/models/location_address_model.dart';

abstract class AddressesState {}

class InitAddressesState extends AddressesState {}

class LoadingAddressesState extends AddressesState {}

class ResponseAddressesState extends AddressesState {
  final List<LocationAddress> list;

  ResponseAddressesState(this.list);
}
