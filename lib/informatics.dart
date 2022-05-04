
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_grid_button/flutter_grid_button.dart';

import 'CoffeeDataFile.dart';
import 'side_drawer.dart';

enum LegendShape { Circle, Rectangle }

class SimpleObject {
  int data1;
  int data2;

  SimpleObject(this.data1, this.data2);

  String toString() {
    return data1.toString() + " " + data2.toString();
  }
}

class GraphWidget extends StatefulWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

var data = CoffeeData.coffeeData;

class _GraphWidgetState extends State<GraphWidget> {
  static List<String> getCoffeeTypes() {
    List<String> toReturn = [];

    for (CoffeeData entry in data) {
      if (!toReturn.contains(entry.coffeeType)) toReturn.add(entry.coffeeType);
    }

    return toReturn;
  }

  static List<String> getCoffeeTimes() {
    List<String> toReturn = [];

    for (CoffeeData entry in data) {
      if (!toReturn.contains(entry.coffeeTime)) toReturn.add(entry.coffeeTime);
    }

    return toReturn;
  }

  static int getCoffeeTimeCount(String coffeeTime) {
    int count = 0;

    for (CoffeeData entry in data) {
      if (entry.coffeeTime == coffeeTime) {
        count++;
      }
    }
    return count;
  }

  static int getCoffeeTypeCount(String coffeeType) {
    int count = 0;

    for (CoffeeData entry in data) {
      if (entry.coffeeType == coffeeType) {
        count++;
      }
    }
    return count;
  }

  static List<CoffeeData> coffeeTypeSearch(
      String searchTerm, List<CoffeeData> data) {
    List<CoffeeData> toReturn = [];

    for (CoffeeData entry in data) {
      if (entry.coffeeType == searchTerm) {
        toReturn.add(entry);
      }
    }
    return toReturn; //returns list of coffeeData with coffee types from search
  }

  static List<CoffeeData> coffeeTimeSearch(
      String searchTerm, List<CoffeeData> data) {
    List<CoffeeData> toReturn = [];

    for (CoffeeData entry in data) {
      if (entry.coffeeTime == searchTerm) {
        toReturn.add(entry);
      }
    }
    return toReturn; //returns list of coffeeData with coffee types from search
  }

  static List<CoffeeData> orderCoffeeCupsPerDay(
      List<CoffeeData> data, String highToLow) {
    List<SimpleObject> sortable = []; // map is id : coffeeCupsPerDay
    List<CoffeeData> toReturn = [];

    for (CoffeeData entry in data) {
      sortable.add(SimpleObject(entry.id, entry.coffeeCupsPerDay));
    }

    Comparator<SimpleObject> com = (x, y) => x.data2.compareTo(y.data2);

    sortable.sort(com); //this list is low to high

    if (highToLow == "Sort High to Low")
      sortable = new List.from(sortable.reversed);

    for (int i = 0; i < data.length; ++i) {
      toReturn.add(data.elementAt(sortable.elementAt(i).data1));
    }

    print(toReturn);

    return toReturn; //returns list of coffeeData with coffee types from search
  }

  //cannot use sorting on already trimmed data, screws with indexing
  static List<CoffeeData> orderCodingHours(
      List<CoffeeData> data, String highToLow) {
    List<SimpleObject> sortable = []; // map is id : coffeeCupsPerDay
    List<CoffeeData> toReturn = [];

    for (CoffeeData entry in data) {
      sortable.add(SimpleObject(entry.id, entry.codingHours));
    }

    Comparator<SimpleObject> com = (x, y) => x.data2.compareTo(y.data2);

    sortable.sort(com); //this list is low to high

    if (highToLow == "Sort High to Low")
      sortable = new List.from(sortable.reversed);

    print(sortable);
    print(data.length);

    for (int i = 0; i < data.length; ++i) {
      toReturn.add(data.elementAt(sortable.elementAt(i).data1));
    }

    print(toReturn);

    return toReturn; //returns list of coffeeData with coffee types from search
  }



