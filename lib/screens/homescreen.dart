import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zerobalance/constants/size_config.dart';
import 'package:zerobalance/utils/speendingSummaryCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: AutoSizeText(
              'You\'re doing\ngreat, keep it up.▲',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15,),
          const SummaryCard(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: const Text(
              'Categories',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              
              children: [
                CategoryCard(
                  title: 'Food',
                  icon: Icons.local_pizza,
                ),
                                CategoryCard(
                  title: 'Entertainment',
                  icon: Icons.local_pizza,
                ),
                                CategoryCard(
                  title: 'Shopping',
                  icon: Icons.local_pizza,
                ),
                                CategoryCard(
                  title: 'Pet',
                  icon: Icons.local_pizza,
                ),
                                CategoryCard(
                  title: 'Food',
                  icon: Icons.local_pizza,
                ),
                                CategoryCard(
                  title: 'Food',
                  icon: Icons.local_pizza,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final icon;
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            radius: 35,
            child: Icon(
              icon,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
