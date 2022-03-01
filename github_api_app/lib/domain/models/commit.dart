import 'dart:convert';

List<Commit> commitFromJson(String str) =>
    List<Commit>.from(json.decode(str).map((x) => Commit.fromJson(x)));

class Commit {
  Commit({
    required this.sha,
    required this.nodeId,
    required this.commit,
    required this.url,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.author,
    required this.committer,
    required this.parents,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json['sha'],
        nodeId: json['node_id'],
        commit: CommitClass.fromJson(json['commit']),
        url: json['url'],
        htmlUrl: json['html_url'],
        commentsUrl: json['comments_url'],
        author: CommitAuthor.fromJson(json['author']),
        committer: CommitAuthor.fromJson(json['committer']),
        parents:
            List<Parent>.from(json['parents'].map((x) => Parent.fromJson(x))),
      );

  String sha;
  String nodeId;
  CommitClass commit;
  String url;
  String htmlUrl;
  String commentsUrl;
  CommitAuthor author;
  CommitAuthor committer;
  List<Parent> parents;
}

class CommitAuthor {
  CommitAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        login: json['login'],
        id: json['id'],
        nodeId: json['node_id'],
        avatarUrl: json['avatar_url'],
        gravatarId: json['gravatar_id'],
        url: json['url'],
        htmlUrl: json['html_url'],
        followersUrl: json['followers_url'],
        followingUrl: json['following_url'],
        gistsUrl: json['gists_url'],
        starredUrl: json['starred_url'],
        subscriptionsUrl: json['subscriptions_url'],
        organizationsUrl: json['organizations_url'],
        reposUrl: json['repos_url'],
        eventsUrl: json['events_url'],
        receivedEventsUrl: json['received_events_url'],
        type: json['type'],
        siteAdmin: json['site_admin'],
      );

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;
}

class CommitClass {
  CommitClass({
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.url,
    required this.commentCount,
    required this.verification,
  });

  factory CommitClass.fromJson(Map<String, dynamic> json) => CommitClass(
        author: CommitAuthorClass.fromJson(json['author']),
        committer: CommitAuthorClass.fromJson(json['committer']),
        message: json['message'],
        tree: Tree.fromJson(json['tree']),
        url: json['url'],
        commentCount: json['comment_count'],
        verification: Verification.fromJson(json['verification']),
      );

  CommitAuthorClass author;
  CommitAuthorClass committer;
  String message;
  Tree tree;
  String url;
  int commentCount;
  Verification verification;
}

class CommitAuthorClass {
  CommitAuthorClass({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthorClass.fromJson(Map<String, dynamic> json) =>
      CommitAuthorClass(
        name: json['name'],
        email: json['email'],
        date: DateTime.parse(json['date']),
      );

  String name;
  String email;
  DateTime date;
}

class Tree {
  Tree({
    required this.sha,
    required this.url,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json['sha'],
        url: json['url'],
      );

  String sha;
  String url;
}

class Verification {
  Verification({
    required this.verified,
    required this.reason,
    this.signature,
    this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json['verified'],
        reason: json['reason'],
        signature: json['signature'],
        payload: json['payload'],
      );

  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;
}

class Parent {
  Parent({
    required this.sha,
    required this.url,
    required this.htmlUrl,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        sha: json['sha'],
        url: json['url'],
        htmlUrl: json['html_url'],
      );

  String sha;
  String url;
  String htmlUrl;
}
