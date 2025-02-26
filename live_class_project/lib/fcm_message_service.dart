import 'package:firebase_messaging/firebase_messaging.dart';

class FcmMessageService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      sound: true
    );

    // foreground -> running
    FirebaseMessaging.onMessage.listen(_onForegroundNotificationReceive);
    // background -> running
    FirebaseMessaging.onMessageOpenedApp.listen(_onBackgroundNotificationReceive);
    // terminated -> app is not running
    FirebaseMessaging.onBackgroundMessage(onBackgroundNotification);
  }

  void _onForegroundNotificationReceive(RemoteMessage message) {
    print(message);
    print(message.notification?.title);
    print(message.notification?.body);
    print(message.data);
  }

  void _onBackgroundNotificationReceive(RemoteMessage message) {
    print(message);
  }

  Future<String?> getFcmToken() async {
    return await _firebaseMessaging.getToken();
  }

  void onTokenRefresh() {
    _firebaseMessaging.onTokenRefresh.listen((token) {
      // api send eg. /refresh-token
    });
  }
}

Future<void> onBackgroundNotification(RemoteMessage message) async {

}