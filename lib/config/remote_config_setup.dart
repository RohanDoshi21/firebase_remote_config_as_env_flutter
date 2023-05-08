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
