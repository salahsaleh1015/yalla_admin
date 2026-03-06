


import 'package:firebase_core/firebase_core.dart';

/// Base class for all failures.
abstract class Failure {
  final String message;
  Failure(this.message);
}

/// Handles Firebase exceptions and provides human-readable error messages.
class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  /// Factory constructor that creates a [FirebaseFailure]
  /// from a caught [FirebaseException].
  factory FirebaseFailure.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
    // 🔐 Authentication related errors
      case 'invalid-email':
        return FirebaseFailure('The email address is badly formatted.');
      case 'user-disabled':
        return FirebaseFailure('This user account has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('No user found for the given email.');
      case 'wrong-password':
        return FirebaseFailure('Incorrect password.');
      case 'email-already-in-use':
        return FirebaseFailure('This email is already registered.');
      case 'weak-password':
        return FirebaseFailure('The password provided is too weak.');
      case 'operation-not-allowed':
        return FirebaseFailure('This operation is not allowed.');

    // ☁️ Firestore related errors
      case 'permission-denied':
        return FirebaseFailure('You do not have permission to perform this action.');
      case 'unavailable':
        return FirebaseFailure('The Firebase service is temporarily unavailable.');
      case 'not-found':
        return FirebaseFailure('The requested document was not found.');
      case 'already-exists':
        return FirebaseFailure('The document already exists.');
      case 'cancelled':
        return FirebaseFailure('The operation was cancelled.');
      case 'deadline-exceeded':
        return FirebaseFailure('The operation took too long — please try again.');
      case 'data-loss':
        return FirebaseFailure('Data loss occurred, please try again.');

    // 📦 Storage errors
      case 'object-not-found':
        return FirebaseFailure('The requested file was not found in storage.');
      case 'bucket-not-found':
        return FirebaseFailure('The storage bucket was not found.');
      case 'project-not-found':
        return FirebaseFailure('Firebase project not found.');
      case 'quota-exceeded':
        return FirebaseFailure('Storage quota exceeded.');
      case 'unauthenticated':
        return FirebaseFailure('User is not authenticated.');

    // Default / unknown error
      default:
        return FirebaseFailure('Unexpected Firebase error: ${e.message ?? 'Please try again later.'}');
    }
  }

  /// Handles generic errors that are not [FirebaseException].
  factory FirebaseFailure.fromException(Object e) {
    if (e is FirebaseException) {
      return FirebaseFailure.fromFirebaseException(e);
    } else if (e is FormatException) {
      return FirebaseFailure('Invalid data format.');
    } else if (e is TypeError) {
      return FirebaseFailure('Data type mismatch.');
    } else {
      return FirebaseFailure('An unexpected error occurred.');
    }
  }
}


// try {
// await repo.addOrder(orderData);
// } on FirebaseFailure catch (f) {
// showToast(f.message); // e.g., using Flutter toast/snackbar
// }