class SignInResponse {
  final String? username;
  final String? email;
  final String id; // Consider renaming to `id` for clarity
  final String accessToken;
  final int? companyId;

  SignInResponse({
    required this.email,
    required this.id, // Consider renaming to `id` for clarity
    required this.accessToken,
    this.username,
    this.companyId,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
    username: json['username'] as String?,
    email: json['email'] as String?,
    id: json['id_user'] as String, // Consider renaming to `id` for clarity
    accessToken: json['access_token'] as String,
    companyId: json['company_id'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'id_user': id, // Consider renaming to `id` for clarity
    'access_token': accessToken,
    'company_id': companyId,
  };
}
