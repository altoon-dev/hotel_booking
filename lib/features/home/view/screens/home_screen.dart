import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/home/bloc/home_feature_bloc.dart';
import 'package:hotel_booking/features/home/bloc/home_feature_state.dart';

import '../../../../repositories/home_repository/home_feature_repository.dart';
import '../../bloc/home_feature_event.dart';
import '../widgets/widgets.dart';
import 'home_screen_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeFeatureBlock(RepositoryProvider.of<HomeFeatureRepository>(context))..add(LoadHomeFeatureEvent()),
      child: BlocBuilder<HomeFeatureBlock, HomeFeatureState>(
        builder: (context, state) {
          if (state is HomeFeatureLoadingState) {
            return const HotelLoadingWidget();
          } else if (state is HomeFeatureLoadedState) {
            return HomeScreenView(roomList: state.hotelRoomList);
          } else if (state is HomeFeatureErrorState) {
            return const HotelErrorWidget();
          } else {
            return const HotelErrorWidget();
          }
        },
      ),
    );
  }
}
