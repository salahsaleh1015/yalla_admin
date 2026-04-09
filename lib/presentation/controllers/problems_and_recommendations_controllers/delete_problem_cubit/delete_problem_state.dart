abstract class DeleteProblemStates {}

final class DeleteProblemInitialState extends DeleteProblemStates {}

final class DeleteProblemLoadingState extends DeleteProblemStates {}

final class DeleteProblemSuccessState extends DeleteProblemStates {}

final class DeleteProblemErrorState extends DeleteProblemStates {
  final String errorMsg;

  DeleteProblemErrorState({required this.errorMsg});
}
