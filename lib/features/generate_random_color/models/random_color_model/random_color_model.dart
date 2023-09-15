import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:solid_software_flutter_task/features/generate_random_color/models/random_color_model/color.dart';

/// A data model representing a random color response.
class RandomColorModel extends Equatable {
  /// The generated color.
  final Color? color;

  /// A boolean indicating the success status of the response.
  final bool? success;

  @override
  List<Object?> get props {
    return [
      color,
      success,
    ];
  }

  /// Creates a new instance of [RandomColorModel].
  ///
  /// [color] represents the generated color (nullable).
  /// [success] should be set to `true` if the response is considered
  /// successful, otherwise, set it to `false` (nullable).
  const RandomColorModel({
    this.color,
    this.success,
  });

  /// Factory constructor to create a [RandomColorModel] from a map.
  factory RandomColorModel.fromMap(Map<String, dynamic> data) {
    return RandomColorModel(
      color: Color.fromMap(data['colors'][0] as Map<String, dynamic>),
      success: data['success'] as bool?,
    );
  }

  /// Factory constructor to create a [RandomColorModel] from a JSON string.
  factory RandomColorModel.fromJson(String data) {
    return RandomColorModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Converts the [RandomColorModel] to a map.
  Map<String, dynamic> toMap() => {
        'colors': color?.toMap(),
        'success': success,
      };

  /// Converts the [RandomColorModel] to a JSON string.
  String toJson() => json.encode(toMap());

  /// Creates a copy of [RandomColorModel] with optional parameter changes.
  RandomColorModel copyWith({
    Color? color,
    bool? success,
  }) {
    return RandomColorModel(
      color: color ?? this.color,
      success: success ?? this.success,
    );
  }
}
