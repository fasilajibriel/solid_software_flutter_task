import 'package:flutter/material.dart';
import 'package:solid_software_flutter_task/core/utils/app_constants.dart';
import 'package:solid_software_flutter_task/core/utils/theme_constants.dart';

/// A custom widget representing a pill-shaped button for toggling between local
/// and remote modes.
class LocalRemotePill extends StatelessWidget {
  /// The text value displayed on the pill button.
  final String value;

  /// A callback function called when the pill button is tapped.
  final VoidCallback onTap;

  /// A boolean indicating whether the pill button is currently active.
  final bool isActive;

  /// Constructor for creating a [LocalRemotePill].
  ///
  /// [value]: The text value displayed on the pill button.
  /// [onTap]: A callback function called when the pill button is tapped.
  /// [isActive]: A boolean indicating whether the pill button is currently
  /// active.
  const LocalRemotePill({
    required this.value,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.pillHorizontalPadding,
          vertical: AppConstants.pillVerticalPadding,
        ),
        decoration: BoxDecoration(
          color: isActive ? ThemeConstants.primaryColor : null,
          borderRadius: BorderRadius.circular(
            AppConstants.pillSwitchBorderRadius,
          ),
        ),
        child: Text(
          value,
          style: TextStyle(
            color: isActive ? ThemeConstants.secondaryColor : null,
          ),
        ),
      ),
    );
  }
}
