import 'package:get_it/get_it.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firebase_storage_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_delivery_service.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_details_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_home_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_order_service.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_problems_and_recommendations_services.dart';
import 'package:yalla_admin/core/services/firebase_firestore_services/firestore_users_service.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/delivery_management_local_data_source/fetching_deliveries_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/home_local_data_sources/home_statistics_cards_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/order_management_local_data_source/fetching_orders_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/delivery_management_remote_data_source/actions_of_deliveries_remote_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/delivery_management_remote_data_source/fetching_deliveries_remote_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/home_details_remote_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/home_remote_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/order_management_remote_data_source/fetching_orders_remote_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/problems_and_recommendations_remote_data_source/problems_and_recommendations_remote_data_source.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/actions_of_deliveries_repo.dart';
import 'package:yalla_admin/data/repos/deliveries_management_repo/fetching_deliveries_repo.dart';
import 'package:yalla_admin/data/repos/home_repo/home_details_transactions_repo_impl.dart'
    show HomeDetailsTransactionsRepoImpl;
import 'package:yalla_admin/data/repos/home_repo/home_statistics_cards_repo_impl.dart';
import 'package:yalla_admin/data/repos/home_repo/home_transactions_repo_impl.dart';
import 'package:yalla_admin/data/repos/orders_management_repo/fetch_orders_repo.dart';
import 'package:yalla_admin/data/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';

import '../../../data/data_sources/local_data_sources/home_local_data_sources/home_banners_and_shops_local_data_source.dart';
import '../../../data/data_sources/local_data_sources/problems_and_recommendations_local_data_source/problems_and_recommendations_local_data_source.dart';
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

  getIt.registerSingleton<FirestoreHomeDetailsServices>(
    FirestoreHomeDetailsServices(),
  );
  getIt.registerSingleton<FirebaseStorageServices>(FirebaseStorageServices());

  getIt.registerSingleton<FireStoreProblemsAndRecommendationsServices>(
    FireStoreProblemsAndRecommendationsServices(),
  );

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
  ///////////////////////////////////////////////////////////////////////////////////////
  getIt.registerSingleton<FetchOrdersRepoImpl>(
    FetchOrdersRepoImpl(
      FetchingOrdersRemoteDataSourceImpl(getIt.get<FirestoreOrdersServices>()),

      FetchingOrdersLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<ProblemsAndRecommendationsRepoImpl>(
    ProblemsAndRecommendationsRepoImpl(
      problemsAndRecommendationsLocalDataSource: ProblemsAndRecommendationsLocalDataSourceImpl(),
      problemsAndRecommendationsRemoteDataSource: ProblemsAndRecommendationsRemoteDataSourceImpl(
        fireStoreProblemsAndRecommendationsServices: getIt.get<FireStoreProblemsAndRecommendationsServices>()
      )
    ),
  );

  ///////////////////////////////////////////////////////////////////////////////////////
  getIt.registerSingleton<HomeTransactionsRepoImpl>(
    HomeTransactionsRepoImpl(
      homeBannersAndShopsLocalDataSource:
          HomeBannersAndShopsLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<FirestoreHomeServices>(),
        getIt.get<FirebaseStorageServices>(),
      ),
    ),
  );

  //////////////////////////////////////////////////////////////////////////////

  getIt.registerSingleton<HomeDetailsTransactionsRepoImpl>(
    HomeDetailsTransactionsRepoImpl(
      HomeDetailsRemoteDataSourceImpl(
        getIt.get<FirestoreHomeDetailsServices>(),
      ),
    ),
  );

  ///////////////////////////////////////////////////////////////////////////////////////
  getIt.registerSingleton<FetchingDeliveriesRepoImpl>(
    FetchingDeliveriesRepoImpl(
      FetchingDeliveriesRemoteDataSourceImpl(
        getIt.get<FirestoreDeliveryServices>(),
      ),
      FetchingDeliveriesLocalDataSourceImpl(),
    ),
  );

  ///////////////////////////////////////////////////////////////////////////////////////

  getIt.registerSingleton<ActionsOfDeliveriesRepoImpl>(
    ActionsOfDeliveriesRepoImpl(
      ActionsOfDeliveriesRemoteDataSourceImpl(
        getIt.get<FirestoreDeliveryServices>(),
      ),
    ),
  );
}
