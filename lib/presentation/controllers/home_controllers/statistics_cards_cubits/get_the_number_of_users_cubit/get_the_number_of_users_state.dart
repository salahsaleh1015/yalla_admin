abstract class GetTheNumberOfUsersStates {}

final class GetTheNumberOfUsersInitialState extends GetTheNumberOfUsersStates {}
final class GetTheNumberOfUsersLoadingState extends GetTheNumberOfUsersStates {}
final class GetTheNumberOfUsersSuccessState extends GetTheNumberOfUsersStates {
  final int usersNumber;

  GetTheNumberOfUsersSuccessState({required this.usersNumber});
}
final class GetTheNumberOfUsersErrorState extends GetTheNumberOfUsersStates {
  final String errorMsg;

  GetTheNumberOfUsersErrorState({required this.errorMsg});
}