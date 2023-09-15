import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_software_flutter_task/core/utils/app_constants.dart';
import 'package:solid_software_flutter_task/core/utils/theme_constants.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/providers/random_color_provider.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/services/local_services.dart';
import 'package:solid_software_flutter_task/features/generate_random_color/services/remote_services.dart';

import 'package:solid_software_flutter_task/features/generate_random_color/views/widget/local_remote_pill.dart';

/// A Flutter StatefulWidget for displaying a random color page.
class RandomColorPage extends StatefulWidget {
  /// Constructor for creating a [RandomColorPage].
  ///
  /// [key]: An optional key for identifying the widget.
  const RandomColorPage({super.key});

  @override
  State<RandomColorPage> createState() => _RandomColorPageState();
}

/// The state class for the [RandomColorPage].
class _RandomColorPageState extends State<RandomColorPage> {
  RandomColorProvider? _randomColorProvider;
  bool isGeneratingColor = false;
  bool isLocal = true;
  int whiteColor = 0xffffffff;

  @override
  Widget build(BuildContext context) {
    _randomColorProvider = Provider.of<RandomColorProvider>(context, listen: false);

    return GestureDetector(
      onTap: isLocal ? localColorGenerator : remoteColorGenerator,
      child: Scaffold(
        backgroundColor: Color(whiteColor),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.switchHorizontalPadding,
                    vertical: AppConstants.switchVerticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: ThemeConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(
                      AppConstants.pillSwitchBorderRadius,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LocalRemotePill(
                        value: "Local",
                        isActive: isLocal == true,
                        onTap: () => setState(() {
                          isLocal = true;
                        }),
                      ),
                      LocalRemotePill(
                        value: "Remote",
                        isActive: isLocal == false,
                        onTap: () => setState(() {
                          isLocal = false;
                        }),
                      ),
                    ],
                  ),
                ),
                const Text("Hello There!!")
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: isLocal ? localColorGenerator : remoteColorGenerator,
          child: isGeneratingColor
              ? const CircularProgressIndicator()
              : const Icon(
                  Icons.shuffle,
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  /// Generates a random local color and updates the UI.
  void localColorGenerator() {
    LocalServices.generateRandomColor(
      _randomColorProvider as RandomColorProvider,
    );
    if (_randomColorProvider?.getRandomColor != null) {
      final String colorValue = "0xff${_randomColorProvider?.getRandomColor?.color?.hex}";
      setState(() {
        whiteColor = int.parse(colorValue);
      });
    }
  }

  /// Generates a random remote color and updates the UI.
  Future<void> remoteColorGenerator() async {
    setState(() {
      isGeneratingColor = true;
    });
    await RemoteServices.generateRandomColor(
      _randomColorProvider as RandomColorProvider,
    ).then(
      (value) {
        if (value.success) {
          if (_randomColorProvider?.getRandomColor != null) {
            final String colorValue = "0xff${_randomColorProvider?.getRandomColor?.color?.hex}";
            setState(() {
              whiteColor = int.parse(colorValue);
              isGeneratingColor = false;
            });
          }
        } else {
          setState(() {
            isGeneratingColor = false;
          });
          Scaffold.of(context).showBottomSheet(
            (context) => Text(value.message),
          );
        }
      },
    );
  }
}
