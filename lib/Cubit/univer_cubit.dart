import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_api/State/univer_state.dart';

import '../models/model.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState());
  Box<UniverResponse>? box;

init()async {
  box = await Hive.openBox("Country");
  List<UniverResponse> newList = box?.values.toList() ?? [];
  emit(CountryState(univerModel: newList));
}

getApi(String name) async {
  var res = await http.get(Uri.parse(
      "http://universities.hipolabs.com/search?country=${name}"));
  List<UnversityModel> newList = unversityModelFromJson(res.body);
  UniverResponse newData = UniverResponse(univers: newList,name: name, );
  box?.put(name, newData);
  state.univerModel?.add(newData);
  emit(CountryState(univerModel: state.univerModel));
}
delete(int index){
  box?.delete(state.univerModel?[index].name);
  state.univerModel?.removeAt(index);
  emit(CountryState(univerModel: state.univerModel));
}



}