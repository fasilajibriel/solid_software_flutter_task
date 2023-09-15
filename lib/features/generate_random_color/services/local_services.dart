import 'dart:math';

import 'package:solid_software_flutter_task/features/generate_random_color/models/random_color_model/color.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/models/random_color_model/random_color_model.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/providers/random_color_provider.dart';

/// A utility class that provides local services for generating random colors.
class LocalServices {
  /// Generates a random color and updates the provided [RandomColorProvider].
  ///
  /// [randomColorProvider]: An instance of [RandomColorProvider] to update
  /// with the generated color.
  static void generateRandomColor(RandomColorProvider randomColorProvider) {
    // Generate a random hexadecimal color value.
    final String randomHexValue = generateRandomHexValue();

    // Create a Color instance using the generated hex value and current
    // timestamp.
    final Color color = Color(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      hex: randomHexValue,
    );

    // Update the [RandomColorProvider] with the generated color.
    randomColorProvider.setRandomColor = RandomColorModel(color: color);
  }

  /// Generates a random hexadecimal color value.
  ///
  /// Returns: A random hexadecimal color value as a string.
  static String generateRandomHexValue() {
    final Random random = Random();
    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);

    // Combine the RGB values into a single color value with an alpha channel.
    final int colorValue = 0xFF000000 + (red << 16) + (green << 8) + blue;

    const int base16RadixString = 16;
    const int base2RadixString = 2;

    // Convert the color value to a hexadecimal string and remove the alpha
    // channel.
    return colorValue.toRadixString(base16RadixString).substring(base2RadixString).toUpperCase();
  }
}
