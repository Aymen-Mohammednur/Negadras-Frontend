import 'package:flutter/material.dart';
import 'package:negadras/utils/bottom_nav_bar.dart';
// import 'package:negadras/buisness/screens/widgets/form.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:negadras/business/models/business.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/screens/widgets/label.dart';

class EditBusinessPage extends StatelessWidget {
  const EditBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EditForm();
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

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  Map<String, String> categories = {
    "Restaurant": "61374589554605d2f68d39f1",
    "Cafe": "6137460f4a711f786fa844c7",
    "Construction": "613746764a711f786fa844c9",
    "Bars": "613746834a711f786fa844cb",
    "Beauty Salons": "6137468a4a711f786fa844cd",
    "Technology": "613746a64a711f786fa844cf",
    "Hotels": "613746e34a711f786fa844d3",
    "Entertainment": "613746f64a711f786fa844d5",
    "Other": "613747124a711f786fa844d7",
  };

  // final BusinessRepository businessRepository;
  String probableId = "613a0e7375cc773d183d881e";
  late String _name;

  String? _category;

  String? _location;

  String? _website;

  String? _phoneNumber;

  String? _email;

  String? _organization;

  final Business passedBusiness = Business(
      id: "613a0e7375cc773d183d881e",
      name: "Hey",
      categoryId: "6137468a4a711f786fa844cd",
      location: "Test",
      website: "dfdsf",
      phoneNumber: "sdf",
      email: "fds@gamil.com",
      favorite: false);

  final Map<String, dynamic> _business = {};

  bool ischecked = false;
  late bool checkvalue;

  final List<String> _categories = [
    'Restaurant',
    'Cafe',
    'Construction',
    'Bars',
    'Beauty Salons',
    'Technology',
    'Hotels',
    'Entertainment',
    'Others'
  ];

  String _currentCategory = "Restaurant";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      initialValue: passedBusiness.name,
      decoration: InputDecoration(labelText: "Name"),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Please enter business name';
        }
        return null;
      },
      onSaved: (value) {
        setState(() {
          this._business["name"] = value;
        });
      },
    );
  }

  Widget _buildCategory() {
    return DropdownButtonFormField(
      hint: Text("Please choose"),

      value: _currentCategory,

      items: _categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

      onChanged: (newValue) {
        setState(() {
          _currentCategory = newValue.toString();
        });
      },

      onSaved: (value) {
        setState(() {
          this._business["categoryId"] = categories[_currentCategory];
        });
      },
      // onSaved: (String? value) {
      //   _currentType = value!;
      // },
    );
  }

  Widget _buildWebsite() {
    return TextFormField(
      initialValue: passedBusiness.website,
      decoration: InputDecoration(labelText: "Website"),
      keyboardType: TextInputType.url,
      onSaved: (value) {
        setState(() {
          if (value!.isNotEmpty) {
            this._business["website"] = value;
          } else {
            this._business["website"] = null;
          }
        });
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      initialValue: passedBusiness.phoneNumber,
      decoration: InputDecoration(labelText: "Phone Number"),
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        setState(() {
          if (value!.isNotEmpty) {
            this._business["phoneNumber"] = value;
          } else {
            this._business["phoneNumber"] = null;
          }
        });
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      initialValue: passedBusiness.email,
      decoration: InputDecoration(labelText: "Email"),
      validator: (value) {
        if (value!.isNotEmpty) {
          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }
      },
      onSaved: (value) {
        setState(() {
          if (value!.isNotEmpty) {
            this._business["email"] = value;
          } else {
            this._business["email"] = null;
          }
        });
      },
    );
  }

  Widget _buildLocation() {
    // return CheckboxListTile(
    //     title: const Text('Use current location'),
    //     controlAffinity: ListTileControlAffinity.leading,
    //     value: ischecked,
    //     onChanged: (bool? _checkvalue) {
    //       if (_checkvalue != null) {
    //         setState(() {
    //           ischecked = checkvalue;
    //         });
    //       }
    //     });
    return TextFormField(
      initialValue: passedBusiness.location,
      decoration: InputDecoration(labelText: "Location"),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Location is required';
        }
      },
      onSaved: (value) {
        setState(() {
          this._business["location"] = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Business"),
      ),
      bottomNavigationBar: bottomNav(context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                SizedBox(height: 20),
                _buildCategory(),
                _buildLocation(),
                SizedBox(height: 20),
                Label(
                  label: 'Additional Information(Optional)',
                  fontWeight: FontWeight.bold,
                ),
                _buildWebsite(),
                _buildPhoneNumber(),
                _buildEmail(),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      print(_business);
                      final BusinessEvent event = UpdateBusiness(
                        Business(
                          id: "613a0e7375cc773d183d881e",
                          name: this._business["name"],
                          location: this._business["location"],
                          categoryId: this._business["categoryId"],
                          website: this._business["website"],
                          phoneNumber: this._business["phoneNumber"],
                          email: this._business["email"],
                        ),
                      );
                      businessBloc.add(event);
                      // print(event);
                      // context.router.popAndPush(HomeRoute());
                    }
                  },
                  child: Text(
                    "Edit Business",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.pop();
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
      ),
    );
  }
}
