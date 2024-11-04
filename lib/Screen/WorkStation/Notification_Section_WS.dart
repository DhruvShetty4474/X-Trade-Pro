import 'package:flutter/material.dart';

import '../../config/Buttons/Buttons.dart';
import '../../config/List data/List_Data.dart';

class NotificationSectionWs extends StatefulWidget {
  const NotificationSectionWs({super.key});

  @override
  State<NotificationSectionWs> createState() => _NotificationSectionWsState();
}

class _NotificationSectionWsState extends State<NotificationSectionWs> {
  bool _hide = true;

  List<String> _currentMessages = ['No messages to display'];

  void _updateMessages(List<String> messages) {
    setState(() {
      _currentMessages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final messageManager = MessageManager();

    return Container(
      color: Colors.grey[200],
      width: screenWidth,
      child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Colors.grey[200],
      height: _hide ? 150 : 40,
      child: Column(
        children: [
          Container(
            color: Colors.grey[800],
            child: Row(
              children: [
                const SizedBox(width: 20),
                // All Messages Button
                Notification_All_Message_BTW(
                  onTap: () {
                    _updateMessages(messageManager.getAllMessages());
                  },
                ),
                const SizedBox(width: 8),
                // Cross Messages Button
                Notification_Cross_Message_BTW(
                  onTap: () {
                    _updateMessages(messageManager.getCrossMessages());
                  },
                ),
                const SizedBox(width: 8),
                // Marked Messages Button (rename as needed)
                Notification_Marked_Message_BTW(
                  onTap: () {
                    _updateMessages(messageManager.getMarkedMessages());
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    _hide ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _hide = !_hide;
                    });
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
            height: 0,
          ),
          if (_hide)
            Expanded(  // <-- Wrap the ListView with Expanded to prevent overflow
              child: Container(
                color: Colors.grey[200],
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: ListView.builder(
                    itemCount: _currentMessages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          _currentMessages[index],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),)
    );
  }
}
