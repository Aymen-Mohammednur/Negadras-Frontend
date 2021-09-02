import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/form.dart';
import 'package:negadras/buisness/screens/widgets/label.dart';

class BusinessForm extends StatefulWidget {
  @override
  _BusinessFormState createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  String _name = "";

  String? _type;

  String? _location;

  String? _website;

  String? _phoneNumber;

  String? _email;

  String? _organization;

  bool ischecked = false;  
  late bool checkvalue;
  
  final List<String> _types = ['Restaurant', 'Hotel', 'Shop', 'Cafe', 'Other'];

  String _currentType = "Restaurant";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(name) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name"),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
        return null;
      },
      onSaved: (String? value) {
        name = value!;
      },
    );
  }

  Widget _buildType() {

    return DropdownButtonFormField(
      // hint: Text("Please choose"),

      // items: _types
      //     .map((String type) =>
      //         DropdownMenuItem<String>(value: type, child: Text(type)))
      //     .toList(),

      //   items: _types
      // .map<DropdownMenuItem<String>> ((String value)) {
      //   return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(value),
      //   );
      // }

      // .toList(),
      hint: Text("Please choose"),

      value: _currentType,

       items: _types
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

      onChanged: (String? newValue) {
        setState(() {
          _currentType = newValue!;
        });
      },

      // onSaved: (String? value) {
      //   _currentType = value!;
      // },
    );
  }

  Widget _buildWebsite() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Website"),
      keyboardType: TextInputType.url,
      onSaved: (String? value) {
        _website = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Phone Number"),
      keyboardType: TextInputType.phone,
      onSaved: (String? value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email"),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }


  Widget _buildCheckboxLocation() {
    return CheckboxListTile(   
      title: const Text('Use current location'),  
      controlAffinity: ListTileControlAffinity.leading,  
      value: ischecked,  
      onChanged:(bool? _checkvalue) {
    if (_checkvalue != null) {
      setState(() {
        ischecked = checkvalue;
      });
    }
  }
    );  
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildName(_name),
              SizedBox(height: 20),
              _buildType(),
              _buildCheckboxLocation(),
              ElevatedButton(
                onPressed: (){}, 
                child: Text('Open Maps'),
                ),
              Label(label: 'Contact Information(Optional)'),
              _buildWebsite(),
              _buildPhoneNumber(),
              _buildEmail(),
              Label(label: 'Additional Information(Optional)'),
              Row(
                children: [
                  Label(label: 'Upload Image'),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Icon(Icons.upload_rounded),
                  ),
                ],
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  
                  final form = _formKey.currentState;
                  if (form != null && form.validate()) {
                    form.save();
                    print(_name);
                  }

                },
                child: Text(
                  "Create Business",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
