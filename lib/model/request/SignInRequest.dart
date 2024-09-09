class SignInRequest {
  String? email;
  String? password;

  SignInRequest({
    this.email,
    this.password
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
    email: json['email'] as String?,
    password: json['password'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password, // Consider renaming to `id` for clarity
  };
}
