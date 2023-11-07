// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api

import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:asistenciaupeu_frontend/bloc/espec/especieanimal_bloc.dart';
// import 'package:asistenciaupeu_frontend/apis/actividad_api.dart';
//import 'package:asistenciaupeu_frontend/apis/asistencia_api.dart';
import 'package:asistenciaupeu_frontend/comp/TabItem.dart';
import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
import 'package:asistenciaupeu_frontend/repository/EspecieanimalRepository.dart';
import 'package:asistenciaupeu_frontend/theme/AppTheme.dart';
// import 'package:asistenciaupeu_frontend/bloc/actividad/actividad_bloc.dart';
// import 'package:asistenciaupeu_frontend/repository/ActividadRepository.dart';
import 'package:asistenciaupeu_frontend/ui/especieanimal/MyAppState.dart';
//import 'package:asistenciaupeu_frontend/modelo/AsistenciapaxModelo.dart';
import 'package:asistenciaupeu_frontend/ui/especieanimal/especieanimal_edit.dart';
import 'package:asistenciaupeu_frontend/ui/especieanimal/especieanimal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../help_screen.dart';

class MainEspecieanimal extends StatelessWidget {
  const MainEspecieanimal({super.key});

  @override
  Widget build(BuildContext context) {
    /*return Provider<ActividadApi>(
      create: (_) => ActividadApi.create(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeData,
        home: ActividadUI(),
      ),
    );*/
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => EspecieanimalBloc(EspecieanimalRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeDataLight,
        darkTheme: AppTheme.themeDataDark,
        home: const EspecieanimalUI(),
      ),
    );
  }
}

class EspecieanimalUI extends StatefulWidget {
  const EspecieanimalUI({super.key});

  @override
  _EspecieanimalUIState createState() => _EspecieanimalUIState();
}

class _EspecieanimalUIState extends State<EspecieanimalUI> {
  //ApiCovid apiService;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var api;
  @override
  void initState() {
    super.initState();
    //apiService = ApiCovid();
    //api=Provider.of<PredictionApi>(context, listen: false).getPrediction();
    BlocProvider.of<EspecieanimalBloc>(context).add(ListarEspecieanimalEvent());
    print("entro aqui");
  }

  final GlobalKey<AnimatedFloatingActionButtonState> key =
      GlobalKey<AnimatedFloatingActionButtonState>();

  String text = 'Especie';
  String subject = '';
  List<String> imageNames = [];
  List<String> imagePaths = [];

  Future onGoBack(dynamic value) async {
    setState(() {
      print(value);
    });
  }

  void accion() {
    setState(() {});
  }

