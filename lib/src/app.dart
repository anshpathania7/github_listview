import 'package:flutter/material.dart';
import 'package:github_listview/src/screens/github_repository/github_repository_screen.dart';
import 'package:provider/provider.dart';

import 'provider/github_repositories_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GithubRepositoriesProvider()..init(),
        ),
      ],
      child: const MaterialApp(
        title: 'Github Demo',
        home: GithubRepositoryScreen(),
      ),
    );
  }
}
