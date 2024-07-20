import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _taskItems = <String>[];
  var introMessage = 'Carregando...';
  var isLoading = false;
  final dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080'));

  Future<void> getIntroMessage() async {
    setState(() => isLoading = true);
    _taskItems.clear();
    final response = await dio.get('/');
    if (response.statusCode != 200 || !mounted) {
      setState(() => isLoading = false);
      return;
    }
    introMessage = response.data as String;
    setState(() => isLoading = false);
  }

  Future<void> getTaskItems() async {
    setState(() => isLoading = true);
    _taskItems.clear();
    final response = await dio.get('/db/fbase');
    if (response.statusCode != 200 || !mounted) {
      setState(() => isLoading = false);
      return;
    }
    final data = jsonDecode(response.data) as List;
    final items = data.map((e) => e['name'] as String);
    setState(() {
      _taskItems.addAll(items);
      isLoading = false;
    });
  }

  Future<void> addMockTaskItem() async {
    setState(() => isLoading = true);
    final newItemName = "New item: ${DateTime.now()}";
    final response = await dio.post(
      '/db/fbase',
      data: {"name": newItemName},
    );
    if (response.statusCode != 200 || !mounted) {
      setState(() => isLoading = false);
      return;
    }
    setState(() {
      _taskItems..add(newItemName)..sort();
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getIntroMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(introMessage),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: getTaskItems,
                      child: const Text('Get all items'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: addMockTaskItem,
                      child: const Text('Add mock item'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'All Task Items:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _taskItems.length,
                    itemBuilder: (context, index) {
                      final item = _taskItems[index];
                      return Text(item);
                    },
                  ),
                )
              ],
            ),
    );
  }
}
