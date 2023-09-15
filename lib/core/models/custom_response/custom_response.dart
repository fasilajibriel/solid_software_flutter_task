/// A custom data structure representing a response from an API or service.
class CustomResponse {
  /// A boolean indicating the success status of the response.
  final bool success;

  /// A human-readable message associated with the response (optional).
  final String message;

  /// The HTTP status code associated with the response.
  final int statusCode;

  /// Creates a new instance of [CustomResponse].
  ///
  /// [success] should be set to `true` if the response is considered 
  /// successful,otherwise, set it to `false`.
  ///
  /// [statusCode] represents the HTTP status code of the response, typically 
  /// indicating the outcome of the request (e.g., 200 for success, 404 for not 
  /// found, etc.).
  ///
  /// [message] is an optional parameter that allows you to provide a 
  /// human-readable description or additional information about the response. 
  /// By default, it is an empty string ('').
  CustomResponse({
    required this.success,
    required this.statusCode,
    this.message = '',
  });
}
