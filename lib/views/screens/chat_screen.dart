// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<StatefulWidget> createState() => ChatScreenState();
// }

// class ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: const IconButton(
//             onPressed: null, icon: Icon(EvaIcons.menuArrowOutline)),
//         title: const Text("Messages"),
//         actions: const [
//           IconButton(
//             onPressed: null,
//             icon: Icon(EvaIcons.searchOutline),
//           )
//         ],
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(20),
//         child: Text('test'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:swifty_text_flutter/view_models/recent_chatlist_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RecentChatListViewModel>(context, listen: false).fetchChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Messages"),
        leading: const IconButton(
            onPressed: null, icon: Icon(EvaIcons.menuArrowOutline)),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(EvaIcons.searchOutline),
          )
        ],
      ),
      body: Consumer<RecentChatListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.chats.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: viewModel.chats.length,
                itemBuilder: (context, index) {
                  final chat = viewModel.chats[index];

                  return const ListTile(
                    leading: CircleAvatar(),
                  );
                });
          }
        },
      ),
    );
  }
}