  static List<SimpleObject> getHistogramFrequenciesCoffeeCups(List<CoffeeData> data) {
    List<SimpleObject> objects = [];

    var domain = getHistogramDomainsCoffeeCups(data);

    int count = 0;

    for(int entry in domain) {
      for(CoffeeData dataEntry  in data) {
        if(dataEntry.coffeeCupsPerDay == entry) {
          ++count;
        }
      }
      //frequencies.add(count);
      objects.add(SimpleObject(entry, count));
      count = 0;
    }

    return objects;
  }

  static List<int> getHistogramDomainsCoffeeCups(List<CoffeeData> data) {
    List<int> ids = [];

    for(CoffeeData entry in data) {
      if(!ids.contains(entry.coffeeCupsPerDay)) {
        ids.add(entry.coffeeCupsPerDay);
      }
    }
    return ids;
  }


  static List<SimpleObject> getHistogramFrequenciesCodingHours(List<CoffeeData> data) {
    List<SimpleObject> objects = [];

    var domain = getHistogramDomainsCodingHours(data);

    int count = 0;

    for(int entry in domain) {
      for(CoffeeData dataEntry  in data) {
        if(dataEntry.codingHours == entry) {
          ++count;
        }
      }
      //frequencies.add(count);
      objects.add(SimpleObject(entry, count));
      count = 0;
    }

    return objects;
  }

  static List<int> getHistogramDomainsCodingHours(List<CoffeeData> data) {
    List<int> ids = [];

    for(CoffeeData entry in data) {
      if(!ids.contains(entry.codingHours)) {
        ids.add(entry.codingHours);
      }
    }
    return ids;
  }

  static Container graphBuilder(List<charts.Series<CoffeeData, String>> series,
      bool showLabel, String title, String leftAxis) {
    final chart;

    if (showLabel) {
      chart = charts.BarChart(
        series,
        animate: true,
        behaviors: [
          new charts.ChartTitle(title,
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.start,
              // Set a larger inner padding than the default (10) to avoid
              // rendering the text too close to the top measure axis tick label.
              // The top tick label may extend upwards into the top margin region
              // if it is located at the top of the draw area.
              innerPadding: 18),
          new charts.ChartTitle(leftAxis,
              behaviorPosition: charts.BehaviorPosition.start,
              titleOutsideJustification:
              charts.OutsideJustification.middleDrawArea),
        ],
      );
    } else {
      chart = charts.BarChart(series,
          animate: true,
          behaviors: [
            new charts.ChartTitle(title,
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.start,
                // Set a larger inner padding than the default (10) to avoid
                // rendering the text too close to the top measure axis tick label.
                // The top tick label may extend upwards into the top margin region
                // if it is located at the top of the draw area.
                innerPadding: 18),
            new charts.ChartTitle(leftAxis,
                behaviorPosition: charts.BehaviorPosition.start,
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
          ],
          domainAxis: new charts.OrdinalAxisSpec(
            // Make sure that we draw the domain axis line.
              showAxisLine: true,
              // But don't draw anything else.
              renderSpec: new charts.NoneRenderSpec()));
    }
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[Expanded(child: chart)],
          ),
        ),
      ),
    );
  }


  static Container graphBuilderHistogram(List<charts.Series<SimpleObject, String>> series,
      bool showLabel, String title, String leftAxis) {
    final chart;

    if (showLabel) {
      chart = charts.BarChart(
        series,
        animate: true,
        behaviors: [
          new charts.ChartTitle(title,
              behaviorPosition: charts.BehaviorPosition.top,
              titleOutsideJustification: charts.OutsideJustification.start,
              // Set a larger inner padding than the default (10) to avoid
              // rendering the text too close to the top measure axis tick label.
              // The top tick label may extend upwards into the top margin region
              // if it is located at the top of the draw area.
              innerPadding: 18),
          new charts.ChartTitle(leftAxis,
              behaviorPosition: charts.BehaviorPosition.start,
              titleOutsideJustification:
              charts.OutsideJustification.middleDrawArea),
        ],
      );
    } else {
      chart = charts.BarChart(series,
          animate: true,
          behaviors: [
            new charts.ChartTitle(title,
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.start,
                // Set a larger inner padding than the default (10) to avoid
                // rendering the text too close to the top measure axis tick label.
                // The top tick label may extend upwards into the top margin region
                // if it is located at the top of the draw area.
                innerPadding: 18),
            new charts.ChartTitle(leftAxis,
                behaviorPosition: charts.BehaviorPosition.start,
                titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
          ],
          domainAxis: new charts.OrdinalAxisSpec(
            // Make sure that we draw the domain axis line.
              showAxisLine: true,
              // But don't draw anything else.
              renderSpec: new charts.NoneRenderSpec()));
    }
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[Expanded(child: chart)],
          ),
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
    Container container = Container();

    return container;
  }
}

