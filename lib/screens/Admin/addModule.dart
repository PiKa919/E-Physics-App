import 'package:ephysicsapp/services/moduleServices.dart';
import 'package:flutter/material.dart';

class AddModule extends StatefulWidget {
  AddModule({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AddModuleState createState() => _AddModuleState();
}

class _AddModuleState extends State<AddModule> {

  var selectedType;
  List sections = ["1", "2"];
  String selectedSection="1";

 TextEditingController moduleNameController = TextEditingController();
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();

  checkValidation()
  {
    if(_formKeyValue.currentState.validate()){
     addModule(section:selectedSection,modName:moduleNameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Add module"),
      ),
      body: Container(
        child:Form(
          key: _formKeyValue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Row(children: <Widget>[
                Flexible(
                    child: ListTile(
                  title: Text("Physics-I"),
                  leading: Radio(
                    value: sections[0],
                    groupValue: selectedSection,
                    onChanged: (value) {
                      setState(() {
                        selectedSection = value;
                      });
                    },
                  ),
                )),
                Flexible(
                  child: ListTile(
                      title: Text("Physics-II"),
                      leading: Radio(
                        value: sections[1],
                        groupValue: selectedSection,
                        onChanged: (value) {
                          setState(() {
                            selectedSection = value;
                          });
                        },
                      )),
                ),
              ]),
              TextFormField(
                controller: moduleNameController,
                validator: (value){
                  if(value.isEmpty)
                    return "Enter module name";
                  else return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter Module name",
                  fillColor: Colors.white,
                  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),

              RaisedButton(
                child: Text(
                  'Create Module',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  checkValidation();
                },
                color: Colors.blue,
              ),
          ],
        ),
      ),
      
    ));
  }
}
