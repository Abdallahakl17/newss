import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newap/data/cubit/cubit.dart';
import 'package:newap/data/cubit/state.dart';
import 'package:newap/presentions/widgets/divider.dart';
import 'package:newap/presentions/widgets/items_veiw.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
        builder: (context, state) {
          NewsCubit newCubit = NewsCubit.getDataFromCubit(context);

          return ConditionalBuilder(
              condition: state is! BusinessLoadingState,
              builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildItems(newCubit.businessData[index],context,);
                  },
                  separatorBuilder: (context, index) {
                    return dividerItem();
                  },
                  itemCount: newCubit.businessData.length),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()));
        },
        listener: (context, state) {});
  }
}
