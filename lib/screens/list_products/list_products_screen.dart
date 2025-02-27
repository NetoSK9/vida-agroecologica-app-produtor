import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:thunderapp/screens/add_products/add_products_screen.dart';
import 'package:thunderapp/screens/home/home_screen.dart';
import 'package:thunderapp/screens/home/home_screen_controller.dart';
import 'package:thunderapp/screens/list_products/components/total_infos.dart';
import '../../shared/constants/app_number_constants.dart';
import '../../shared/constants/style_constants.dart';
import 'list_products_controller.dart';

class ListProductsScreen extends StatelessWidget {
  ListProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ListProductsController>(
      init: ListProductsController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Produtos',
            style: kTitle2.copyWith(color: Colors.orange),
          ),
          iconTheme:
              const IconThemeData(color: Colors.orange),
        ),
        /*drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Sair'),
                  trailing: const Icon(
                    Icons.exit_to_app,
                    size: 20,
                    color: kPrimaryColor,
                  ),
                  onTap: () {},
                )
              ],
            )),*/
        floatingActionButton: SizedBox(
          height: size.height * 0.08,
          width: size.width * 0.18,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddProductsScreen()));
            },
            backgroundColor: kPrimaryColor,
            heroTag: 'AddListProduct',
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(100))),
            child: Icon(Icons.add,
                size: size.height * 0.06,
                color: Colors.white),
          ),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(kDefaultPadding),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estoque',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontWeight: FontWeight.w500,
                      color: kSecondaryColor,
                    ),
                  ),
                  Divider(
                    height: size.height * 0.014,
                    color: Colors.transparent,
                  ),
                  TotalInfos(controller),
                  Divider(
                    height: size.height * 0.04,
                    color: Colors.transparent,
                  ),
                  Text(
                    'Produtos',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontWeight: FontWeight.w500,
                      color: kSecondaryColor,
                    ),
                  ),
                  Divider(
                    height: size.height * 0.014,
                    color: Colors.transparent,
                  ),
                  Column(
                    children: controller.products,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
