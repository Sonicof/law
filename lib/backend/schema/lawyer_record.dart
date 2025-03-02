import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LawyerRecord extends FirestoreRecord {
  LawyerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "languages" field.
  String? _languages;
  String get languages => _languages ?? '';
  bool hasLanguages() => _languages != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "maps" field.
  LatLng? _maps;
  LatLng? get maps => _maps;
  bool hasMaps() => _maps != null;

  // "practiceareas" field.
  String? _practiceareas;
  String get practiceareas => _practiceareas ?? '';
  bool hasPracticeareas() => _practiceareas != null;

  // "experience" field.
  String? _experience;
  String get experience => _experience ?? '';
  bool hasExperience() => _experience != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _languages = snapshotData['languages'] as String?;
    _location = snapshotData['location'] as String?;
    _maps = snapshotData['maps'] as LatLng?;
    _practiceareas = snapshotData['practiceareas'] as String?;
    _experience = snapshotData['experience'] as String?;
    _photo = snapshotData['photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lawyer');

  static Stream<LawyerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LawyerRecord.fromSnapshot(s));

  static Future<LawyerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LawyerRecord.fromSnapshot(s));

  static LawyerRecord fromSnapshot(DocumentSnapshot snapshot) => LawyerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LawyerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LawyerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LawyerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LawyerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLawyerRecordData({
  String? name,
  String? languages,
  String? location,
  LatLng? maps,
  String? practiceareas,
  String? experience,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'languages': languages,
      'location': location,
      'maps': maps,
      'practiceareas': practiceareas,
      'experience': experience,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class LawyerRecordDocumentEquality implements Equality<LawyerRecord> {
  const LawyerRecordDocumentEquality();

  @override
  bool equals(LawyerRecord? e1, LawyerRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.languages == e2?.languages &&
        e1?.location == e2?.location &&
        e1?.maps == e2?.maps &&
        e1?.practiceareas == e2?.practiceareas &&
        e1?.experience == e2?.experience &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(LawyerRecord? e) => const ListEquality().hash([
        e?.name,
        e?.languages,
        e?.location,
        e?.maps,
        e?.practiceareas,
        e?.experience,
        e?.photo
      ]);

  @override
  bool isValidKey(Object? o) => o is LawyerRecord;
}
