class Notesmodel {
  int? id;
  String? heading, notes;

  Notesmodel({this.id, required this.heading, required this.notes});

  factory Notesmodel.fromMap(Map m1) {
    return Notesmodel(
        id: m1['id'], heading: m1['heading'], notes: m1['notes']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'heading': heading,
      'notes': notes,
    };
  }
}