/// A utility class that defines constants for API endpoints.
class APIConstants {
  /// The base URL for the API.
  static const String baseUrl = "https://www.colr.org/json/color";

  /// The endpoint for generating a random color from the API.
  static const String random = "/random";

  /// Represents a successful HTTP response with a status code of 200.
  static const int responseSuccess = 200;

  /// Represents a client-side request error with a status code of 400.
  static const int requestError = 400;

  /// Represents a client-side not found error with a status code of 404.
  static const int notFoundError = 404;

  /// Represents a local error with a status code of 410.
  static const int localError = 410;
}
