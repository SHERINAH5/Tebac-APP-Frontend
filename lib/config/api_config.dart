class ApiConfig {
  static const baseUrl = "http://127.0.0.1:5000/api/v1/auth"; //for web
  
  //http://10.0.2.2:5000 // Android emulator
  //Real phone -my PC IP (e.g. 192.168.1.10)

  static const String login = "$baseUrl/login";
  static const String register = "$baseUrl/register";
  static const String me = "$baseUrl/me";
}