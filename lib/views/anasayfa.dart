import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/anasayfa_cubit.dart';
import 'package:todo_app/entity/isler.dart';
import 'package:todo_app/views/detay_sayfa.dart';
import 'package:todo_app/views/kayit_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyorMu = false;

 @override
  void initState() {
    super.initState();
    context.read<AnaSayfaCubit>().isleriYukle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
            TextField(decoration: const InputDecoration(hintText: "Ara"),
            onChanged: (aramaSonuc){
              context.read<AnaSayfaCubit>().ara(aramaSonuc);
            },)
            :const Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnaSayfaCubit>().isleriYukle();

          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search))
        ],),
      body: BlocBuilder<AnaSayfaCubit,List<Isler>>(
        builder: (context,islerListesi){
          if(islerListesi.isNotEmpty){
            return ListView.builder(
              itemCount: islerListesi.length, //2
              itemBuilder: (context,indeks){ //0,1
                var nesne = islerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetaySayfa(nesne: nesne)))
                            .then((value) { context.read<AnaSayfaCubit>().isleriYukle();
                        });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${nesne.is_ad}"),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("${nesne.is_ad} silinsin mi?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: (){
                                    context.read<AnaSayfaCubit>().sil(nesne.is_id);
                                  },
                                ),
                            ),
                          );
                        }, icon: const Icon(Icons.delete_outline_outlined,color: Colors.black54,))
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value) {
            context.read<AnaSayfaCubit>().isleriYukle();
          });
        },
      ),

    );
  }
}

/*

 */