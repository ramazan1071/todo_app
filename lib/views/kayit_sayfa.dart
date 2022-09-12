import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/kayit_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({Key? key}) : super(key: key);

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfYapilacakIs = TextEditingController();



  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text("Yapılacak İş Kayıt"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50,left: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfYapilacakIs,
                decoration: const InputDecoration(hintText: "Yapılacak İş"),),
              ElevatedButton(onPressed: (){
                context.read<KayitCubit>().kayit(tfYapilacakIs.text);
              }, child: const Text("KAYDET")),
            ],
          ),
        ),
      ),

    );
  }
}
