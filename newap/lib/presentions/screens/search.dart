// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newap/app/app_colors.dart';
import 'package:newap/data/cubit/cubit.dart';
import 'package:newap/data/cubit/state.dart';
import 'package:newap/presentions/widgets/custom_text_feild.dart';
import 'package:newap/presentions/widgets/divider.dart';
import 'package:newap/presentions/widgets/items_veiw.dart';

class Search extends StatelessWidget {
  Search({super.key});
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var searchDats = NewsCubit.getDataFromCubit(context);
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomTextField(
                      onChang: (val) {
                        searchDats.getSearchData(val);
                      },
                      controller: textController,
                      labelText: 'Search',
                      prefixIcon: Icons.search,
                    ),
                  ),
                  Expanded(
                    child: ConditionalBuilder(
                        condition: state is! SearchLoadingState,
                        builder: (context) => ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return buildItems(
                                  searchDats.searchData[index], context);
                            },
                            separatorBuilder: (context, index) {
                              return dividerItem();
                            },
                            itemCount: searchDats.searchData.length),
                        fallback: (context) => const Center(
                                child: CircularProgressIndicator(
                              color: AppColor.botomNavColor,
                            ))),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
