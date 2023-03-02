
import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'hooks/hook_example.dart';
import 'steps/test_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [
      WhenIAddTheCustomers(),
      CheckGivenDuplicateCode201(),
      CheckGivenDuplicateCode202(),
      ClickAddButton(),

    ]

    ..hooks = [
      HookExample(),
      // AttachScreenshotOnFailedStepHook(), // takes a screenshot of each step failure and attaches it to the world object
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  return GherkinRunner().execute(config);
}