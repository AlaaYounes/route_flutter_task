import 'package:dartz/dartz.dart';
import 'package:route_flutter_task/products/data/data_sources/product_dataSource_impl.dart';
import 'package:route_flutter_task/products/data/models/ProductResponseDTO.dart';

abstract class ProductRepository {
  Future<Either<BaseError, ProductResponseDto>> getProducts();

}