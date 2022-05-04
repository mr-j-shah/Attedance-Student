import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TicketController {
  Future<Map<String, dynamic>> getTicketData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final snapShot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.email)
          .get();
      Map<String, dynamic> data = {};
      data = snapShot.data() ?? {} as Map<String, dynamic>;

      // List<Map<String, dynamic>> events = [];
      // for (final doc in eventSnapshot.docs) {
      //   events.add((UserEvent.fromDocument(doc)).toMap());
      // }

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
