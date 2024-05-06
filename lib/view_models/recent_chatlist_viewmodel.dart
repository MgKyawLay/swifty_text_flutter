import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swifty_text_flutter/models/recentChant.model.dart';

class RecentChatListViewModel extends ChangeNotifier {
  List<RecentChat> _recentChatPersons = [];
  List<RecentChat> get recentChatPersons => _recentChatPersons;

  Future<void> fetchRecentChats() async {
    try {
      final response = await rootBundle.loadString('lib/mock/chat_data.json');
      final json = jsonDecode(response) as List<dynamic>;
      _recentChatPersons =
          json.map((item) => RecentChat.fromJson(item)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error loading recent chat : $e');
      }
    }
  }
}
