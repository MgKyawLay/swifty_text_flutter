class RecentChat {
  final int id;
  final String profile;
  final String name;
  final String lastMessage;
  final int unreadCount;

  RecentChat({
    required this.id,
    required this.profile,
    required this.name,
    required this.lastMessage,
    required this.unreadCount,
  });

  factory RecentChat.fromJson(Map<String, dynamic> json) => RecentChat(
      id: json["id"],
      profile: json["profile"],
      name: json["name"],
      lastMessage: json["lastMessage"],
      unreadCount: json["unreadCount"]);
}
