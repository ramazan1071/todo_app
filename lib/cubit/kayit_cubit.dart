import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/islerdao_repository.dart';

class KayitCubit extends Cubit{
  KayitCubit():super(0);

  var irepo = IslerDaoRepository();

  Future<void>kayit(String is_ad) async{
    await irepo.isKayit(is_ad);
  }

}