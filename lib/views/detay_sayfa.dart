import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/detay_cubit.dart';
import 'package:todo_app/entity/isler.dart';

class DetaySayfa extends StatefulWidget {
  Isler nesne;


  DetaySayfa({required this.nesne});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfYapilacakIs = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var nesne = widget.nesne;
    tfYapilacakIs.text = nesne.is_ad;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapılacak İş Detay"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 50,left: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfYapilacakIs,
                decoration: const InputDecoration(hintText: "Yapılacak İş"),),
              ElevatedButton(onPressed: (){
                context.read<DetayCubit>().guncelle(widget.nesne.is_id, tfYapilacakIs.text);

              }, child: const Text("GÜNCELLE")),
            ],
          ),
        ),
      ),

    );
  }
}
