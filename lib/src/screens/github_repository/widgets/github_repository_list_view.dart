import 'package:flutter/material.dart';
import 'package:github_listview/src/provider/github_repositories_provider.dart';

import 'github_repository_item_details_view.dart';

class GithubRepositoryListView extends StatelessWidget {
  final GithubRepositoriesProvider state;
  const GithubRepositoryListView({
    super.key,
    required this.state,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.githubRepo.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final item = state.githubRepo.elementAt(index);

        return ExpansionTile(
          title: Text(item?.name ?? "Name not Available"),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              state.githubRepo[index]!.owner.avatarUrl,
            ),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          tilePadding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            if (state.isLastCommitLoading) ...[
              const Text("Please wait last 3 commits are loading")
            ] else ...[
              for (int i = 0; i < 3; i++) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GithubRepositoryItemDetailsView(
                    authorName: state.listOfLastCommitsForEachRepo[index][i]!
                        .commit.author.name,
                    commitMessage: state
                        .listOfLastCommitsForEachRepo[index][i]!.commit.message,
                  ),
                )
              ]
            ]
          ],
        );
      },
    );
  }
}
