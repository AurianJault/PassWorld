import 'package:test/Classes/vault.dart';
import 'package:test/Classes/password.dart';

void main(List<String> args) {
  Vault v1 = Vault();

  Password p1 = Password(1, 'Github', 'password123');
  Password p2 = Password(69, 'Insta', 'hehe', 'instagram.com');
  Password p3 = Password(666, 'Monkey Type', 'password1234', 'monkeytype.com',
      'rearnal', 'remi.arnal2508@gmail.com', 'Ceci est une note');

  //print(p1);
  //print(p2);
  //print(p3);

  v1.addPassword(p1);
  v1.addPassword(p2);
  v1.addPassword(p3);

  print(v1.lenght());

  //p3.updateModifDate();
  //p3.setName = 'haha';

  //print(p3.getName);

  //print(v1.lenght());

  v1.removePassword(69);

  print(v1.lenght());

  v1.display();
}
