import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Affairs',
      theme: ThemeData(
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Student Affairs Services'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String urll = "https://www.bsu.edu.eg/Backend/Uploads/PDF/%D8%AE%D8%AF%D9%85%D8%A7%D8%AA%20%D8%A7%D9%84%D9%83%D8%AA%D8%B1%D9%88%D9%86%D9%8A%D9%87/%D8%AA%D9%88%D9%82%D9%8A%D8%B9%20%D8%A7%D9%84%D9%83%D8%B4%D9%81%20%D8%A7%D9%84%D8%B7%D8%A8.pdf";


  // to be applied to download a file
  Future downloadPdf()  async {

    // Map<Permission, PermissionStatus> statuses = await [
    //   Permission.storage,
    // ].request();
    //
    // if (statuses[Permission.storage]!.isGranted) {

    var pdfPath = "/storage/emulated/0/Download/";
    var dir = io.Directory(pdfPath);

    if (dir != null) {

      // check if already exists
      String filePath = '$pdfPath/file.pdf';
      File file = File(filePath);

      if (await file.exists()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("File Already Exists"),));
      }

      // else download
      else{
        String savename = "file.pdf";
        String savePath = "${dir.path}/$savename";
        //output:  /storage/emulated/0/Download/

        try {
          await Dio().download(
              urll,
              savePath,
              onReceiveProgress: (received, total) {
                if (total != -1) {
                  // print((received / total * 100).toStringAsFixed(0) + "%");
                  //you can build progressbar feature too
                }
              });
          // print("File is saved to download folder.");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("File Downloaded"),
          ));
        } on DioException catch (e) {}
        // }
      }

      // else {
      //   print("No permission to read and write.");
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("Permission Denied !"),
      //   ));
      // }
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          centerTitle: true,
          elevation: 0.0,
          leading: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              //
              color:  Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
          ) ,
        ),

        body: Center(
            child: ListView(
                children: [

                  DataTable(
                      dividerThickness: 0.0,
                      columns: [
                        DataColumn(
                            label: Text('',)
                        ),
                        DataColumn(
                            label: Text('',)
                        ),
                      ],

                      rows: [

                        DataRow(cells: [
                          DataCell(
                            Icon(Icons.download_sharp),
                            onTap: downloadPdf,

                          ),
                          DataCell(

                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'طلب عمل كشف طبي',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf
                          ),
                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'بيان حالة الطالب',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf
                          ),
                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'طلب ملف للطلاب المقبولين',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf
                          ),
                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'اثبات قيد اللطالب',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf

                          ),
                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'اعتذار عن الامتحان',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf
                          ),
                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'تأجيل تجنيد',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf
                          ),

                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'التقديم للمدينه الجامعيه',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf
                          ),
                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'طلب انهاء اقامه بالمدينه الجامعيه',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp),
                              onTap: downloadPdf
                          ),
                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'بطاقه رغبات انتساب',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ]),

                        DataRow(cells: [
                          DataCell(
                              Icon(Icons.download_sharp,),
                              onTap: downloadPdf
                          ),

                          DataCell(
                              Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        ' اقرار للطالب',
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ]
                              )
                          ),

                        ]),

                      ]
                  )
                ]
            )

        )

    );


  }
}
