import 'package:dio/dio.dart';
import 'package:thunderapp/shared/constants/app_text_constants.dart';
import 'package:thunderapp/shared/core/models/products_model.dart';
import '../../shared/core/models/banca_model.dart';
import '../../shared/core/user_storage.dart';

class ListProductsRepository {
  Future<List<ProductsModel>> getProducts(id) async {
    Dio dio = Dio();
    List<ProductsModel> stockProduct = [];
    ProductsModel product = ProductsModel();
    UserStorage userStorage = UserStorage();
    String nome;
    var userToken = await userStorage.getUserToken();
    print(id);
    var response = await dio.get(
      '$kBaseURL/bancas/$id/produtos',
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $userToken"
        },
      ),
    );

    List<dynamic> data = response.data['produtos'];

    print(data[0]['preco']);

    for (int i = 0; i < data.length; i++) {
      product = ProductsModel(
        nome: data[i]['nome'],
        id: data[i]['id'],
        descricao: data[i]['descricao'],
        tipoUnidade: data[i]['tipo_unidade'],
        estoque: data[i]['estoque'],
        preco: double.parse(data[i]['preco'].toString()),
        custo: double.parse(data[i]['custo'].toString()),
        disponivel: data[i]['disponivel'],
        bancaId: data[i]['banca_id'],
        produtoTabeladoId: data[i]['produto_tabelado_id'],
      );
      stockProduct.add(product);
    }

    if (response.statusCode == 200 ||
        response.statusCode == 201) {
      return stockProduct;
    } else {
      return stockProduct;
    }
  }
}
