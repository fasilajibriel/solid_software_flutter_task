import 'dart:convert';

import 'package:equatable/equatable.dart';

/// A class representing a Color with timestamp and hexadecimal value.
///
/// The [Color] class is used to model colors in your application. It contains
/// two properties: [timestamp] and [hex].
///
/// - [timestamp]: An optional integer representing the timestamp associated
/// with the color.
/// - [hex]: An optional string representing the hexadecimal color code.
///
/// This class implements several methods for creating, converting, and copying
/// color instances, making it versatile for various use cases.
///
/// Example Usage:
///
/// ```dart
/// // Creating a Color object from a Map
/// final color = Color.fromMap({'timestamp': 1631769800, 'hex': '#FF5733'});
///
/// // Converting the Color object to a JSON string
/// final jsonStr = color.toJson();
///
/// // Creating a copy of the Color object with modified values
/// final modifiedColor = color.copyWith(hex: '#00FF00');
/// ```
class Color extends Equatable {
  /// The timestamp associated with the color.
  final int? timestamp;

  /// The hexadecimal color code.
  final String? hex;

  @override
  List<Object?> get props => [timestamp, hex];

  /// Creates a new [Color] instance.
  ///
  /// The [timestamp] and [hex] parameters are optional and can be omitted.
  const Color({this.timestamp, this.hex});

  /// Factory constructor to create a [Color] instance from a JSON string.
  ///
  /// This method is used to deserialize a JSON string back into a [Color]
  /// object.
  factory Color.fromJson(String data) {
    return Color.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Factory constructor to create a [Color] instance from a Map.
  ///
  /// This method is useful for converting data received from sources like
  /// databases or APIs into a [Color] object.
  factory Color.fromMap(Map<String, dynamic> data) => Color(
        timestamp: data['timestamp'] as int?,
        hex: data['hex'] as String?,
      );

  /// Converts the [Color] instance to a Map.
  ///
  /// This method is useful when you need to save the [Color] object to a
  /// database or send it as JSON data.
  Map<String, dynamic> toMap() => {
        'timestamp': timestamp,
        'hex': hex,
      };

  /// Converts the [Color] instance to a JSON string.
  ///
  /// This method is useful when you need to serialize the [Color] object
  /// into a JSON format for storage or transmission.
  String toJson() => json.encode(toMap());

  /// Creates a new [Color] instance with optional modifications.
  ///
  /// You can specify new values for [timestamp] and [hex]. If a value is not
  /// provided, the existing value will be retained.
  ///
  /// Returns a new [Color] instance with the updated values.
  Color copyWith({
    int? timestamp,
    String? hex,
  }) {
    return Color(
      timestamp: timestamp ?? this.timestamp,
      hex: hex ?? this.hex,
    );
  }
}
