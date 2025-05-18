import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardTableCharts extends StatelessWidget {
  const DashboardTableCharts({
    super.key,
    required this.data,
    required this.headers,
  });

  final List? data;
  final List<dynamic> headers;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(children: [
              Container(
                color: Colors.blueAccent.shade200,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: headers.map((innerValue) {
                    int index1 = headers.indexOf(innerValue);
                    return Container(
                        width: index1 == 0 ? 120 : 80,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            innerValue.toString(),
                            textAlign: TextAlign.start,
                          ),
                        ));
                  }).toList(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data!.map((value1) {
                  var value = value1 as List;
                  int index = data!.indexOf(value);
                  return Container(
                    color:
                        (index % 2 == 0 ? Colors.grey.shade200 : Colors.white),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: value.map((innerValue) {
                        int index1 = value.indexOf(innerValue);
                        return Container(
                            width: index1 == 0 ? 120 : 80,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                innerValue.toString(),
                                textAlign: TextAlign.start,
                              ),
                            ));
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ]),
          ),
        ));

    // child: ListView.builder(
    //     itemCount: data?.length,
    //     shrinkWrap: true,
    //     scrollDirection: Axis.vertical,
    //     itemBuilder: (_, index) {
    //       List element = data?[index] as List;
    //       return Container(
    //         color: (index % 2 == 0 ? Colors.grey.shade200 : Colors.white),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: element
    //               .map((value) => Flexible(
    //             child: Container(
    //                 child: Padding(
    //                   padding: EdgeInsets.all(5),
    //                   child: Text(
    //                     value.toString(),
    //                     textAlign: TextAlign.start,
    //                   ),
    //                 )),
    //           ))
    //               .toList(),
    //         ),
    //       );
    //     })
    //
    // );
  }
}
