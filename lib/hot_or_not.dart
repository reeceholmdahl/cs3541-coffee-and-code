import 'package:flutter/material.dart';

import 'constants.dart';
import 'model/temp.dart';

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
          for (final temp in TempList)
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: temp.color.shade300, width: 3),
                color: widget._notifier.value == temp
                    ? temp.color.shade300
                    : temp.color.shade50,
              ),
              child: Material(
                color: Colors.transparent,
                shape: CircleBorder(),
                child: InkWell(
                  splashColor: temp.color.shade200,
                  customBorder: CircleBorder(),
                  onTap: () {
                    setState(() {
                      widget._notifier.value = temp;
                    });
                    widget.onChanged();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(temp.iconData, size: 36),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
