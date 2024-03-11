import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/pages/home/components/category_tile.dart';
import 'package:greengroocer/src/config/app_data.dart' as appData;
import 'package:greengroocer/src/pages/home/components/product_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}
class _HomeTabState extends State<HomeTab> {
 String selectedCategory = 'Frutas';
  
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  int cartQuantityItems = 0;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }
    countCart() {
      int cartCount=0;
    for (int i = 0; i < appData.cartList.length; i++) {
          cartCount = cartCount + appData.cartList[i].qtd;
        }
    cartKey.currentState!.updateBadge((++cartCount).toString());
    return cartCount;
  }
// @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   super.context;
  //   countCart();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text.rich(
            TextSpan(
                style: const TextStyle(
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                      text: 'Verd',
                      style: TextStyle(
                        color: CustomColors.customGreenColor,
                      )),
                  TextSpan(
                      text: 'fruit',
                      style: TextStyle(
                        color: CustomColors.customPurpleColor,
                      )),
                ]),
          ),
          //botoes
        
        actions: [
          Column(
            children: [
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 15,
                ),
                child: GestureDetector(
                  
                  onTap: () {},
                  child: 
                    AddToCartIcon(
                      key: cartKey,
                      icon: Icon(
                        Icons.shopping_cart, 
                        color: CustomColors.customPurpleColor
                      ),
                      
                      badgeOptions: const BadgeOptions( 
                        active: true,
                        backgroundColor: Colors.red,
                      ),
                ),
                      )
                      ),
                      
            ],
          )
        ]
          ),
        
         
        //campo de pesquisa
        body: AddToCartAnimation(
            cartKey: cartKey,
            height: 30,
            width: 30,
            opacity: 0.85,
            dragAnimation: const DragToCartAnimationOptions(
              curve: Curves.ease
            ),
            jumpAnimation: const JumpAnimationOptions(duration: Duration(milliseconds: 1)),

            createAddToCartAnimation: (runAddToCartAnimation) {
              this.runAddToCartAnimation = runAddToCartAnimation;
            },
            child: Column(
              children: [
              //Email
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      hintText: 'Pesquise eu produto aqui',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: CustomColors.customPurpleColor,
                        size: 21,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none))),
                ),
              ),

              //categorias
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return CategoryTile(
                        onPressed: () {
                          setState(() {
                            selectedCategory = appData.categories[index];
                          });
                        },
                        category: appData.categories[index],
                        isSelected:
                            appData.categories[index] == selectedCategory,
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(width: 10),
                    itemCount: appData.items.length,
                  ),
                ),
              ),
              //GRID
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5,
                  ),
                  itemCount: appData.items.length,
                  itemBuilder: (_, index) {
                    return ProductTile(
                        item: 
                          appData.items[index], 
                        cartAnimationMathod: 
                          itemSelectedCartAnimation, 
                        cartQuantityItems: 
                          cartQuantityItems = countCart(), 
                        globalKeyCartItems: cartKey,
                      );

                  },
                ),
              ),
            ])));
            
  }
  
}
