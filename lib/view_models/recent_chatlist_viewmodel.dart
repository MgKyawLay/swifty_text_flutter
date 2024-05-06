import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swifty_text_flutter/models/recentChant.model.dart';

class RecentChatListViewModel extends ChangeNotifier {
  List<RecentChat> _chats = [];

  List<RecentChat> get chats => _chats;

  Future<void> fetchChats() async {
    try {
      final response =
          await rootBundle.loadString('assets/mock/chat_data.json');
      final json = jsonDecode(response) as List<dynamic>;
      _chats = json.map((chat) => RecentChat.fromJson(chat)).toList();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to load chats: $e');
    }
  }
}
