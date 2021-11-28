part of data_access;

@JsonSerializable()
class SessionData {
  @JsonKey(required: true)
  final String accessToken;

  SessionData(this.accessToken);

  factory SessionData.fromJson(Map<String, dynamic> json) =>
      _$SessionDataFromJson(json);
  Map<String, dynamic> toJson() => _$SessionDataToJson(this);
}
