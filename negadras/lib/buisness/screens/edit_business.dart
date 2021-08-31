import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Business Edit",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // BusinessPhoto(),
            DropBusiness(),
            EditForm(),
          ],
        ),
      ),
    );
  }
}

class BusinessPhoto extends StatelessWidget {
  const BusinessPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropBusiness extends StatelessWidget {
  const DropBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Organization Name"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    iconSize: 50,
                  ),
                  Text("Drop Business"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bar_chart),
                    iconSize: 50,
                  ),
                  Text("Statistics"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.reviews),
                    iconSize: 50,
                  ),
                  Text("Reviews"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  late String name;

  late String type;

  late String location;

  late String website;

  late String phoneNumber;

  late String email;

  late String organization;

  final List<String> _types = ['Restaurant', 'Hotel', 'Shop', 'Cafe', 'Other'];

  String _currentType = "Restaurant";

  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name"),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (String? value) {
        name = value!;
      },
    );
  }

  Widget _buildType() {
    // return TextFormField(
    //   decoration: InputDecoration(labelText: "Type"),
    //   // validator: (String? value) {
    //   //   if (value!.isEmpty) {
    //   //     return 'Password is required';
    //   //   }
    //   // },
    //   // validator: (val) => val!.isEmpty ? 'Type is required' : null,
    //   onSaved: (String? value) {
    //     type = value!;
    //   },
    // );

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

  Widget _buildLocation() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Location"),
      onSaved: (String? value) {
        location = value!;
      },
    );
  }

  Widget _buildWebsite() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Website"),
      keyboardType: TextInputType.url,
      onSaved: (String? value) {
        website = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Phone Number"),
      keyboardType: TextInputType.phone,
      onSaved: (String? value) {
        phoneNumber = value!;
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
        email = value!;
      },
    );
  }

  Widget _buildOrganization() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Organization"),
      onSaved: (String? value) {
        organization = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildName(),
            SizedBox(height: 20),
            _buildType(),
            // _buildLocation(),
            // _buildWebsite(),
            // _buildPhoneNumber(),
            // _buildEmail(),
            // _buildOrganization(),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                _formKey.currentState!.save();

                print(name);
                // print(type);
                // print(location);
                // print(website);
                // print(phoneNumber);
                // print(email);
              },
              child: Text(
                "Update",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
