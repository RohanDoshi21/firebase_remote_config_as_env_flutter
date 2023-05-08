## Use Firebase Remote Config as your production environment config

1. Create a new Firebase project using [flutterfire configure](https://firebase.google.com/docs/flutter/setup?platform=android) command
```bash
    flutterfire configure
```

2. Create new parameter in [Firebase Remote Config](https://console.firebase.google.com/)

3. Configure [Flutter_Local_Notifications](https://pub.dev/packages/flutter_local_notifications) for Android and IOS
```EG
    BACKEND_URL = https://test.backend.com
```

4. Add [firebase_remote_config](https://pub.dev/packages/firebase_remote_config) to your pubspec.yaml
```yaml
    dependencies:
        firebase_core: ^2.11.0
        firebase_remote_config: ^4.1.0
```

5. Add Following to your `main.dart`
```dart
    import 'package:firebase_core/firebase_core.dart';
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

        // Run your app after this
    }
```

6. `remoteConfig()` setup
```dart
    import 'package:firebase_remote_config/firebase_remote_config.dart';
    import 'package:firebase_remote_config_as_env/constants/urls.dart';

    Future<void> remoteConfig() async {
        final remoteConfig = FirebaseRemoteConfig.instance;
        await remoteConfig.setConfigSettings(RemoteConfigSettings(
            fetchTimeout: const Duration(minutes: 1),
            minimumFetchInterval: const Duration(hours: 1),
        ));
        await remoteConfig.fetchAndActivate();

        // GET CONFIGS HERE
        AppUrls.backendBaseUrl = remoteConfig.getString('BACKEND_URL');
        print(AppUrls.backendBaseUrl);
        // BACKEND_URL is the parameter we have used in Firebase Remote Config

        return;
    }
```

Medium Article: [https://medium.com/@rohan.doshi02/using-firebase-remote-config-as-production-environment-config-in-flutter-app-e6cf60714278](https://medium.com/@rohan.doshi02/using-firebase-remote-config-as-production-environment-config-in-flutter-app-e6cf60714278)

