import 'package:grocery_app/features/grocery/data/data_sources/grocery_remote_datasource.dart';
import 'package:grocery_app/features/grocery/domain/repositories/grocery_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [GroceryRepository, GroceryRemoteDatasource],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
