import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_bts/src/services/network.dart';
import 'package:todo_bts/src/services/todo_repositories.dart';
import 'package:todo_bts/src/viewmodels/loading_notifier.dart';
import 'package:todo_bts/src/viewmodels/todo_viewmodel.dart';
import 'src/app.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      Provider<NetworkService>(create: (_) => NetworkService()),
      ChangeNotifierProxyProvider<NetworkService, TodoRepositories>(
        create: (context) => TodoRepositories(context.read<NetworkService>()),
        update: (context, networkService, todoRepositories) =>
            TodoRepositories(networkService),
      ),
      ChangeNotifierProvider(create: (_) => TodoViewmodel())
    ],
    child: const TodoBtsAPP(),
  ));
}
