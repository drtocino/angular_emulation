import 'package:demo_views/demo_views.dart';

class ContactService {
  Future<List<PersonalContact>> getContacts() {
    return Future(() => [
      PersonalContact(name: 'Dilan Chuquimia', number: 60744773, email: 'dilan.chuquimia@iatec.com', status: true),
      PersonalContact(name: 'Josue Huarachi', number: 79787846, email: 'josue.huarachi@iatec.com', status: true),
      PersonalContact(name: 'Joel Bazan', number: 72237846, email: 'joel.bazan@iatec.com', status: true),
    ]);
  }
}