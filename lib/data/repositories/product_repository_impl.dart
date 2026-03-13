import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_datasource.dart';
import '../../core/errors/failure.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Product>> getProducts() async {
    try {
      final productModels = await remoteDatasource.getProducts();
      return productModels;
    } catch (e) {
      if (e is Failure) {
        rethrow;
      }
      throw Failure('Erro desconhecido no repositório: $e');
    }
  }
}
