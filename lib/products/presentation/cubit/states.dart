import 'package:route_flutter_task/products/data/models/ProductResponseDTO.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class GetProductsSuccessState extends ProductStates {
  ProductResponseDto response;
  GetProductsSuccessState({required this.response});
}

class GetProductsErrorState extends ProductStates {
  String errorMessage;
  GetProductsErrorState({required this.errorMessage});
}
