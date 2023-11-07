import 'package:asistenciaupeu_frontend/bloc/espec/especieanimal_bloc.dart';
import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EspecieanimalFormEdit extends StatefulWidget {
  EspecieanimalModelo modelA;

  EspecieanimalFormEdit({required this.modelA}) : super();

  @override
  _EspecieanimalFormEditState createState() =>
      _EspecieanimalFormEditState(modelA: modelA);
}

class _EspecieanimalFormEditState extends State<EspecieanimalFormEdit> {
  EspecieanimalModelo modelA;
  _EspecieanimalFormEditState({required this.modelA}) : super();

  // late int _periodoId = 0;
  late String _especie = "";

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );

  void capturaEspecie(valor) {
    _especie = valor;
  }

  @override
  Widget build(BuildContext context) {
    // getCurrentLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Especies B"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(24),
              //color: AppTheme.nearlyWhite,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildDatoCadena(capturaEspecie, modelA.especie,
                        "Nombre de la especie:"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                _formKey.currentState!.save();
                                EspecieanimalModelo mp =
                                    EspecieanimalModelo.unlaunched();
                                mp.especie = _especie;
                                // mp.fecha = DateFormat('yyyy-MM-dd')
                                //     .format(DateTime.parse(_fecha.value.text));
                                // mp.horai = _horai.value.text;
                                // mp.minToler = _minToler.value.text;
                                // mp.latitud =
                                //     currentPosition!.latitude.toString();
                                // mp.longitud =
                                //     currentPosition!.longitude.toString();
                                // mp.estado = _estado;
                                // mp.evaluar = _evaluar;
                                // final prefs =
                                //     await SharedPreferences.getInstance();
                                // mp.userCreate =
                                //     "${prefs.getString('usernameLogin')}";
                                // mp.asistenciaxs = [];
                                // mp.mater = _materiales;
                                // mp.validInsc = _validarInsc;
                                // mp.asisSubact = _asisSubAct;
                                // mp.entsal = _entSal;
                                // mp.offlinex = _offlienex;
                                mp.id = modelA.id;

                                print("E:${_especie}");

                                /*var api = await Provider.of<ActividadApi>(
                                    context,
                                    listen: false)
                                    .updateActividad(TokenUtil.TOKEN,modelA.id.toInt(), mp);
                                print("ver: ${api.toJson()}");
                                if (api.toJson()!=null) {
                                  Navigator.pop(context, () {
                                    setState(() {});
                                  });
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
                                }*/
                                BlocProvider.of<EspecieanimalBloc>(context)
                                    .add(UpdateEspecieanimalEvent(mp));
                                Navigator.pop(context, () {
                                  //setState(() {});
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'No estan bien los datos de los campos!'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Guardar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

  Widget buildDatoEntero(Function obtValor, String dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: dato,
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Id es campo Requerido';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(int.parse(value!));
      },
    );
  }

  Widget _buildDatoCadena(Function obtValor, String dato, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: dato,
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Especie Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }
}
