import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class BicryptoV3AuthUser {
  BicryptoV3AuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<BicryptoV3AuthUser> bicryptoV3AuthUserSubject =
    BehaviorSubject.seeded(BicryptoV3AuthUser(loggedIn: false));
Stream<BicryptoV3AuthUser> bicryptoV3AuthUserStream() =>
    bicryptoV3AuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
