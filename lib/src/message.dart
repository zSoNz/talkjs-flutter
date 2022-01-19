
enum MessageType { UserMessage, SystemMessage }

class Attachment {
  final String url;
  final int size;

  Attachment.fromJson(Map<String, dynamic> json)
    : url = json['url'],
    size = json['size'];
}

class SentMessage {
  /// The message ID of the message that was sent
  final String? id;

  /// The ID of the conversation that the message belongs to
  final String conversationId;

  /// Identifies the message as either a User message or System message
  final MessageType type;

  /// Contains an Array of User.id's that have read the message
  final List<String> readBy;

  /// Contains the user ID for the person that sent the message
  final String senderId; // redundant since the user is always me, but keeps it consistant

  /// Contains the message's text
  final String? text;

  /// Only given if the message contains a file. An object with the URL and filesize (in bytes) of the given file.
  final Attachment? attachment;

  /// Only given if the message contains a location. An array of two numbers which represent the longitude and latitude of this location, respectively. Only given if this message is a shared location.
  ///
  /// Example:
  /// [51.481083, -3.178306]
  final List<double>? location;

  SentMessage.fromJson(Map<String, dynamic> json)
    : id = json['id'],
    conversationId = json['conversationId'],
    type = json['type'] == 'UserMessage' ? MessageType.UserMessage : MessageType.SystemMessage,
    readBy = List<String>.from(json['readBy']),
    senderId = json['senderId'],
    text = json['text'],
    attachment = json['attachment'] != null ? Attachment.fromJson(json['attachment']) : null,
    location = json['location'] != null ? List<double>.from(json['location']) : null;
}

