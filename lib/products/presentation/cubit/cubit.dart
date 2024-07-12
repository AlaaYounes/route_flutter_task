import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_flutter_task/core/utils/dependancy_injection.dart';
import 'package:route_flutter_task/products/domain/use_cases/product_useCases.dart';
import 'package:route_flutter_task/products/presentation/cubit/states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);
  final _useCase = sl<ProductUseCases>();
  void getProducts() async {
    emit(ProductLoadingState());
    {
      final response = await _useCase.getProducts();
      response.fold((l) {
        emit(GetProductsErrorState(errorMessage: l.errorMessage));
      }, (r) {
        if (r.products == null) {
          emit(GetProductsErrorState(errorMessage: 'No Products Found'));
        } else {
          emit(GetProductsSuccessState(response: r));
        }
      });
    }
  }
}
