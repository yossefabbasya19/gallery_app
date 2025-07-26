// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoResponseAdapter extends TypeAdapter<PhotoResponse> {
  @override
  final int typeId = 3;

  @override
  PhotoResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoResponse(
      page: fields[0] as int?,
      perPage: fields[1] as int?,
      photos: (fields[2] as List?)?.cast<Photos>(),
      totalResults: fields[3] as int?,
      nextPage: fields[4] as String?,
      prevPage: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoResponse obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.perPage)
      ..writeByte(2)
      ..write(obj.photos)
      ..writeByte(3)
      ..write(obj.totalResults)
      ..writeByte(4)
      ..write(obj.nextPage)
      ..writeByte(5)
      ..write(obj.prevPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
