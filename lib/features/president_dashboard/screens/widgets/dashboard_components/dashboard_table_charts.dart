import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardTableCharts extends StatelessWidget {
  const DashboardTableCharts({
    super.key,
    required this.data,
  });

  final List? data;

  @override
  Widget build(BuildContext context) {
    return Container(
    //     child: SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: data!.map((value1) {
    //       var value = value1 as List;
    //       return Container(
    //         color: (data!.indexOf(value) % 2 == 0
    //             ? Colors.grey.shade200
    //             : Colors.white),
    //         child: Row(
    //           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: value
    //               .map((value) => Container(
    //                       child: Padding(
    //                     padding: EdgeInsets.all(5),
    //                     child: Text(
    //                       value.toString(),
    //                       textAlign: TextAlign.start,
    //                     ),
    //                   )))
    //               .toList(),
    //         ),
    //       );
    //     }).toList(),
    //   ),
    // )

        child: ListView.builder(
            itemCount: data?.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              List element = data?[index] as List;
              return Container(
                color: (index % 2 == 0 ? Colors.grey.shade200 : Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: element
                      .map((value) => Flexible(
                    child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            value.toString(),
                            textAlign: TextAlign.start,
                          ),
                        )),
                  ))
                      .toList(),
                ),
              );
            })

        );
  }
}
