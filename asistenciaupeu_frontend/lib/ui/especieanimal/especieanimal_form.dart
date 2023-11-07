import 'package:asistenciaupeu_frontend/bloc/espec/especieanimal_bloc.dart';
import 'package:asistenciaupeu_frontend/modelo/EspecieanimalModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EspecieanimalForm extends StatefulWidget {
  @override
  _EspecieanimalFormState createState() => _EspecieanimalFormState();
}

class _EspecieanimalFormState extends State<EspecieanimalForm> {
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
    this._especie = valor;
  }

  @override
  Widget build(BuildContext context) {
    // getCurrentLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Reg. Especie B"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(24),
              //color: AppTheme.nearlyWhite,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildDatoCadena(capturaEspecie, "Nombre Especie:"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Cancelar')),
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
                                    new EspecieanimalModelo.unlaunched();
                                mp.especie = _especie;

                                print(mp.especie);

                                BlocProvider.of<EspecieanimalBloc>(context)
                                    .add(CreateEspecieanimalEvent(mp));
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

  Widget _buildDatoEntero(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
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

  Widget _buildDatoCadena(Function obtValor, String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Nombre Requerido!';
        }
        return null;
      },
      onSaved: (String? value) {
        obtValor(value!);
      },
    );
  }
}
