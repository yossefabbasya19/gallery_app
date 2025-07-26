// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotosAdapter extends TypeAdapter<Photos> {
  @override
  final int typeId = 2;

  @override
  Photos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photos(
      id: fields[0] as int?,
      width: fields[1] as int?,
      height: fields[2] as int?,
      url: fields[3] as String?,
      photographer: fields[4] as String?,
      photographerUrl: fields[5] as String?,
      photographerId: fields[6] as int?,
      avgColor: fields[7] as String?,
      src: fields[8] as Src?,
      liked: fields[9] as bool?,
      alt: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Photos obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.width)
      ..writeByte(2)
      ..write(obj.height)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.photographer)
      ..writeByte(5)
      ..write(obj.photographerUrl)
      ..writeByte(6)
      ..write(obj.photographerId)
      ..writeByte(7)
      ..write(obj.avgColor)
      ..writeByte(8)
      ..write(obj.src)
      ..writeByte(9)
      ..write(obj.liked)
      ..writeByte(10)
      ..write(obj.alt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photos _$PhotosFromJson(Map<String, dynamic> json) => Photos(
      id: (json['id'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      url: json['url'] as String?,
      photographer: json['photographer'] as String?,
      photographerUrl: json['photographer_url'] as String?,
      photographerId: (json['photographer_id'] as num?)?.toInt(),
      avgColor: json['avg_color'] as String?,
      src: json['src'] == null
          ? null
          : Src.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool?,
      alt: json['alt'] as String?,
    );

Map<String, dynamic> _$PhotosToJson(Photos instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographerUrl,
      'photographer_id': instance.photographerId,
      'avg_color': instance.avgColor,
      'src': instance.src?.toJson(),
      'liked': instance.liked,
      'alt': instance.alt,
    };
