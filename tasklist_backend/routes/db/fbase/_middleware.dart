import 'package:dart_frog/dart_frog.dart';
import 'package:firedart/firestore/firestore.dart';

Handler middleware(Handler handler) {
  return (context) async {
    if (!Firestore.initialized) {
      Firestore.initialize('tasklist-dartfrog-a39af');
    }

    final response = await handler(context);
    return response;
  };
}
