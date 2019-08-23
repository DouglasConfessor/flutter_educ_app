import 'package:flutter_app/pages/circular_image.dart';
import 'package:flutter_app/pages/zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://instagram.frec10-1.fna.fbcdn.net/vp/21671f1e752a345876dc07a41c28aba6/5E144643/t51.2885-19/s150x150/68912466_874800062894876_4784484849236836352_n.jpg?_nc_ht=instagram.frec10-1.fna.fbcdn.net";

  final List<MenuItem> options = [
    MenuItem(Icons.search, 'Buscar'),
    MenuItem(Icons.person, 'Alunos'),
    MenuItem(Icons.library_books, 'Aulas'),
    MenuItem(Icons.border_color, 'Lançar Frequência'),
    MenuItem(Icons.format_list_bulleted, 'Registrar Notas'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0xff454dff),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularImage(
                    NetworkImage(imageUrl),
                  ),
                ),
                Text(
                  'Douglasa',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              children: options.map((item) {
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Configuração',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.chat,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Chat',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}