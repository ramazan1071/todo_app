import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/repo/islerdao_repository.dart';

class DetayCubit extends Cubit<void>{
  DetayCubit():super(0);

  var irepo = IslerDaoRepository();

  Future<void> guncelle(int is_id,String is_ad) async{

    await irepo.isguncelle(is_id, is_ad);

  }
}