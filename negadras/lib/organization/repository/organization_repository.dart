import 'package:negadras/organization/data_providers/organization_data_provider.dart';
import 'package:negadras/organization/models/organization_model.dart';

class OrganizationRepository {
  final OrganizationDataProvider dataProvider;
  OrganizationRepository(this.dataProvider);

  Future<Organization> create(Organization organization) async {
    return this.dataProvider.create(organization);
  }

  Future<Organization> update(String id, Organization organization) async {
    return this.dataProvider.update(id, organization);
  }

  Future<List<Organization>> fetchAll() async {
    print("Inside repo");
    return this.dataProvider.fetchAll();
  }

  Future<Organization> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
