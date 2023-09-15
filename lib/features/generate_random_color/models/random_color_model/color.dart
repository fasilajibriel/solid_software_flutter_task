import 'dart:convert';

import 'package:equatable/equatable.dart';

class Color extends Equatable {
  final int? timestamp;
  final String? hex;

  const Color({this.timestamp, this.hex});

  factory Color.fromMap(Map<String, dynamic> data) => Color(
        timestamp: data['timestamp'] as int?,
        hex: data['hex'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'timestamp': timestamp,
        'hex': hex,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Color].
  factory Color.fromJson(String data) {
    return Color.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Color] to a JSON string.
  String toJson() => json.encode(toMap());

  Color copyWith({
    int? timestamp,
    String? hex,
  }) {
    return Color(
      timestamp: timestamp ?? this.timestamp,
      hex: hex ?? this.hex,
    );
  }

  @override
  List<Object?> get props => [timestamp, hex];
}
