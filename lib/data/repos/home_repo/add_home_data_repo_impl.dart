import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/add_home_data_remote_data_source.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

class AddHomeDataRepoImpl implements AddHomeDataRepo {
  AddHomeDataRepoImpl(this.addHomeDataRemoteDataSource);

  AddHomeDataRemoteDataSource addHomeDataRemoteDataSource;

  @override
  Future<Either<Failure, void>> addBanner({
    required HomeBannerEntity banner,
  }) async {
    try {
      final bannerModel = BannerModel.fromEntity(banner);

      await addHomeDataRemoteDataSource.addBanner(banner: bannerModel);
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage({required File imageFile}) async {
    try {
      String imagePath;

      imagePath = await addHomeDataRemoteDataSource.uploadImage(
        imageFile: imageFile,
      );
      return Right(imagePath);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addShop({required HomeShopEntity shop}) async {
    try {
      final shopModel = ShopModel.fromEntity(shop);

      await addHomeDataRemoteDataSource.addShop(shop: shopModel);
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addShopProduct({
    required AddShopProductModelForDomain addShopProductModel,
  }) async {
    try {
      await addHomeDataRemoteDataSource.addShopProduct(
        addShopProductModel: addShopProductModel.toDataModel(), // ✅ صح
      );

      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteShopProduct({
    required DeleteShopProductModelForDomain deleteShopProductModel,
  }) async {
    try {
      await addHomeDataRemoteDataSource.deleteShopProduct(
        deleteShopProductModel: deleteShopProductModel.toDataModel(), // ✅ صح
      );

      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editShopProduct({
    required EditShopProductModelForDomain editShopProductModel,
  }) async {
    try {
      await addHomeDataRemoteDataSource.editShopProduct(
        editShopProductModel: editShopProductModel.toDataModel(), // ✅ صح
      );

      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }
}
