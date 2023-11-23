import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? docId;
  final String systolic;
  final String diastolic;
  final String description;
  final String dateTask;
  final String timeTask;

  TodoModel({
    this.docId,
    required this.systolic,
    required this.diastolic,
    required this.description,
    required this.dateTask,
    required this.timeTask,
  });

  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'systolic': systolic,
      'diastolic': diastolic,
      'description': description,
      'dateTask': dateTask,
      'timeTask': timeTask,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      docId: map['docId'] as String?,
      systolic: map['systolic'] as String,
      diastolic: map['diastolic'] as String,
      description: map['description'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel(
      docId: doc.id,
      systolic: doc['systolic'],
      diastolic: doc['diastolic'],
      description: doc['description'],
      dateTask: doc['dateTask'],
      timeTask: doc['timeTask'],
    );
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';

// class TodoModel {
//   String? docId;
//   final String systolic;
//   final String diastolic;
//   final String description;
//   final String dateTask;
//   final String timeTask;
//   TodoModel({
//     this.docId,
//     required this.systolic,
//     required this.diastolic,
//     required this.description,
//     required this.dateTask,
//     required this.timeTask,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'docId': docId,
//       'systolic': systolic,
//       'diastolic': diastolic,
//       'description': description,
//       'dateTask': dateTask,
//       'timeTask': timeTask,
//     };
//   }

//   factory TodoModel.fromMap(Map<String, dynamic> map) {
//     return TodoModel(
//       docId: map['docId'] != null ? map['docId'] as String : null,
//       systolic: map['systolic'] as String,
//       diastolic: map['diastolic'] as String,
//       description: map['description'] as String,
//       dateTask: map['dateTask'] as String,
//       timeTask: map['timeTask'] as String,
//     );
//   }

//   factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
//     return TodoModel(
//         docId: doc.id,
//         systolic: doc['systolicTitle'],
//         diastolic: doc['diastolicTitle'],
//         description: doc['description'],
//         dateTask: doc['dateTask'],
//         timeTask: doc['timeTask']);
//   }
// }
