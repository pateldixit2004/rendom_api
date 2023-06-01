import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom_api/screen/provider/rendomprovider.dart';

import '../modal/rendomModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RandomProvider? prividerF;
  RandomProvider? prividerT;

  @override
  Widget build(BuildContext context) {
    prividerF = Provider.of<RandomProvider>(context, listen: false);
    prividerT = Provider.of<RandomProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: prividerF!.randomGet(),
          builder: (context, snapshot) {
            if(snapshot.hasData)
              {
                RendomModel? randomModel = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${randomModel!.results![index].login!.username}"),
                  );
                },itemCount: randomModel!.results!.length,);
              }
            else if(snapshot.hasError)
              {
                return Text("${snapshot.hasError}");
              }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
