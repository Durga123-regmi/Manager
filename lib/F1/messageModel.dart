import 'dart:convert';

class Chat {
  int uid;
  List participatns;
  String colorCode;
  String photoUrl;
  List bookMarkedMsg;

  Map<String, dynamic> lastMsg;

  Chat({
    this.uid,
    this.participatns,
    this.colorCode,
    this.bookMarkedMsg,
    this.photoUrl,
    this.lastMsg,
  });
  Messages message = new Messages();
  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      uid: json["id"],
      participatns: List<String>.from(json["participants"].map((x) => x)),
      colorCode: json["color"],
      bookMarkedMsg: List.from(json["bookmarkedMsgs"].map((x) => x)),
      photoUrl: json["photo"],
      lastMsg: json["lastMsg"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "participants": participatns.map((e) => e),
      "colorcode": colorCode,
      "photourl": photoUrl,
      "bookmarkedmsg": bookMarkedMsg.map((e) => e),
      "lastmsg": lastMsg
    };
  }
}

class Messages {
  final String uid;
  final String to;
  final String from;
  final String messagetype;
  final String messageStatus;
  final bool isOnline;
  final String replyTo;
  final String message;
  final Map<String, dynamic> time;

  Messages(
      {this.uid,
      this.to,
      this.from,
      this.messagetype,
      this.messageStatus,
      this.isOnline,
      this.replyTo,
      this.message,
      this.time});

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
        messageStatus: json["messageStatus"],
        isOnline: json["isOnline"],
        replyTo: json["replyTo"],
        message: json["message"],
        time: json["time"],
        messagetype: json["messageType"],
        to: json["to"],
        from: json["from"],
        uid: json["id"]);
  }
}
