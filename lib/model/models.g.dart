// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const [
    'id',
    'firstName',
    'lastName',
    'emailAddress',
    'phoneNumber',
    'street',
    'city',
    'zip'
  ], disallowNullValues: const [
    'id',
    'firstName',
    'lastName',
    'emailAddress',
    'phoneNumber',
    'street',
    'city',
    'zip'
  ]);
  return Profile(
    json['id'] as int,
    json['firstName'] as String,
    json['lastName'] as String,
    json['emailAddress'] as String,
    json['phoneNumber'] as String,
    json['street'] as String,
    json['city'] as String,
    json['zip'] as String,
  );
}

Map<String, dynamic> _$UserToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'street': instance.street,
      'city': instance.city,
      'zip': instance.zip,
    };
