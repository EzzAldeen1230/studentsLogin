import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
/*

Either<CustomerModel, bool> checkCustomerLoggedIn() {
  try {
    final customer =
        LocalDataProvider(sharedPreferences: sl<SharedPreferences>())
            .getCachedData(
                key: 'CUSTOMER_USER',
                retrievedDataType: CustomerModel.init(),
                returnType: List<CustomerModel>);
    if (customer != null) {
      return Left(customer);
    }
    return Right(false);
  } catch (e) {
    print("checkLoggedIn catch");
    return Right(false);
  }
}
*/



