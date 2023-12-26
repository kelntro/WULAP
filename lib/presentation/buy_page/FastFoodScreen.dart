import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'buy_info_screen.dart';

class FastFoodScreen extends StatelessWidget {
  // Sample data for fast-food items
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Cheeseburger',
      'price': '₱80.00',
      'image':
          'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg?w=740&t=st=1702631001~exp=1702631601~hmac=3b9bb4d6b2cbabddedec6532dc5d500d9325dffc28d814329fc4ca437bea24ec',
      'description':
          'Indulge in the timeless satisfaction of a classic cheeseburger, featuring a succulent beef patty nestled between a soft bun, adorned with a generous layer of melted cheese, crisp lettuce, and juicy tomato slices. This iconic creation epitomizes the perfect harmony of flavors and textures, with the savory umami of the beef complemented by the creamy richness of the cheese, the freshness of lettuce, and the vibrant acidity of ripe tomatoes. The classic cheeseburger is a culinary staple that transcends time, offering a simple yet delectable combination that has delighted taste buds across generations. Whether enjoyed at a diner, backyard barbecue, or your favorite fast-food joint, this quintessential American dish remains a symbol of comfort and satisfaction.',
    },
    {
      'name': 'Chicken Nuggets',
      'price': '₱60.00',
      'image':
          'https://img.freepik.com/free-photo/crispy-fried-chicken-wooden-cutting-board_1150-20220.jpg?w=740&t=st=1702631036~exp=1702631636~hmac=bd27c4ef779b2ff2a19cacf6ef7acb43d01b6570c4a58ab9c84f072aaf4e68a6',
      'description':
          'Satisfy your snacking cravings with crispy and tender chicken nuggets, bite-sized delights that promise a perfect balance of crunch and succulence. These golden nuggets are a testament to the art of achieving the ideal texture, with a crispy exterior giving way to tender, flavorful chicken within. Whether dipped in tangy sauces or enjoyed on their own, chicken nuggets make for an irresistible snack that appeals to all ages. Their versatility and comforting appeal have made them a beloved classic, providing a quick and delicious solution for those in search of a satisfying bite.',
    },
    {
      'name': 'Pepperoni Pizza',
      'price': '₱120.00',
      'image':
          'https://img.freepik.com/free-photo/slice-crispy-pizza-with-meat-cheese_140725-6974.jpg?w=740&t=st=1702631071~exp=1702631671~hmac=3a160d784afd90c723bcd4f6d9bf1162d2655c75c30706158f95af6a709f606c',
      'description':
          'Indulge in the delicious simplicity of a classic pizza, generously adorned with savory pepperoni, melted cheese, and a rich tomato sauce. This timeless creation offers a perfect harmony of flavors and textures, with the spicy kick of pepperoni complementing the gooey goodness of melted cheese, all set against the backdrop of a savory tomato sauce. The combination of these staple ingredients transforms each bite into a savory symphony that has made pizza a global culinary favorite. Whether enjoyed as a quick meal, shared with friends during gatherings, or savored as a comfort food, this pepperoni and cheese pizza is a delectable and iconic dish that never fails to satisfy.',
    },
    {
      'name': 'French Fries',
      'price': '₱40.00',
      'image':
          'https://img.freepik.com/free-photo/crispy-french-fries-with-ketchup-mayonnaise_1150-26588.jpg?w=740&t=st=1702631103~exp=1702631703~hmac=9ccf7010f29bc4e9c0e0795d885d4d7d2d73ce88fab333ab18c25b1f7bff82a7',
      'description':
          'Delight in the golden perfection of crispy French fries, a timeless and irresistible classic side dish. These thin potato strips are expertly fried to achieve a satisfying crunch on the outside while maintaining a tender and fluffy interior. Whether served as a companion to a juicy burger, a hearty sandwich, or enjoyed on their own with a variety of dipping sauces, French fries hold a universal appeal. The allure of their golden hue and addictively crisp texture has made them a beloved staple in the world of comfort food, offering a simple yet gratifying culinary experience.',
    },
    {
      'name': 'Fried Chicken',
      'price': '₱90.00',
      'image':
          'https://img.freepik.com/free-photo/crispy-fried-chicken-plate-with-salad-carrot_1150-20212.jpg?w=740&t=st=1702631130~exp=1702631730~hmac=97c826c78580d0ae9b59b481036b3a981a8048b7fb6c1d71922f555ddaea16ba',
      'description':
          'Savor the delectable perfection of crispy fried chicken, meticulously seasoned to tantalize the taste buds. This culinary masterpiece boasts a golden-brown crust that encapsulates succulent and tender meat within. The artful blend of seasonings, whether a secret family recipe or a well-known mix of herbs and spices, elevates each bite to a symphony of flavors. Whether enjoyed as a standalone dish, part of a hearty meal, or in a sandwich, crispy fried chicken holds a special place in the hearts of food enthusiasts for its satisfying crunch and mouthwatering taste. This classic comfort food continues to be a timeless favorite, celebrated for its simple yet irresistible appeal.',
    },
    {
      'name': 'Soft Drink',
      'price': '₱30.00',
      'image':
          'https://img.freepik.com/free-photo/fresh-cola-drink-with-green-lime_144627-12393.jpg?w=740&t=st=1702631182~exp=1702631782~hmac=dfe24fd44953eb09ee427668775a983a84195cfd7ae08329d0cc36db9234d701',
      'description':
          'Quench your thirst and enhance your meal with a refreshing soft drink, effervescent bubbles dancing in a symphony of flavors. Whether its a classic cola, a zesty lemon-lime soda, or a crisp ginger ale, the effervescence and sweetness of a soft drink provide the perfect palate cleanser and complement to a satisfying meal. The crisp and refreshing qualities of the beverage offer a delightful contrast to savory or spicy dishes, making it a versatile and enjoyable addition to any dining experience. Choose your favorite fizzy companion and let the effervescence elevate the overall enjoyment of your meal.',
    },
    {
      'name': 'Bolognese',
      'price': '₱150.00',
      'image':
          'https://img.freepik.com/free-photo/spaghetti-bolognese-with-tomato-meat-sauce-pecorino-cheese-basil_2829-4390.jpg?w=740&t=st=1702631272~exp=1702631872~hmac=83737b914ef399a3d98a83f71758ba19eab142c1d13a05883c9e3a23b8c0d220',
      'description':
          'Delight in the classic Italian comfort of Spaghetti Bolognese, a timeless dish that combines al dente pasta with a rich and savory meat sauce. The hearty sauce, made with a medley of ground meat, tomatoes, herbs, and aromatic spices, creates a symphony of flavors that cling to each strand of spaghetti. Topped with a sprinkle of grated cheese and fresh herbs, this dish is a celebration of comforting textures and robust tastes. Spaghetti Bolognese is not just a meal; its a culinary journey through the heart of Italian tradition, inviting you to savor each bite and revel in the warmth of a well-loved classic.'
    },
    {
      'name': 'Caesar Salad',
      'price': '₱100.00',
      'image':
          'https://img.freepik.com/free-photo/caesar-salad-wooden-table_1150-24862.jpg?w=740&t=st=1702631306~exp=1702631906~hmac=b4e2fe23fe229b0cc2958df7d21e2f93a75d9a77f9fcab2e7e7fe3d68d5710c6',
      'description':
          'Experience the crisp and refreshing simplicity of a Caesar Salad, a light and flavorful ensemble of fresh romaine lettuce, croutons, Parmesan cheese, and a zesty Caesar dressing. The combination of crunchy greens, savory cheese, and the tangy dressing creates a harmonious balance of textures and tastes. Whether enjoyed as a refreshing side or as a satisfying main course with added protein, Caesar Salad stands as a beacon of freshness and simplicity in the world of salads. Elevate your dining experience with the classic Caesar Salad, a timeless favorite that has captured the hearts of salad enthusiasts around the globe.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fast Food'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BuyInfoScreen(item: items[index]),
                        ),
                      );
                    },
                    child: _buildItemCard(items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: item['image'],
              height: 110.0,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300], // Placeholder color
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        const Color.fromARGB(255, 113, 1, 133)),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Price: ${item['price']}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: const Color.fromARGB(255, 112, 112, 112),
                      fontFamily:
                          'Arial', // Use a font that supports the Peso sign
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
