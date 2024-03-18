import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneymanager/models/dto/wallet.dto.dart';
import 'package:moneymanager/models/wallet.model.dart';
import 'package:moneymanager/services/wallet_methods.service.dart';
import 'package:moneymanager/services/wallet.service.dart';
import 'package:moneymanager/helpers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet.repository.g.dart';

class WalletRepository {
  WalletRepository({required this.client});

  final Dio client;

  Future<bool> addWallet(WalletDto walletDto) async {
    try {
      var result = await WalletService.addWallet(walletDto);
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

  // all wallets (local + remote)
  Future<List<Wallet>?> allWallet() async {
    final WalletService walletService = WalletService(client);
    var localWallets = WalletMethod.getWallets();
    final List<Wallet> remotWallets = await walletService.getWallets();
    return remotWallets + localWallets;
  }
}

@riverpod
WalletRepository walletRepository(WalletRepositoryRef ref) => WalletRepository(
      client: ref.watch(dioProvider),
    );
