import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final city = context.read<String>();
  return Response(body: 'Google I/O Extended em: $city');
}
