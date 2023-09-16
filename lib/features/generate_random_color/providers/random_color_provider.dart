import 'package:flutter/material.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/models/random_color_model/random_color_model.dart';

/// A provider class for managing and notifying changes in a random color.
///
/// The [RandomColorProvider] class is responsible for managing a random color
/// represented by a [RandomColorModel] instance. It allows you to get the
/// current random color and set a new random color, notifying any listeners of
/// the change.
///
/// Example Usage:
///
/// ```dart
/// // Create an instance of RandomColorProvider
/// final colorProvider = RandomColorProvider();
///
/// // Get the current random color
/// final currentColor = colorProvider.getRandomColor;
///
/// // Set a new random color
/// final newColor = RandomColorModel(/* color parameters */);
/// colorProvider.setRandomColor = newColor;
/// ```
class RandomColorProvider with ChangeNotifier {
  /// The current random color stored in a [RandomColorModel] instance.
  RandomColorModel? _randomColor;

  /// Get the current random color.
  RandomColorModel? get getRandomColor => _randomColor;

  /// Set a new random color and notify listeners of the change.
  set setRandomColor(RandomColorModel value) {
    _randomColor = value;
    notifyListeners();
  }
}