  void accion2() {
    setState(() {
      print("Holaas");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeDataLight,
      darkTheme: AppTheme.themeDataDark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lista de Especies Bloc',
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("Si funciona");
                },
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  //final producto=new ModeloProductos();
                  //formDialog(context, producto);
                  print("Si funciona 2");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EspecieanimalForm()),
                  ).then(onGoBack);
                },
                child: const Icon(Icons.add_box_sharp),
              ),
            )
          ],
        ),
        backgroundColor: AppTheme.nearlyWhite,
        body: BlocBuilder<EspecieanimalBloc, EspecieanimalState>(
          builder: (context, state) {
            if (state is EspecieanimalLoadedState) {
              return _buildListView(context, state.especieanimalList);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        /*body: FutureBuilder<List<ActividadModelo>>(
          future: Provider.of<ActividadApi>(context, listen: true)
              .getActividad(TokenUtil.TOKEN).then((value) => value),
          builder: (BuildContext context,
              AsyncSnapshot<List<ActividadModelo>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<ActividadModelo> persona = snapshot.data!!;
              print(persona.length);
              return _buildListView(context, persona);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),*/
        bottomNavigationBar: _buildBottomTab(),
        floatingActionButton: AnimatedFloatingActionButton(
          key: key,
          fabButtons: <Widget>[
            add(),
            image(),
            inbox(),
          ],
          colorStartAnimation: AppTheme.themeData.colorScheme.inversePrimary,
          colorEndAnimation: Colors.red,
          animatedIconData: AnimatedIcons.menu_close,
        ),
      ),
    );
  }

  Widget _buildListView(
      BuildContext context, List<EspecieanimalModelo> especieanimal) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          EspecieanimalModelo especieanimalx = especieanimal[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                        title: Row(
                          children: [
                            Text(especieanimalx.especie,
                                style: Theme.of(context).textTheme.bodyMedium)
                          ],
                        ),
                        // subtitle: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children: <Widget>[
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(8),
                        //             color: AppTheme.themeData.colorScheme
                        //                 .primaryContainer),
                        //         child: Text(
                        //           personax.estado == "A"
                        //               ? "Activo"
                        //               : "Desactivo",
                        //           style: const TextStyle(
                        //               color: Colors.black, fontSize: 16),
                        //         ),
                        //       ),
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(8),
                        //             color: AppTheme.themeData.colorScheme
                        //                 .primaryContainer),
                        //         child: Text(
                        //           //personax.asistenciaxs.isEmpty? personax.evaluar:personax.asistenciaxs.first.horaReg,
                        //           personax.horai,
                        //           style: const TextStyle(
                        //               color: Colors.black, fontSize: 16),
                        //         ),
                        //       ),
                        //     ]),

                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/imagen/man-icon.png"),
                        ),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                      child: IconButton(
                                          icon: const Icon(Icons.edit),
                                          iconSize: 24,
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EspecieanimalFormEdit(
                                                          modelA:
                                                              especieanimalx)),
                                            ).then(onGoBack);
                                          })),
                                  Expanded(
                                      child: IconButton(
                                          icon: const Icon(Icons.delete),
                                          iconSize: 24,
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          //color: AppTheme.themeData.colorScheme.inversePrimary,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Mensaje de confirmacion"),
                                                    content: const Text(
                                                        "Desea Eliminar?"),
                                                    actions: [
                                                      FloatingActionButton(
                                                        child: const Text(
                                                            'CANCEL'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop('Failure');
                                                        },
                                                      ),
                                                      FloatingActionButton(
                                                          child: const Text(
                                                              'ACCEPT'),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop('Success');
                                                          })
                                                    ],
                                                  );
                                                }).then((value) {
                                              if (value.toString() ==
                                                  "Success") {
                                                print(especieanimalx.id);
                                                /*Provider.of<ActividadApi>(context,
                                                listen: false)
                                                .deleteActividad(TokenUtil.TOKEN,personax.id)
                                                .then((value) => onGoBack(value));*/
                                                //var onGoBack = onGoBack;
                                                BlocProvider.of<
                                                            EspecieanimalBloc>(
                                                        context)
                                                    .add(
                                                        DeleteEspecieanimalEvent(
                                                            especieanimalx));
                                              }
                                            });
                                          }))
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.qr_code),
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyAppQR(
                                                    modelA: especieanimalx,
                                                  )),
                                        ).then(onGoBack);
                                      },
                                    ),
                                  ),
                                  Expanded(child: Builder(
                                    builder: (BuildContext context) {
                                      return IconButton(
                                        icon: const Icon(
                                            Icons.send_and_archive_sharp),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        onPressed: () async {
                                          /*RespAsistenciapaModelo api=await Provider.of<AsistenciapaApi>(context, listen: false).getAsistenciapa(TokenUtil.TOKEN);
                                          exportAsistenciaToExcel(api.data);
                                          await Future.delayed(const Duration(seconds: 1));
                                          print("OJO:${imagePaths.isEmpty}");
                                          text="Exportando Asistencias";
                                          if(!text.isEmpty && !imagePaths.isEmpty){
                                            _onShare(context);
                                            Fluttertoast.showToast(
                                                msg: "Exporto correctamente",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.blue,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }else{
                                            Fluttertoast.showToast(
                                                msg: "Error Al compartir",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.blue,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }*/
                                        },
                                      );
                                    },
                                  ))
                                ],
                              )
                            ])),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: especieanimal.length,
      ),
    );
  }

  int selectedPosition = 0;
  final tabs = ['Home', 'Profile', 'Help', 'Settings'];

  _buildBottomTab() {
    return BottomAppBar(
      //color: AppTheme.themeData.colorScheme.primaryContainer,

      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TabItem(
            icon: Icons.menu,
            text: tabs[0],
            isSelected: selectedPosition == 0,
            onTap: () {
              setState(() {
                selectedPosition = 0;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HelpScreen();
              }));
            },
          ),
          TabItem(
            icon: Icons.person,
            text: tabs[1],
            isSelected: selectedPosition == 1,
            onTap: () {
              setState(() {
                selectedPosition = 1;
              });
            },
          ),
          TabItem(
            text: tabs[2],
            icon: Icons.help,
            isSelected: selectedPosition == 2,
            onTap: () {
              setState(() {
                selectedPosition = 2;
              });
            },
          ),
          TabItem(
            text: tabs[3],
            icon: Icons.settings,
            isSelected: selectedPosition == 3,
            onTap: () {
              setState(() {
                selectedPosition = 3;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget add() {
    return FloatingActionButton(
      onPressed: () {
        key.currentState?.closeFABs();
      },
      heroTag: const Text("Image"),
      tooltip: 'Add',
      child: const Icon(Icons.add),
    );
  }

  Widget image() {
    return const FloatingActionButton(
      onPressed: null,
      heroTag: Text("Image"),
      tooltip: 'Image',
      child: Icon(Icons.image),
    );
  }

  Widget inbox() {
    return const FloatingActionButton(
      onPressed: null,
      heroTag: Text("Inbox"),
      tooltip: 'Inbox',
      child: Icon(Icons.inbox),
    );
  }
/*
  void exportAsistenciaToExcel(List<AsistenciapaxModelo> asistencia) {
    // Crear un nuevo archivo Excel
    var excel = Excel.createExcel();
    // Crear una nueva hoja en el archivo Excel
    Sheet sheetObject = excel['Asistencia'];
    // Escribir los encabezados de columna en la primera fila
    List<String> headers = ['Código', 'Fecha', 'Activiad','Hora'];
    for (var col = 0; col < headers.length; col++) {
      CellIndex cellIndex =
      CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0);
      sheetObject.cell(cellIndex).value = headers[col];
    }

    // Escribir los datos de asistencia en las filas siguientes
    for (var row = 0; row < asistencia.length; row++) {
      AsistenciapaxModelo asistenciax = asistencia[row];
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row + 1))
          .value = asistenciax.cui;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row + 1))
          .value = asistenciax.fecha;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row + 1))
          .value = asistenciax.actividad.nombreActividad;
      sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: row + 1))
          .value = asistenciax.horaReg;
    }

    // Guardar el archivo Excel en el sistema de archivos
    saveExcel(excel, 'asistencia.xlsx');
  }

  Future<void> saveExcel(Excel excel, String fileName) async {
    try {
      var bytes = excel.encode();
      var dir = await getExternalStorageDirectory();

      if (dir != null) {
        print('Directorio de almacenamiento externo: ${dir.path}');
        var nonbreakable='${DateTime.now().toIso8601String()}-$fileName';

        var file = File('${dir.path}/$nonbreakable');

        if (!await dir.exists()) {
          await dir.create(recursive: true);
        }

        await file.writeAsBytes(bytes!); // Conversión explícita para asegurar que bytes no sea nulo

        imagePaths.add(file.path);
        imageNames.add(nonbreakable);
        print('Archivo guardado correctamente en: ${file.path}');
      } else {
        print('No se pudo obtener el directorio de almacenamiento externo');
      }
    } catch (e) {
      print('Error al guardar el archivo Excel: $e');
    }
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    if (imagePaths.isNotEmpty) {
      final files = <XFile>[];
      for (var i = 0; i < imagePaths.length; i++) {
        files.add(XFile(imagePaths[i], name: imageNames[i]));
      }
      await Share.shareXFiles(files,
          text: text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    }
  }*/
}
