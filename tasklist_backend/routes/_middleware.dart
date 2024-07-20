import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
        provider<String>(
          (_) => 'THE BEST BACKEND 2024',
        ),
      );
}
