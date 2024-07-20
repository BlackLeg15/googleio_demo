import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:firedart/firedart.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) {
  return switch (context.request.method) {
    HttpMethod.get => _getTaskList(context, id),
    HttpMethod.patch => _updateTaskList(context, id),
    HttpMethod.delete => _deleteTaskList(context, id),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _getTaskList(RequestContext context, String id) async {
  final result = await Firestore.instance
      .collection('tasklists')
      .document(
        id,
      )
      .get()
      .then((doc) {
    return doc.map;
  });
  return Response.json(body: result);
}

Future<Response> _updateTaskList(RequestContext context, String id) async {
  final body = await context.request.json() as Map<String, dynamic>;
  await Firestore.instance.collection('tasklists').document(id).update(
    {
      'name': body['name'] as String?,
    },
  );
  return Response(statusCode: HttpStatus.noContent);
}

Future<Response> _deleteTaskList(RequestContext context, String id) async {
  return Firestore.instance.collection('tasklists').document(id).delete().then(
    (result) => Response(statusCode: HttpStatus.noContent),
    onError: (e) => Response(statusCode: HttpStatus.badRequest),
  );
}
