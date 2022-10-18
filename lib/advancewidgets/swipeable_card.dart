import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipe_controller.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class SwipeableCard extends StatefulWidget {
  const SwipeableCard({Key? key}) : super(key: key);

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard> {
  @override
  Widget build(BuildContext context) {
    //create a SwipeableCardSectionController
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Column(children: [
        SwipeableCardsSection(
          cardController: _cardController,
          context: context,
          //add the first 3 cards (widgets)
          items: [
            GestureDetector(
              onTap: () {},
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                        color: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10),
                              bottomStart: Radius.circular(10),
                              topEnd: Radius.circular(10),
                              topStart: Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            Stack(children: [
                              Image.asset('images/ic_card.png',
                                  fit: BoxFit.cover),
                              Positioned(
                                  left: 20,
                                  bottom: 140,
                                  child: Text(
                                    'Namita Singh',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Museo Sans',
                                        color: Colors.white),
                                  )),
                              Positioned(
                                  right: 20,
                                  left: 20,
                                  bottom: 60,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.white,
                                      ),
                                      Expanded(
                                          child: Text(
                                        'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Museo Sans',
                                            color: Colors.white),
                                      )),
                                    ],
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Positioned(
                                  right: 20,
                                  left: 40,
                                  bottom: 30,
                                  child: Text(
                                    'Boston, MI, USA',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Museo Sans',
                                        color: Colors.white),
                                  )),
                            ]),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        color: Colors.white),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            //set output date to TextField value.
                                          });
                                        },
                                        child: const Icon(
                                          Icons.cancel_rounded,
                                          color: Colors.red,
                                          size: 36,
                                        )),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      color: Colors.amber),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          //set output date to TextField value.
                                        });
                                      },
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
          //Get card swipe event callbacks
          onCardSwiped: (dir, index, widget) {},
          //
          enableSwipeUp: true,
          enableSwipeDown: false,
        ),
      ]), //other children
    );
  }
}
