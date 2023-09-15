import 'package:flutter/material.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/models/random_color_model/random_color_model.dart';

class RandomColorProvider with ChangeNotifier {
  RandomColorModel? _randomColor;
  RandomColorModel? get getRandomColor => _randomColor;
  set setRandomColor(RandomColorModel value) {
    _randomColor = value;
    notifyListeners();
  }
}
