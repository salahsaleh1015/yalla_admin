import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/home_local_data_sources/home_banners_and_shops_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/home_remote_data_source.dart';
import 'package:yalla_admin/data/models/banner_model.dart';
import 'package:yalla_admin/data/models/shop_model.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

class HomeTransactionsRepoImpl implements HomeTransactionsRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeBannersAndShopsLocalDataSource homeBannersAndShopsLocalDataSource;

  HomeTransactionsRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeBannersAndShopsLocalDataSource,
  });

  @override
  Future<Either<Failure, List<HomeBannerEntity>>> fetchHomeBanners() async {
    try {
      List<HomeBannerEntity> banners;
      banners = homeBannersAndShopsLocalDataSource.getHomeBanners();
      if (banners.isNotEmpty) {
        return Right(banners);
      }
      banners = await homeRemoteDataSource.getHomeBanners();
      debugPrint(" the banners from the internet");
      return Right(banners);
    } catch (e) {
      if (e is FirebaseException) {
        debugPrint("ايه الكلام ");

        debugPrint(e.message);
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      debugPrint("2 ايه الكلام ");

      debugPrint(e.toString());
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeShopEntity>>> fetchHomeShops() async {
    try {
      List<HomeShopEntity> shops;
      shops = homeBannersAndShopsLocalDataSource.getHomeShops();
      if (shops.isNotEmpty) {
        return Right(shops);
      }
      shops = await homeRemoteDataSource.getHomeShops();
      debugPrint(" the shops from the internet");
      return Right(shops);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }



  @override
  Future<Either<Failure, void>> addBanner({
    required HomeBannerEntity banner,
  }) async {
    try {
      final bannerModel = BannerModel.fromEntity(banner);

      await homeRemoteDataSource.addBanner(banner: bannerModel);
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
  Future<Either<Failure, void>> addShop({required HomeShopEntity shop}) async {
    try {
      final shopModel = ShopModel.fromEntity(shop);

      await homeRemoteDataSource.addShop(shop: shopModel);
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

      imagePath = await homeRemoteDataSource.uploadImage(
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

}
