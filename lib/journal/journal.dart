import 'dart:developer';

import 'package:coffee_and_code/constants.dart';
import 'package:coffee_and_code/model/temp.dart';
import 'package:flutter/material.dart';

import '../model/taste.dart';
import 'history_view.dart';
import 'readable_data/readable_list.dart';

class CoffeeJournal extends StatelessWidget {
  var _taste = Tastes.Null;
  var _temp = Temps.Null;
  final titleController = TextEditingController();
  final ingredientController = TextEditingController();
  final controller = TextEditingController();
  // var moodColor = Color.fromRGBO(201, 189, 182, 1);
  // var moodIcon = Icons.visibility_off_sharp;
  CoffeeJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final TasteRater tasteRater;
    tasteRater = TasteRater(onChanged: () {
      _taste = tasteRater.selectedMood();
      log(_taste.name);
    });
    late final HotOrNot tempRater;
    tempRater = HotOrNot(onChanged: () {
      _temp = tempRater.selectedTemp();
      log(_temp.name);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(12, 24, 12, 12),
          child: Card(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: titleController,
                  maxLines: 1,
                  decoration: InputDecoration.collapsed(
                    hintText: "std::cin >> coffee.name;",
                    hintStyle: TextStyle(
                        fontFamily: 'monospace', fontWeight: FontWeight.bold),
                    fillColor: Color.fromRGBO(157, 180, 165, 100),
                    filled: true,
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Card(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: ingredientController,
                  maxLines: 2,
                  decoration: InputDecoration.collapsed(
                    hintText: "coffee.ingredients = []",
                    hintStyle: TextStyle(
                        fontFamily: 'monospace', fontWeight: FontWeight.bold),
                    fillColor: Color.fromRGBO(157, 180, 165, 100),
                    filled: true,
                  ),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: controller,
                  maxLines: 7,
                  decoration: InputDecoration.collapsed(
                    hintText:
                        "coffee.description += getType() + getRating() + getTaste() + ...",
                    hintStyle: TextStyle(
                        fontFamily: 'monospace', fontWeight: FontWeight.bold),
                    fillColor: Color.fromRGBO(157, 180, 165, 100),
                    filled: true,
                  ),
                ),
              )),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('hot || iced;',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                            color: White)),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: tempRater,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("how'd it taste;",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                            color: White)),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: tasteRater,
                    ),
                  ],
                )
              ],
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: WashedRed,
                fixedSize: const Size(100, 60),
              ),
              child: Text(
                'ctrl-s',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                inputReadable(
                  _taste.iconData,
                  _taste.color,
                  controller.text,
                  titleController.text,
                  ingredientController.text,
                  _temp.iconData,
                );

                //For origional  pastJournals(controllerText: controller, color: moodColor, icon: moodIcon);
              },
            ),
            Padding(padding: EdgeInsets.only(left: 20)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Tan,
                fixedSize: const Size(220, 60),
              ),
              child: Text(
                'view > submissions',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push<void>(context,
                    MaterialPageRoute(builder: (context) => HistoryView()));
              },
            ),
          ]),
        ),
      ],
    );
  }
}

class HotOrNot extends StatefulWidget {
  // Mood selectedMood = Mood.nullMood;
  final _notifier = ValueNotifier<Temp>(Temps.Null);
  final VoidCallback onChanged;

  HotOrNot({required this.onChanged});

  Temp selectedTemp() => _notifier.value;

  @override
  State<HotOrNot> createState() => _HotOrNotState();
}

class _HotOrNotState extends State<HotOrNot> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Temps.Cold.color.shade300, width: 3),
              color: widget._notifier.value == Temps.Cold
                  ? Temps.Cold.color.shade300
                  : Temps.Cold.color.shade50,
            ),
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              child: InkWell(
                splashColor: Temps.Cold.color.shade200,
                customBorder: CircleBorder(),
                onTap: () {
                  setState(() {
                    widget._notifier.value = Temps.Cold;
                  });
                  widget.onChanged();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Temps.Cold.iconData, size: 36),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 16)),
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Temps.Hot.color.shade300, width: 3),
              color: widget._notifier.value == Temps.Hot
                  ? Temps.Hot.color.shade300
                  : Temps.Hot.color.shade50,
            ),
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              child: InkWell(
                splashColor: Temps.Hot.color.shade200,
                customBorder: CircleBorder(),
                onTap: () {
                  setState(() {
                    widget._notifier.value = Temps.Hot;
                  });
                  widget.onChanged();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Temps.Hot.iconData, size: 36),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TasteRater extends StatefulWidget {
  // Mood selectedMood = Mood.nullMood;
  final _notifier = ValueNotifier<Taste>(Tastes.Null);
  final VoidCallback onChanged;

  TasteRater({required this.onChanged});

  Taste selectedMood() => _notifier.value;

  @override
  State<TasteRater> createState() => _TasteRaterState();
}

class _TasteRaterState extends State<TasteRater> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Tastes.Bad.color, width: 3),
              color: widget._notifier.value == Tastes.Bad
                  ? Tastes.Bad.color
                  : badLighter,
            ),
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              child: InkWell(
                splashColor: badSplash,
                customBorder: CircleBorder(),
                onTap: () {
                  setState(() {
                    widget._notifier.value = Tastes.Bad;
                  });
                  widget.onChanged();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Tastes.Bad.iconData, size: 36),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Tastes.Good.color, width: 3),
              color: widget._notifier.value == Tastes.Good
                  ? Tastes.Good.color
                  : goodLighter,
            ),
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(),
              child: InkWell(
                splashColor: goodSplash,
                customBorder: CircleBorder(),
                onTap: () {
                  setState(() {
                    widget._notifier.value = Tastes.Good;
                  });
                  widget.onChanged();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Tastes.Good.iconData, size: 36),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
