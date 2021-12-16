/// TODO: Retrieve json content of nutrients at a point and display graphically
import 'package:farmers_app/apiRequests.dart';
import 'package:farmers_app/models/locationModel.dart';
import 'package:farmers_app/models/soilNutrientModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class SoilHealthTab extends StatefulWidget {



  @override
  State<SoilHealthTab> createState() => _SoilHealthTabState();
}

class _SoilHealthTabState extends State<SoilHealthTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        return FutureBuilder<Nutrients?>(
          future: APIRequests.fetchNutrients(locationProvider.latitude,locationProvider.longitude),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                print(snapshot.error.toString());
                return Column(
                  children: [
                    IconButton(onPressed: () async {
                      Nutrients? nutrients = await APIRequests.fetchNutrients(locationProvider.latitude,locationProvider.longitude);
                    }, icon: Icon(Icons.refresh)),
                    Text("There was an error fetching data"),
                  ],
                );
              } else {
                Nutrients? nutrients = snapshot.data;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Center(child: Text("Soil Nutrient Content",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)),
                  const SizedBox(height: 15,),
                  Center(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: SizedBox(
                        width: 300,
                        child: DataTable(
                          showBottomBorder: true,
                            columns: const [
                              DataColumn(label: Text("Nutrient", style: TextStyle(fontWeight: FontWeight.w500),),),
                              DataColumn(label: Text("Concentration", style: TextStyle(fontWeight: FontWeight.w500),))
                            ],
                            rows: [
                              DataRow(cells:[
                                const DataCell(Text("Nitrogen(N)"),),
                                DataCell(Text(nutrients?.nitrogen.toString() ?? "0.3"))
                              ]
                              ), DataRow(cells:[
                                const DataCell(Text("Phosphorus(P)"),),
                                DataCell(Text(nutrients?.phosphorus.toString() ?? "0.4"))
                              ]
                              ),
                              DataRow(cells:[
                                const DataCell(Text("Potassium(K)"),),
                                DataCell(Text(nutrients?.potassium.toString() ?? "0.5"))
                              ]
                              ),
                              DataRow(cells:[
                                const DataCell(Text("Organic Compound"),),
                                DataCell(Text(nutrients?.oc.toString() ?? "0.6"))
                              ]
                              ),
                            ]),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 300,
                  //   child: Table(
                  //     border: TableBorder.all(),
                  //     columnWidths: const {
                  //       0: IntrinsicColumnWidth(),
                  //       1: FlexColumnWidth(),
                  //     },
                  //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  //     children: [
                  //
                  //       TableRow(
                  //         children: [
                  //           const Padding(
                  //             padding: EdgeInsets.all(8.0),
                  //             child: Text("Nitrogen(N)"),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Text(nutrients?.nitrogen?.toString() ?? "0.3"),
                  //           ),
                  //         ]
                  //       ),
                  //       TableRow(
                  //           children: [
                  //             const Padding(
                  //               padding: EdgeInsets.all(8.0),
                  //               child: Text("Phosphorus(P)"),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Text(nutrients?.phosphorus?.toString() ?? "0.4"),
                  //             ),
                  //           ]
                  //       ),
                  //       TableRow(
                  //           children: [
                  //             const Padding(
                  //               padding: EdgeInsets.all(8.0),
                  //               child: Text("Potassium(K)"),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Text(nutrients?.potassium?.toString() ?? "0.5"),
                  //             ),
                  //           ]
                  //       ),
                  //       TableRow(
                  //           children: [
                  //             const Padding(
                  //               padding: EdgeInsets.all(8.0),
                  //               child: Text("Organic Compound"),
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Text(nutrients?.oc?.toString() ?? "0.6"),
                  //             ),
                  //           ]
                  //       )
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 300,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: charts.BarChart(
                        [
                          charts.Series(
                          data: [
                            NutrientContent('Nitrogen', nutrients?.nitrogen ?? 0.3, charts.ColorUtil.fromDartColor
                              (Colors.red)),
                            NutrientContent('Pottasium', nutrients?.potassium ?? 0.4, charts.ColorUtil.fromDartColor
                              (Colors.yellow)),
                            NutrientContent('Phosphorus',nutrients?.phosphorus ?? 0.5, charts.ColorUtil.fromDartColor
                              (Colors.blue)),
                            NutrientContent('Organic C.', nutrients?.oc ?? 0.6, charts.ColorUtil.fromDartColor
                              (Colors.green)),
                          ],
                            domainFn: (nutrientContent, _) => nutrientContent.nutrient,
                            id: 'Content',
                                measureFn: (nutrientContent, _) => nutrientContent.content,
                                colorFn: (nutrientContent, _) => nutrientContent.color,
                                labelAccessorFn: (nutrientContent, _) => nutrientContent.content.toString(),
                        )],
                      ),
                    ),
                  ),

                ],
              ),
            );
              }
          } else {
              return const Center(child: CircularProgressIndicator(),);
            }
        }
        );
      }
    );
  }
}

class NutrientContent {
  final String nutrient;
  final double content;
  final charts.Color color;

  NutrientContent(this.nutrient, this.content, charts.Color color)
      : this.color = charts.Color(
      r: color.r, g: color.g, b: color.b, a: color.a);
}



