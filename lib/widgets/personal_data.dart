import 'package:flutter/material.dart';

class PersonalDataWidget extends StatelessWidget {
  PersonalDataWidget({super.key});

  final List<PersonalDataItem> infoData = [
    PersonalDataItem(
      icon: Icon(Icons.mail),
      title: "E-mail",
      content: "d.nalepa1337@gmail.com",
    ),
    PersonalDataItem(
      icon: Icon(Icons.phone_iphone_outlined),
      title: "Phone",
      content: "+48 793 595 139",
    ),
    PersonalDataItem(
      icon: Icon(Icons.location_city),
      title: "Location",
      content: "Kraków, Polska",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF32312f),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: Colors.white24),
      ),
      constraints: BoxConstraints(maxWidth: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/images/foto.jpg", width: 250)],
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          Text(
            "Dominik Nalepa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue.shade800,
            ),
            child: Text(
              "Front-End Developer",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),

                child: Text(
                  "Flutter (mainly)",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ),
              Text(" • "),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  "Angular",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          for (var info in infoData) ...[
            Container(margin: EdgeInsets.all(10), child: info),
          ],
        ],
      ),
    );
  }
}

class PersonalDataItem extends StatelessWidget {
  final String title;
  final String content;
  final Icon icon;

  const PersonalDataItem({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Center(child: icon),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(title.toUpperCase()), Text(content)],
        ),
      ],
    );
  }
}
