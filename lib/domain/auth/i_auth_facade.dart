import 'package:dartz/dartz.dart';
import 'package:notes/domain/auth/auth_failure.dart';
import 'package:notes/domain/auth/value_objects.dart';

// facade is a design pattern that is used for connecting 2 or more classes
// which have weird interfaces and you cant use those interfaces in your app and facade takes them an puts them into a nice unified interface.
// Facades are on the same level as repositories
// this is just an interface which will allow us to implement application layer
// logic without any firebase auth dependencies
// the aim is to make firebase an implementation detail and
// to fulfill DDD spec where the application layer can not depend on classes from the infrastructure level
abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
