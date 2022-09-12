import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/entity/isler.dart';
import 'package:todo_app/repo/islerdao_repository.dart';

class AnaSayfaCubit extends Cubit<List<Isler>>{
  AnaSayfaCubit():super(<Isler>[]);

  var irepo = IslerDaoRepository();


  Future<void> isleriYukle() async{

    var liste = await irepo.tumIsleriAl();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async{
    var liste = await irepo.isAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int is_id) async{
    await irepo.isSil(is_id);
    await isleriYukle();
  }

}