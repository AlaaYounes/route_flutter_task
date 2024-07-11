import 'package:dartz/dartz.dart';
import 'package:route_flutter_task/core/utils/dependancy_injection.dart';
import 'package:route_flutter_task/products/data/data_sources/product_dataSource_impl.dart';
import 'package:route_flutter_task/products/data/models/ProductResponseDTO.dart';
import 'package:route_flutter_task/products/domain/repositories/product_repository.dart';

class ProductUseCases {
  final _productRepo = sl<ProductRepository>();

  Future<Either<BaseError, ProductResponseDto>> getProducts() async {
    return await _productRepo.getProducts();
  }
}
