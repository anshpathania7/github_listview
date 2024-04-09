import 'package:flutter/material.dart';

class GithubRepositoryItemDetailsView extends StatelessWidget {
  final String authorName;
  final String commitMessage;

  const GithubRepositoryItemDetailsView(
      {super.key, required this.authorName, required this.commitMessage});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black54,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Commit Message :",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              commitMessage,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Author : $authorName",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
