import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneymanager/app/api/modules/wallet.dart';
import 'package:moneymanager/app/models/dto/wallet.dto.dart';
import 'package:moneymanager/helper/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet.repository.g.dart';

class WalletRepository {
  WalletRepository({required this.client});

  final Dio client;

  Future<bool> addWallet(WalletDto walletDto) async {
    try {
      var result = await WalletModule.addWallet(walletDto);
      if (!result) {
        Fluttertoast.showToast(msg: "Wallet not added");
      } else {
        Fluttertoast.showToast(msg: "Wallet added");
      }
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}

@riverpod
WalletRepository walletRepository(WalletRepositoryRef ref) => WalletRepository(
      client: ref.watch(dioProvider),
    );
