import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config_as_env/constants/urls.dart';
import 'package:flutter/material.dart';

import 'config/remote_config_setup.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase Core setup
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Remote Config Setup
  await remoteConfig();

  print(AppUrls.backendBaseUrl);
  // Run your app after this
}