class GraphWidgetCoffeeType extends StatefulWidget {
  const GraphWidgetCoffeeType({Key? key}) : super(key: key);

  @override
  _GraphWidgetCoffeeTypeState createState() => _GraphWidgetCoffeeTypeState();
}

class _GraphWidgetCoffeeTypeState extends State<GraphWidgetCoffeeType> {
  String dropdownValue = "Americano";

  Widget build(BuildContext context) {
    var button = DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: _GraphWidgetState.getCoffeeTypes()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    Container container = Container(
      child: Column(
        children: [
          button,
          _GraphWidgetState.graphBuilder([
            charts.Series<CoffeeData, String>(
              id: "Test",
              data: _GraphWidgetState.coffeeTypeSearch(dropdownValue, data),
              domainFn: (CoffeeData series, _) => series.coffeeType,
              measureFn: (CoffeeData series, _) =>
                  _GraphWidgetState.getCoffeeTypeCount(series.coffeeType),
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
            )
          ], true, "Coffee Types", "Number of Coffee Drinkers")
        ],
      ),
    );

    return container;
  }
}

class GraphWidgetCoffeeTimes extends StatefulWidget {
  const GraphWidgetCoffeeTimes({Key? key}) : super(key: key);

  @override
  _GraphWidgetCoffeeTimesState createState() => _GraphWidgetCoffeeTimesState();
}

class _GraphWidgetCoffeeTimesState extends State<GraphWidgetCoffeeTimes> {
  String dropdownValue = "Before coding";

  Widget build(BuildContext context) {
    var button = DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: _GraphWidgetState.getCoffeeTimes()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    Container container = Container(
      child: Column(
        children: [
          button,
          _GraphWidgetState.graphBuilder([
            charts.Series<CoffeeData, String>(
              id: "Test",
              data: _GraphWidgetState.coffeeTimeSearch(dropdownValue, data),
              domainFn: (CoffeeData series, _) => series.coffeeTime,
              measureFn: (CoffeeData series, _) =>
                  _GraphWidgetState.getCoffeeTimeCount(series.coffeeTime),
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
            )
          ], true, "Coffee Times", "Number of Coffee Drinkers")
        ],
      ),
    );

    return container;
  }
}

class GraphWidgetCoffeeCups extends StatefulWidget {
  const GraphWidgetCoffeeCups({Key? key}) : super(key: key);

  @override
  _GraphWidgetCoffeeCupsState createState() => _GraphWidgetCoffeeCupsState();
}

class _GraphWidgetCoffeeCupsState extends State<GraphWidgetCoffeeCups> {
  String dropdownValue = "Sort High to Low";

