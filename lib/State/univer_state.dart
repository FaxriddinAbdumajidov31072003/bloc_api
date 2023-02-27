

import '../models/model.dart';

class CountryState {
  List<UniverResponse>? univerModel;

  CountryState({
    this.univerModel,

  });

  CountryState copyWith({

    List<UniverResponse>? postModel,
  }) {
    return CountryState(

      univerModel: postModel ?? this.univerModel ?? [],
    );
  }
}