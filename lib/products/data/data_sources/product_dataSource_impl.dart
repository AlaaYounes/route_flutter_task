import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:route_flutter_task/core/utils/api_constants.dart';
import 'package:route_flutter_task/products/data/models/ProductResponseDTO.dart';
import 'package:route_flutter_task/products/domain/repositories/product_dataSource.dart';

class ProductDataSourceImpl implements ProductDataSource {
  @override
  Future<Either<BaseError, ProductResponseDto>> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      const url = ApiConstants.baseUrl + ApiConstants.productsApi;
      final finalUrl = Uri.parse(url);
      var responseBody = await http.get(finalUrl);
      var response = ProductResponseDto.fromJson(jsonDecode(responseBody.body));
      if (responseBody.statusCode == 200) {
        return Right(response);
      } else {
        return Left(BaseError(errorMessage: 'something went wrong'));
      }
    } else {
      return Left(BaseError(errorMessage: 'No Internet Connection'));
    }
  }
}

class BaseError {
  final String errorMessage;
  BaseError({required this.errorMessage});
}
