import 'package:flutter/material.dart';
import 'package:github_listview/src/provider/github_repositories_provider.dart';
import 'package:github_listview/src/screens/github_repository/widgets/github_repository_list_view.dart';
import 'package:provider/provider.dart';

class GithubRepositoryScreen extends StatelessWidget {
  const GithubRepositoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Repositories"),
      ),
      body: Consumer<GithubRepositoriesProvider>(
        builder: (context, state, child) => state.isRepositoryLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Repositories are being loaded",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 12),
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black87,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Tap on Each Repository to Check its last 3 commit details",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Flexible(
                      child: GithubRepositoryListView(state: state),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
