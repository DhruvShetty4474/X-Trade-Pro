class MessageManager {
  static final MessageManager _instance = MessageManager._internal();

  factory MessageManager() {
    return _instance;
  }

  MessageManager._internal();

  // Lists to store different types of messages
  List<String> allMessages = [
    'System notification 1',
    'Error: Failed to load data',
    'System notification 2',
    'Warning: Low memory',
    'System notification 3',
  ];

  List<String> crossMessages = [
    'Error: Failed to load data',
    'Warning: Low memory',
  ];

  List<String> markedMessages = [
    'Market update: Stock prices rising',
    'Market notification: New regulations announced',
  ];
  // Method to retrieve all messages
  List<String> getAllMessages() {
    return List.unmodifiable(allMessages); // Return an immutable list
  }

  // Method to retrieve crossMessages
  List<String> getCrossMessages() {
    return List.unmodifiable(crossMessages); // Return an immutable list
  }

  // Method to retrieve markedMessages
  List<String> getMarkedMessages() {
    return List.unmodifiable(markedMessages); // Return an immutable list
  }

  // Method to add a message to allMessages
  void addMessageToAll(String message) {
    allMessages.add(message);
  }

  // Method to add a message to crossMessages
  void addMessageToCross(String message) {
    crossMessages.add(message);
  }

  // Method to add a message to markedMessages
  void addMessageToMarked(String message) {
    markedMessages.add(message);
  }

}
