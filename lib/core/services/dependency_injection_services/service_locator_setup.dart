import 'package:get_it/get_it.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_delivery_service.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_order_service.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_users_service.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/home_local_data_sources/home_statistics_cards_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/home_banners_and_shops_remote_data_source.dart';
import 'package:yalla_admin/data/repos/home_repo/home_banners_and_shops_repo_impl.dart' show HomeBannersAndShopsRepoImpl;
import 'package:yalla_admin/data/repos/home_repo/home_statistics_cards_repo_impl.dart';

import '../../../data/data_sources/local_data_sources/home_local_data_sources/home_banners_and_shops_local_data_source.dart';
import '../../../data/data_sources/remote_data_sources/home_remote_data_sources/home_statistics_cards_remote_data_source.dart';

final getIt = GetIt.instance;

void serviceLocatorSetup() {
  // Firebase services
  getIt.registerSingleton<FirestoreDeliveryServices>(
    FirestoreDeliveryServices(),
  );

  getIt.registerSingleton<FirestoreOrdersServices>(FirestoreOrdersServices());

  getIt.registerSingleton<FirebaseUserServices>(FirebaseUserServices());

  getIt.registerSingleton<FirestoreHomeServices>(FirestoreHomeServices());

  // repo impl
  getIt.registerSingleton<HomeStatisticsCardsRepoImpl>(
    HomeStatisticsCardsRepoImpl(
      homeStatisticsCardsLocalDataSource:
          HomeStatisticsCardsLocalDataSourceImpl(),
      homeStatisticsCardsRemoteDataSource:
          HomeStatisticsCardsRemoteDataSourceImpl(
            getIt.get<FirestoreDeliveryServices>(),
            getIt.get<FirestoreOrdersServices>(),
            getIt.get<FirebaseUserServices>(),
          ),
    ),
  );

  getIt.registerSingleton<HomeBannersAndShopsRepoImpl>(
    HomeBannersAndShopsRepoImpl(
      homeBannersAndShopsLocalDataSource: HomeBannersAndShopsLocalDataSourceImpl(

      ),
      homeBannersAndShopsRemoteDataSource: HomeBannersAndShopsRemoteDataSourceImpl(
          getIt.get<FirestoreHomeServices>()),
    ),
  );
}
