import 'package:greengroocer/src/config/cart_item_model.dart';
import 'package:greengroocer/src/models/item_model.dart';
import 'package:greengroocer/src/models/order_model.dart';
import 'package:greengroocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
    description:
        'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    imageUrl: 'assets/fruits/apple.png',
    itemName: 'Maçã',
    price: 5.5,
    unit: 'kg',
    ncm: '15.29.453.67.23',
    nutrionalURL: 'www.google.com');

ItemModel grape = ItemModel(
    imageUrl: 'assets/fruits/grape.png',
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg',
    description:
        'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    ncm: '15.29.453.67.23',
    nutrionalURL: 'www.google.com');

ItemModel guava = ItemModel(
    imageUrl: 'assets/fruits/guava.png',
    itemName: 'Goiaba',
    price: 11.5,
    unit: 'kg',
    description:
        'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    ncm: '15.29.453.67.23',
    nutrionalURL: 'www.google.com');

ItemModel kiwi = ItemModel(
    imageUrl: 'assets/fruits/kiwi.png',
    itemName: 'Kiwi',
    price: 2.5,
    unit: 'un',
    description:
        'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    ncm: '15.29.453.67.23',
    nutrionalURL: 'www.google.com');

ItemModel mango = ItemModel(
    imageUrl: 'assets/fruits/mango.png',
    itemName: 'Manga',
    price: 2.5,
    unit: 'un',
    description:
        'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    ncm: '15.29.453.67.23',
    nutrionalURL: 'www.google.com');

ItemModel papaya = ItemModel(
    imageUrl: 'assets/fruits/papaya.png',
    itemName: 'Mamão papaya',
    price: 8,
    unit: 'kg',
    description:
        'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    ncm: '15.29.453.67.23',
    nutrionalURL: 'www.google.com');

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grão',
  'Verduras',
  'Temperos',
  'Cereais',
  'Lacticinios',
];

List<CartItemModel> cartList = [];

UserModel userData = UserModel(
    UserName: 'Renato Araujo',
    UserMail: 'renatojoa@gmail.com',
    UserID: '06982807410',
    UserPhone: '81996873479');

List<OrderModel> orders = [
  OrderModel(
    itens: [
      CartItemModel(item: apple, qtd: 2),
      CartItemModel(item: grape, qtd: 1),
      CartItemModel(item: guava, qtd: 5),
    ],
    qrCodeValue: 'Xpy1350an5h4v2j2345k34',
    orderID: 'Expirado12345689bxpqo',
    finalPrice: 400.50,
    orderDate: DateTime.parse('2024-03-02 14:30:10.548'),
    orderStatus: 'preparing_purchase',
    dueDateOrderPay: DateTime.parse('2024-12-12 14:30:10.548'),
  ),
  OrderModel(
    itens: [
      CartItemModel(item: guava, qtd: 5),
      CartItemModel(item: mango, qtd: 12),
    ],
    qrCodeValue: 'Xpy1350an5h4v2j2345k34',
    orderID: 'Vencido 123454',
    finalPrice: 10.00,
    orderDate: DateTime.parse('2011-02-03 17:30:10.548'),
    orderStatus: 'delivered',
    dueDateOrderPay: DateTime.parse('2025-10-10 17:30:10.548'),
  ),
  OrderModel(
    itens: [
      CartItemModel(item: guava, qtd: 3),
      CartItemModel(item: mango, qtd: 2),
    ],
    qrCodeValue: 'Xpy1350an5h4v2j2345k34',
    orderID: 'A vencer',
    finalPrice: 400.50,
    orderDate: DateTime.parse('2012-02-03 17:30:10.548'),
    orderStatus: 'paid',
    dueDateOrderPay: DateTime.parse('2025-10-10 17:30:10.548'),
  ),
  OrderModel(
    itens: [
      CartItemModel(item: kiwi, qtd: 1),
      CartItemModel(item: papaya, qtd: 3),
    ],
    qrCodeValue: 'Xpy1350an5h4v2j2345k34',
    orderID: 'Preparando',
    finalPrice: 430.50,
    orderDate: DateTime.parse('2012-02-03 17:30:10.548'),
    orderStatus: 'preparing_purchase',
    dueDateOrderPay: DateTime.parse('2025-10-10 17:30:10.548'),
  ),
  OrderModel(
    itens: [
      CartItemModel(item: kiwi, qtd: 1),
      CartItemModel(item: papaya, qtd: 3),
    ],
    qrCodeValue: 'Xpy1350an5h4v2j2345k34',
    orderID: 'pending_payment',
    finalPrice: 430.50,
    orderDate: DateTime.parse('2012-02-03 17:30:10.548'),
    orderStatus: 'pending_payment',
    dueDateOrderPay: DateTime.parse('2025-10-10 17:30:10.548'),
  ),
];
/*    'pending_payment':0,
    'refounded':1,
    'paid':2,
    'preparing_purchase':3,
    'shipping':4,
    'delivered':5, */
