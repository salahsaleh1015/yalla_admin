



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:yalla_admin/core/errors/failure.dart';

import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/problem_entity.dart';

import 'package:yalla_admin/domain/entities/problems_and_recommendations_entites/recommendation_entity.dart';

import '../../../domain/repos/problems_and_recommendations_repo/problems_and_recommendations_repo.dart';
import '../../data_sources/local_data_sources/problems_and_recommendations_local_data_source/problems_and_recommendations_local_data_source.dart';
import '../../data_sources/remote_data_sources/problems_and_recommendations_remote_data_source/problems_and_recommendations_remote_data_source.dart';

class ProblemsAndRecommendationsRepoImpl implements ProblemsAndRecommendationsRepo{

 final ProblemsAndRecommendationsRemoteDataSource problemsAndRecommendationsRemoteDataSource;
 final ProblemsAndRecommendationsLocalDataSource problemsAndRecommendationsLocalDataSource;

  ProblemsAndRecommendationsRepoImpl({required this.problemsAndRecommendationsRemoteDataSource, required this.problemsAndRecommendationsLocalDataSource});

  @override
  Future<Either<Failure, void>> deleteProblem({required String problemId}) async{
    try {
      await problemsAndRecommendationsRemoteDataSource.deleteProblem(
        problemId: problemId,
      );
      return const Right(null);
    } catch (e) {
      print('///////////////////////////');
      print(e.toString());
      if (e is FirebaseException) {
        debugPrint("في ايه");
        debugPrint(e.toString());
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      debugPrint("في ايه");
      debugPrint(e.toString());
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRecommendation({required String recommendationId}) async{
    try {
      await problemsAndRecommendationsRemoteDataSource.deleteRecommendation(
        recommendationId: recommendationId,
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
  Future<Either<Failure, List<ProblemEntity>>> fetchAllProblems() async{
    try {
      List<ProblemEntity> problems;
      problems = problemsAndRecommendationsLocalDataSource.fetchAllProblems();
      if (problems.isNotEmpty) {
        return Right(problems);
      }
      problems = await problemsAndRecommendationsRemoteDataSource.fetchAllProblems();
      debugPrint(" the problems from the internet");
      return Right(problems);
    } catch (e) {
      if (e is FirebaseException) {
        debugPrint("في ايه");
        debugPrint(e.toString());
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      debugPrint("في ايه");
      debugPrint(e.toString());
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> fetchAllRecommendations() async{
    try {
      List<RecommendationEntity> recommendations;
      recommendations = problemsAndRecommendationsLocalDataSource.fetchAllRecommendations();
      if (recommendations.isNotEmpty) {
        return Right(recommendations);
      }
      recommendations = await problemsAndRecommendationsRemoteDataSource.fetchAllRecommendations();
      debugPrint(" the problems from the internet");
      return Right(recommendations);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(FirebaseFailure.fromFirebaseException(e));
      }
      return Left(FirebaseFailure.fromException(e.toString()));
    }
  }

}