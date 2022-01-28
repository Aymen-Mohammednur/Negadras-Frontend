import 'package:negadras/organization/data_providers/organization_data_provider.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizationRepository {
  final OrganizationDataProvider dataProvider;
  OrganizationRepository(this.dataProvider);

  Future<Organization> create(Organization organization) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = await prefs.getString("user_id");

    return this.dataProvider.create(userId as String, organization);
  }

  Future<Organization> update(String id, Organization organization) async {
    return this.dataProvider.update(id, organization);
  }

  Future<List<Organization>> fetchByUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = await prefs.getString("user_id");
    // print("Inside org repo");
    return this.dataProvider.fetchByUserId(userId as String);
  }

  Future<Organization> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
