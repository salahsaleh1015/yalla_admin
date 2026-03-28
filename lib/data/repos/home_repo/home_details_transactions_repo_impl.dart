import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/home_details_remote_data_source.dart';
import 'package:yalla_admin/data/models/add_home_data_models.dart';
import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/edit_shop_image_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

class HomeDetailsTransactionsRepoImpl implements HomeDetailsTransactionsRepo {
  HomeDetailsTransactionsRepoImpl(this.homeDetailsRemoteDataSource);

  HomeDetailsRemoteDataSource homeDetailsRemoteDataSource;

  @override
  Future<Either<Failure, List<HomeShopProductEntity>>> fetchProducts({
    required String shopId,
  }) async {
    try {
      List<HomeShopProductEntity> products;
      products = await homeDetailsRemoteDataSource.getShopProducts(
        shopId: shopId,
      );
      debugPrint(" the shops from the internet");
      return Right(products);
    } catch (e) {
      if (e is FirebaseException) {
        debugPrint("الكلام علي ايه ");
        debugPrint(e.toString());
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      debugPrint("الكلام علي ايه ");
      debugPrint(e.toString());
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addProduct({
    required AddShopProductModelForDomain addShopProductModel,
  }) async {
    try {
      await homeDetailsRemoteDataSource.addProduct(
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
  Future<Either<Failure, void>> deleteProduct({
    required DeleteShopProductModelForDomain deleteShopProductModel,
  }) async {
    try {
      await homeDetailsRemoteDataSource.deleteProduct(
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
  Future<Either<Failure, void>> editProduct({
    required EditShopProductModelForDomain editShopProductModel,
  }) async {
    try {
      await homeDetailsRemoteDataSource.editProduct(
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

  @override
  Future<Either<Failure, void>> editShopInfo({
    required EditShopInfoModelForDomain editShopInfoModel,
  }) async {
    try {
      await homeDetailsRemoteDataSource.editShopInfo(
        newShopInfo: editShopInfoModel.toDataModel(), // ✅ صح
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
  Future<Either<Failure, void>> deleteShop({
    required DeleteShopModelForDomain deleteShopMadel,
  }) async {
    try {
      await homeDetailsRemoteDataSource.deleteShop(
        deleteShopModel: deleteShopMadel.toDataModel(), // ✅ صح
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
