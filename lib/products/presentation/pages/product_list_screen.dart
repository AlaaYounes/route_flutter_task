import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_flutter_task/core/widgets/custom_form_field.dart';
import 'package:route_flutter_task/products/presentation/cubit/cubit.dart';
import 'package:route_flutter_task/products/presentation/cubit/states.dart';
import 'package:route_flutter_task/products/presentation/widgets/product_widget.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
              ),
            ),
            backgroundColor: const Color(0xffFFFFFF),
          ),
          backgroundColor: const Color(0xffFFFFFF),
          body: BlocBuilder<ProductCubit, ProductStates>(
            builder: (BuildContext context, state) {
              if (state is GetProductsErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is GetProductsSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomFormField(
                              controller: searchController,
                              prefix: Padding(
                                padding: const EdgeInsets.all(15),
                                child: SvgPicture.asset(
                                    'assets/images/search_icon.svg'),
                              ),
                              hintText: 'what do you search for?',
                              borderSideColor: const Color(0xff004182),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset('assets/images/shopping_icon.svg'),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: .8),
                          itemCount: state.response.products!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductWidget(
                              product: state.response.products![index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
