import 'package:flutter/material.dart';
import 'package:pos/provider/sell_list_provider.dart';
import 'package:pos/utils/color_utils.dart';
import 'package:pos/utils/string_utils.dart';
import 'package:pos/utils/utils.dart';
import 'package:provider/provider.dart';
class ListOfSellPage extends StatefulWidget {
  const ListOfSellPage({Key? key}) : super(key: key);

  @override
  _ListOfSellPageState createState() => _ListOfSellPageState();
}

class _ListOfSellPageState extends State<ListOfSellPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async{
    await Provider.of<SellListProvider>(context, listen: false).sellList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.customAppBar(text: UtilStrings.sellList,icon: Icons.info_outlined,onTap: (){
        Navigator.pop(context);
      }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Consumer<SellListProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if(value.isLoading == true){
              return const Center(child: CircularProgressIndicator(),);
            }
          return ListView.builder(
            itemCount: value.sellItemList.length,
            itemBuilder: (BuildContext context, int index) {
              if (value.selllist != null) {
                return Container(
                decoration: BoxDecoration(
                    color: AppColor.light_white,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children:  [
                    Row(
                      children: [
                        const Text('ID :->'),
                        Text(value.sellItemList[index].id),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Business ID :->'),
                        Text(value.sellItemList[index].businessId),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Final Amount :->'),
                        Text(value.sellItemList[index].finalTotal),
                      ],
                    ),
                  ],
                ),
              );
              } else {
                return const Center(
                child: CircularProgressIndicator(),
              );
              }
            },);
        },),
      ),
    );
  }
}
