class ChangePassword {
  final bool success;
  final String message;
  final String password;

  ChangePassword({
    required this.success,
    required this.message,
    required this.password,
  });

  factory ChangePassword.fromJson(Map<String, dynamic> json) {
    // Check different possible response structures
    bool success = false;
    String message = 'Unknown response';
    String password;

    // Check for different success indicators
    if (json['status'] == 'success' || json['success'] == true) {
      success = true;
    }

    // Try to extract message
    message = json['message'] ??
        json['msg'] ??
        (success ? 'Password successfully updated' : 'Update failed');

    // Safely extract data
    password = json['password'];

    return ChangePassword(
      success: success,
      message: message,
      password: password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'password': password,
    };
  }
}
