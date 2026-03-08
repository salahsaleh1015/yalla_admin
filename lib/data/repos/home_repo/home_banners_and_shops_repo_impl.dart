import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:yalla_admin/core/errors/failure.dart';
import 'package:yalla_admin/data/data_sources/local_data_sources/home_local_data_sources/home_banners_and_shops_local_data_source.dart';
import 'package:yalla_admin/data/data_sources/remote_data_sources/home_remote_data_sources/home_banners_and_shops_remote_data_source.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

class HomeBannersAndShopsRepoImpl implements HomeBannersAndShopsRepo {
  final HomeBannersAndShopsRemoteDataSource homeBannersAndShopsRemoteDataSource;
  final HomeBannersAndShopsLocalDataSource homeBannersAndShopsLocalDataSource;

  HomeBannersAndShopsRepoImpl({
    required this.homeBannersAndShopsRemoteDataSource,
    required this.homeBannersAndShopsLocalDataSource,
  });

  @override
  Future<Either<Failure, List<HomeBannerEntity>>> getHomeBanners() async {
    try {
      List<HomeBannerEntity> banners;
      banners = homeBannersAndShopsLocalDataSource.getHomeBanners();
      if (banners.isNotEmpty) {
        return Right(banners);
      }
      banners = await homeBannersAndShopsRemoteDataSource.getHomeBanners();
      debugPrint(" the banners from the internet");
      return Right(banners);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeShopEntity>>> getHomeShops() async {
    try {
      List<HomeShopEntity> shops;
      shops = homeBannersAndShopsLocalDataSource.getHomeShops();
      if (shops.isNotEmpty) {
        return Right(shops);
      }
      shops = await homeBannersAndShopsRemoteDataSource.getHomeShops();
      debugPrint(" the shops from the internet");
      return Right(shops);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }


}
