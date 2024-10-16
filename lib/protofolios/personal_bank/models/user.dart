import 'package:flutter/material.dart';

class User {
  final String name;
  final String username;
  final String password;
  final DateTime birthday;
  final String presentAddress;
  final String permanentAddress;
  final String city;
  final int postalCode;
  final String country;
  final ImageProvider avatar;
  final String email;

  User({
    required this.avatar,
    required this.birthday,
    required this.city,
    required this.country,
    required this.email,
    required this.name,
    required this.password,
    required this.permanentAddress,
    required this.postalCode,
    required this.presentAddress,
    required this.username,
  });

  copyWith({
    String? newName,
    String? newUsername,
    String? newPassword,
    String? newEmail,
    DateTime? newBirthday,
    String? newPresentAddress,
    String? newPermanentAddress,
    String? newCity,
    int? newPostalCode,
    String? newCountry,
    ImageProvider? newAvatar,
  }) {
    return User(
      avatar: newAvatar ?? avatar,
      birthday: newBirthday ?? birthday,
      email: newEmail ?? email,
      city: newCity ?? city,
      country: newCountry ?? country,
      name: newName ?? name,
      password: newPassword ?? password,
      permanentAddress: newPermanentAddress ?? permanentAddress,
      postalCode: newPostalCode ?? postalCode,
      presentAddress: newPresentAddress ?? presentAddress,
      username: newUsername ?? username,
    );
  }
}

class UserProfileState {
  final User profData;
  final User? tempProfData;
  final bool isLoading;
  final String? error;

  UserProfileState({
    required this.profData,
    this.tempProfData,
    this.error,
    required this.isLoading,
  });

  copyWith({
    User? newProfData,
    User? newTempProfData,
    bool? newIsLoading,
    String? newError,
  }) {
    return UserProfileState(
      profData: newProfData ?? profData,
      tempProfData: newTempProfData ?? tempProfData,
      isLoading: newIsLoading ?? isLoading,
      error: newError ?? error,
    );
  }
}

mixin UserProfileStateHolder {
  User? userData;

  updateUserData(User newUserData) {
    userData = newUserData;
  }
}
