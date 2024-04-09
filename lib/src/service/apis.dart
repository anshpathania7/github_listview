String repositoriesApi(String user) =>
    "https://api.github.com/users/$user/repos";
String lastCommitApi(String user, String author) =>
    "https://api.github.com/repos/$user/$author/commits";
