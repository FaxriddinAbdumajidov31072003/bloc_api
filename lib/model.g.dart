// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UniverResponseAdapter extends TypeAdapter<UniverResponse> {
  @override
  final int typeId = 1;

  @override
  UniverResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UniverResponse(
      univers: (fields[1] as List).cast<UnversityModel>(),
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UniverResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.univers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniverResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UnversityModelAdapter extends TypeAdapter<UnversityModel> {
  @override
  final int typeId = 0;

  @override
  UnversityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnversityModel(
      domains: (fields[0] as List).cast<String>(),
      name: fields[1] as String,
      webPages: (fields[2] as List).cast<String>(),
      country: fields[3] as String,
      stateProvince: fields[4] as dynamic,
      alphaTwoCode: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UnversityModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.domains)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.webPages)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.stateProvince)
      ..writeByte(5)
      ..write(obj.alphaTwoCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnversityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