  Widget build(BuildContext context) {
    var button = DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>["Sort High to Low", "Sort Low to High"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    List<SimpleObject> histData = _GraphWidgetState.getHistogramFrequenciesCoffeeCups(_GraphWidgetState.orderCoffeeCupsPerDay(data, dropdownValue));


    Container container = Container(
      child: Column(
        children: [
          button,
          _GraphWidgetState.graphBuilderHistogram([
            charts.Series<SimpleObject, String>(
              id: "Test",
              data: histData,
              domainFn: (SimpleObject object, _) => object.data1.toString(),
              measureFn: (SimpleObject object, _) => object.data2,
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
            )
          ], true, "Coding Hours", "Number of Coding Hours Per Day")
        ],
      ),
    );

    return container;
  }
}

class GraphWidgetCodingHours extends StatefulWidget {
  const GraphWidgetCodingHours({Key? key}) : super(key: key);

  @override
  _GraphWidgetCodingHoursState createState() => _GraphWidgetCodingHoursState();
}

class _GraphWidgetCodingHoursState extends State<GraphWidgetCodingHours> {
  String dropdownValue = "Sort High to Low";

  Widget build(BuildContext context) {
    var button = DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>["Sort High to Low", "Sort Low to High"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

     List<SimpleObject> histData = _GraphWidgetState.getHistogramFrequenciesCodingHours(_GraphWidgetState.orderCodingHours(data, dropdownValue));


    Container container = Container(
      child: Column(
        children: [
          button,
          _GraphWidgetState.graphBuilderHistogram([
            charts.Series<SimpleObject, String>(
              id: "Test",
              data: histData,
              domainFn: (SimpleObject object, _) => object.data1.toString(),
              measureFn: (SimpleObject object, _) => object.data2,
              colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue),
            )
          ], true, "Coding Hours", "Number of Coding Hours Per Day")
        ],
      ),
    );

    return container;
  }
}

class Informatics extends StatefulWidget {
  const Informatics({Key? key}) : super(key: key);

  @override
  _InformaticsState createState() => _InformaticsState();
}

class _InformaticsState extends State<Informatics> {
  late StatefulWidget graphWidget = GraphWidget();

  void _setGraphStateCoffeeType() {
    setState(() {
      graphWidget = GraphWidgetCoffeeType();
    });
  }

  void _setGraphStateCoffeeTimes() {
    setState(() {
      graphWidget = GraphWidgetCoffeeTimes();
    });
  }

  void _setGraphStateCoffeeCups() {
    setState(() {
      graphWidget = GraphWidgetCoffeeCups();
    });
  }

  void _setGraphStateCodingHours() {
    setState(() {
      graphWidget = GraphWidgetCodingHours();
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 26);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("Database"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 300,
                child: Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GridButton(
                      textStyle: textStyle,
                      borderColor: Colors.grey[300],
                      borderWidth: 2,
                      onPressed: (dynamic val) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(val.toString()),
                            duration: Duration(milliseconds: 400),
                          ),
                        );

                        if (val == "Coffee Types") {
                          _setGraphStateCoffeeType();
                        } else if (val == "Coffee Times") {
                          _setGraphStateCoffeeTimes();
                        } else if (val == "Coffee Cups Per Day") {
                          _setGraphStateCoffeeCups();
                        } else if (val == "Coding Hours Per Day") {
                          _setGraphStateCodingHours();
                        }
                      },
                      items: [
                        [
                          GridButtonItem(
                            title: "Coffee Types",
                            color: Colors.brown[600],
                            textStyle: textStyle.copyWith(color: Colors.white),
                          ),
                          GridButtonItem(
                            title: "Coffee Times",
                            color: Colors.brown[700],
                            textStyle: textStyle.copyWith(color: Colors.white),
                          ),
                        ],
                        [
                          GridButtonItem(
                            title: "Coffee Cups Per Day",
                            color: Colors.brown[800],
                            textStyle: textStyle.copyWith(color: Colors.white),
                          ),
                          GridButtonItem(
                            title: "Coding Hours Per Day",
                            color: Colors.brown[900],
                            textStyle: textStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
              ),
              graphWidget
            ])));
  }
}
