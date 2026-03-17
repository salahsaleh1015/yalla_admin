

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yalla_admin/core/usecase/usecase.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_banner_entity.dart';
import 'package:yalla_admin/domain/entities/home_entities/home_shop_entity.dart';
import 'package:yalla_admin/domain/repos/home_repos/home_banners_and_shops_repo.dart';

import '../../../core/errors/failure.dart';

class UploadImageUseCase extends UseCase<String, File> {
  AddHomeDataRepo addHomeDataRepo;

  UploadImageUseCase(this.addHomeDataRepo);
  @override
  Future<Either<Failure, String>> call(File file) async {
    return await addHomeDataRepo.uploadImage(imageFile: file);
  }
}
