class EventModel {
  final String eventName;
  final String eventId;
  final String eventLogo;
  final String eventLocation;

  EventModel({
    required this.eventName,
    required this.eventId,
    required this.eventLogo,
    required this.eventLocation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'eventName': eventName,
      'eventId': eventId,
      'eventLogo': eventLogo,
      'eventLocation': eventLocation,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      eventName: map['eventName'] as String,
      eventId: map['eventId'] as String,
      eventLogo: map['eventLogo'] as String,
      eventLocation: map['eventLocation'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory HostModel.fromJson(String source) => HostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
