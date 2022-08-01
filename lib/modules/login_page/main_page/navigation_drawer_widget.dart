import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hands_on/modules/meu_perfil/meu_perfil.dart';

import '../../error_report/error_report.dart';
import '../../main_feed/main_feed.dart';
import '../../settings/settings.dart';
import '../pages/login_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  // const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'Daniel Briquez';
    final email = '22.00251-0@maua.br';
    final pfpImage = DecorationImage(
      image: AssetImage('/profile_picture.png'),
    );
    return Drawer(
        child: Material(
            color: Colors.blue,
            child: ListView(
              padding: padding,
              children: <Widget>[
                buildHeader(
                  pfp_image: pfpImage,
                  name: name,
                  email: email,
                ),
                const SizedBox(height: 48),
                buildMenuItem(
                  text: "Meu Perfil",
                  icon: Icons.account_circle_outlined,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: "Feed Principal",
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 1),
                ),
                SizedBox(height: 24),
                const Divider(color: Colors.white),
                SizedBox(height: 24),
                buildMenuItem(
                  text: 'Configurações',
                  icon: Icons.settings,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Reportar Erros',
                  icon: Icons.notifications_outlined,
                  onClicked: () => selectedItem(context, 3),
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Sair',
                  icon: Icons.assignment_return_outlined,
                  onClicked: () => selectedItem(context, 4),
                ),
              ],
            )));
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  buildHeader(
          {required DecorationImage pfp_image,
          required String name,
          required String email}) =>
      InkWell(
          child: Container(
              padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              )));
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyProfile()));
      break;
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MainFeed()));
      break;
    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Settings()));
      break;
    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ErrorReport()));
      break;
    case 4:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
      break;
  }
}
