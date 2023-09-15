import 'package:dio/dio.dart';
import 'package:solid_software_flutter_task/core/models/custom_response/custom_response.dart';
import 'package:solid_software_flutter_task/core/utils/api_constants.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/models/random_color_model/random_color_model.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/providers/random_color_provider.dart';

/// A utility class that provides methods for making remote API requests.
class RemoteServices {
  /// Options for configuring the Dio HTTP client.
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: APIConstants.baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  /// The Dio HTTP client instance configured with base options.
  static final Dio dio = Dio(baseOptions);

  /// Sends a request to the API to generate a random color and updates the
  /// [RandomColorProvider].
  ///
  /// [randomColorProvider]: An instance of [RandomColorProvider] to update with
  /// the generated color.
  ///
  /// Returns: A [CustomResponse] indicating the result of the request.
  static Future<CustomResponse> generateRandomColor(
    RandomColorProvider randomColorProvider,
  ) async {
    try {
      final response = await dio.get(APIConstants.random);

      if (response.statusCode == APIConstants.responseSuccess) {
        final RandomColorModel randomColorModel = RandomColorModel.fromJson(
          response.data.toString(),
        );
        randomColorProvider.setRandomColor = randomColorModel;

        return CustomResponse(
          success: true,
          statusCode: response.statusCode ?? 0,
        );
      } else {
        return CustomResponse(
          success: false,
          statusCode: response.statusCode ?? 0,
          message: response.statusMessage ?? "",
        );
      }
    } on DioException catch (e) {
      return CustomResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 0,
        message: e.toString(),
      );
    }
  }
}
