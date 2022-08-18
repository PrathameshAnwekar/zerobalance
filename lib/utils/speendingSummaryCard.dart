import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:zerobalance/constants/size_config.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.7,
      width: SizeConfig.screenWidth,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color.fromARGB(254, 48, 63, 159),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text.rich(TextSpan(
                      text: 'Total Spends\n',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      children: [
                        TextSpan(
                            text: '₹12,000',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35)),
                      ])),
                ),
                Expanded(
                  child: Container(),
                ),
                Row(
                  children: [
                    Column(children: const [
                      CustomSmallCard(
                        title: 'Projected Savings',
                        icon: Icons.monetization_on_outlined,
                        amount: '2,000',
                      ),
                      CustomSmallCard(
                        title: 'High Spend cat.',
                        icon: Icons.local_pizza,
                        amount: '1,20,000',
                      ),
                    ]),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(2, 0, 2, 10),
                        height: SizeConfig.screenHeight * 0.31,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText('Card Balance',style: TextStyle(fontSize: 20)),
                                AutoSizeText('₹1,500', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                                Expanded(child: Container(),),
                                Row(
                                  children: [
                                    Expanded(child: Container(),),
                                    Container(
                                      height: 100,width: 100,
                                      child: FloatingActionButton(
                                        backgroundColor: Color.fromARGB(254, 48, 63, 159),
                                        onPressed: null,
                                        child: Text('Add ₹'),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class CustomSmallCard extends StatelessWidget {
  const CustomSmallCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
  }) : super(key: key);
  final icon;
  final title;
  final amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 0, 2, 10),
      width: SizeConfig.screenWidth * 0.45,
      height: SizeConfig.screenHeight * 0.15,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Icon(icon),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: AutoSizeText(title,maxLines: 2, style: TextStyle(fontSize: 15)),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: AutoSizeText(
                      '₹' + amount,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
