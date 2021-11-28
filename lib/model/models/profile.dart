part of models;

@JsonSerializable()
class Profile {
  @JsonKey(required: true, disallowNullValue: true)
  final int id;
  @JsonKey(required: true, disallowNullValue: true)
  final String firstName;
  @JsonKey(required: true, disallowNullValue: true)
  final String lastName;
  @JsonKey(required: true, disallowNullValue: true)
  final String emailAddress;
  @JsonKey(required: true, disallowNullValue: true)
  final String phoneNumber;
  @JsonKey(required: true, disallowNullValue: true)
  final String street;
  @JsonKey(required: true, disallowNullValue: true)
  final String city;
  @JsonKey(required: true, disallowNullValue: true)
  final String zip;

  bool get profileCompleted => firstName.isNotEmpty && lastName.isNotEmpty;

  Profile(this.id, this.firstName, this.lastName, this.emailAddress,
      this.phoneNumber, this.street, this.city, this.zip);

  factory Profile.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
