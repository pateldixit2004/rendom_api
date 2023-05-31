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
  void initState() {
    super.initState();
    Provider.of<RandomProvider>(context,listen: false).randomGet();
  }

  @override
  Widget build(BuildContext context) {

    prividerF = Provider.of<RandomProvider>(context, listen: false);
    prividerT = Provider.of<RandomProvider>(context, listen: true);


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

        ),
        body: ListView.builder(itemBuilder: (context, index) {
          RendomModel? randomModel = RendomModel();
          return ListTile(
            title: Text("${randomModel!.info!.seed}"),
          );
        },
        ),
      ),
    );
  }
}
