// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_access;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionData _$SessionDataFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['accessToken']);
  return SessionData(
    json['accessToken'] as String,
  );
}

Map<String, dynamic> _$SessionDataToJson(SessionData instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
    };
