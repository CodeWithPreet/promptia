import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConstants {
  static String apiUrl = dotenv.env['API_URL']!;
  static String apiKey = dotenv.env['API_KEY']!;
}
