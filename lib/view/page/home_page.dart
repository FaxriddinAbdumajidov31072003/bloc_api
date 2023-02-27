import 'dart:ffi';

import 'package:bloc_api/Cubit/univer_cubit.dart';
import 'package:bloc_api/State/univer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../companents/information_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController name = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CountryCubit>().init();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount:  state.univerModel?.length  ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InformationPage(
                          univerResponse: state.univerModel![index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10,top: 10),
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.3,color: Colors.blue),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:
                          Center(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Text(state.univerModel?[index].name ?? ""))),
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (con) {
                return AlertDialog(
                  title: TextFormField(
                    controller: name,
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CountryCubit>().getApi(name.text);
                          Navigator.pop(context);
                        },
                        child: const Text("save"))
                  ],
                );
              });

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
