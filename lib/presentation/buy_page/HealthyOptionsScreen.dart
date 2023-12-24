import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'buy_info_screen.dart'; // Import the BuyInfoScreen

class HealthyOptionsScreen extends StatelessWidget {
  // Sample data for healthy food items
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Quinoa Salad',
      'price': '₱90.00',
      'image':
          'https://img.freepik.com/free-photo/tabbouleh-salad_2829-10890.jpg?w=740&t=st=1702631235~exp=1702631835~hmac=543cb5cbacc25d651e2143990a6a1718cd6d8368fbd2cc7671ebf4972c857803',
      'description':
          'Savor the wholesome goodness of a nutritious quinoa salad, featuring a medley of mixed vegetables and a tantalizing vinaigrette dressing. This vibrant dish combines the nutty richness of quinoa with the freshness of colorful vegetables, creating a symphony of textures and flavors. The vinaigrette dressing adds a zesty and tangy note, enhancing the overall appeal of the salad. Packed with essential nutrients, this quinoa salad not only delights the taste buds but also provides a wholesome and satisfying dining experience. Whether enjoyed as a light lunch or a refreshing side, this nutrient-rich salad stands as a delicious testament to the marriage of health and flavor in culinary creation.',
    },
    {
      'name': 'Grilled Salmon',
      'price': '₱120.00',
      'image':
          'https://img.freepik.com/free-photo/cooked-salmon-steaks_144627-30621.jpg?w=740&t=st=1702631271~exp=1702631871~hmac=c9ad3befcf4dd06dfba5d719cae6bb19dd474d8109b8fe38e20a1376242ebfab',
      'description':
          'Savor the exquisite simplicity of a tender grilled salmon fillet, artfully seasoned with a blend of fragrant herbs and a hint of zesty lemon. This culinary creation captures the succulence of perfectly cooked salmon, its flaky texture enhanced by the aromatic herbs and the bright citrus notes. The grilling process imparts a smoky flavor, creating a harmonious balance that elevates the natural richness of the fish. Each bite is a delightful journey of taste, showcasing the perfect marriage of fresh, high-quality ingredients and expert culinary technique. This dish stands as a testament to the elegance of simplicity, allowing the vibrant flavors of the salmon, herbs, and lemon to shine in perfect harmony.',
    },
    {
      'name': 'Avocado Toast',
      'price': '₱80.00',
      'image':
          'https://img.freepik.com/free-photo/flat-lay-nutritious-breakfast-meal-assortment_23-2148833907.jpg?w=740&t=st=1702631306~exp=1702631906~hmac=2bae88ef281390e5cd0f4ba2d0a9bad359457e1e81090c95f5ed4b3d1cc71da9',
      'description':
          'Enjoy a nutritious and satisfying breakfast with whole-grain toast crowned with creamy avocado slices and vibrant cherry tomatoes. This simple yet delightful dish brings together the earthy crunch of whole-grain toast, the smooth richness of ripe avocado, and the juicy burst of cherry tomatoes. The combination offers a harmonious blend of textures and flavors, creating a refreshing and wholesome start to your day. Packed with essential nutrients, this avocado and tomato toast not only provides a delicious culinary experience but also fuels your body with the goodness of whole grains and fresh produce. It stands as a flavorful testament to the art of combining simple, wholesome ingredients for a delightful and nourishing meal.',
    },
    {
      'name': 'Smoothie Bowl',
      'price': '₱100.00',
      'image':
          'https://img.freepik.com/free-photo/ceramic-bowl-delicious-acai-brazilian-dessert_23-2149788581.jpg?w=740&t=st=1702631351~exp=1702631951~hmac=dc450691bdbddef50c6c7083e1d08bb8204ca2d5426cada65f4b558fe46873ee',
      'description':
          'Indulge in the refreshing goodness of a smoothie bowl, a delightful blend of vibrant fruits, crunchy granola, and creamy yogurt. This nutritious creation offers a symphony of flavors and textures, as the smoothie base combines the sweetness of assorted fruits with the tartness of yogurt. The addition of granola provides a satisfying crunch and a wholesome element, turning each spoonful into a delicious and invigorating experience. Whether enjoyed as a wholesome breakfast or a rejuvenating snack, the smoothie bowl stands as a colorful and nutritious celebration of fresh ingredients, offering a perfect balance of taste and texture to fuel your day.',
    },
    {
      'name': 'Vegetarian Wrap',
      'price': '₱85.00',
      'image':
          'https://img.freepik.com/free-photo/shawarma-from-juicy-beef-lettuce-tomatoes-cucumbers-paprika-onion-pita-bread-with-spinach-diet-menu_2829-14466.jpg?w=740&t=st=1702631401~exp=1702632001~hmac=1623c23fbdff586f2eab04eadff1eae66b165d5448e98a8d8dd7bdc50a08679a',
      'description':
          'Savor the wholesomeness of a delightful vegetarian wrap, brimming with assorted crisp vegetables and creamy hummus. This culinary creation combines a medley of fresh, vibrant veggies—such as crunchy bell peppers, crisp lettuce, and juicy tomatoes—with the velvety goodness of hummus. Encased in a soft wrap, every bite offers a satisfying blend of textures and flavors, creating a wholesome and fulfilling experience. Packed with nutrients and plant-based goodness, this vegetarian wrap not only caters to the palate but also stands as a tasty testament to the creativity and variety that vegetarian cuisine can bring to the table. Whether enjoyed for lunch or a quick and nutritious snack, this wrap is a delicious celebration of plant-powered goodness.',
    },
    {
      'name': 'Mixed Berry Parfait',
      'price': '₱70.00',
      'image':
          'https://img.freepik.com/free-photo/top-view-tasty-yogurt-wooden-table_23-2148660453.jpg?w=740&t=st=1702631434~exp=1702632034~hmac=6f7df462ac30249a7012824cbddb51d56228a0717a405727e19c759302e61ce2',
      'description':
          'Indulge in the delight of a parfait, featuring layers of luscious mixed berries and velvety Greek yogurt. This delectable creation combines the sweet and tart flavors of assorted berries—such as strawberries, blueberries, and raspberries—with the rich creaminess of Greek yogurt. Each spoonful unveils a symphony of tastes and textures, from the burst of juicy berries to the smoothness of the yogurt. Packed with antioxidants and probiotics, this delightful parfait not only satisfies the sweet tooth but also provides a nutritious and refreshing treat. Whether enjoyed as a wholesome breakfast or a guilt-free dessert, this berry and yogurt parfait stands as a delicious celebration of balance and flavor.',
    },
    {
      'name': 'Caprese Salad',
      'price': '₱110.00',
      'image':
          'https://img.freepik.com/free-photo/caprese-salad-tomato-mozzarella-basil_2829-11014.jpg?w=740&t=st=1702631470~exp=1702632070~hmac=9bbd76214d8a9dbf678a8b13eb0ac1d2c157a7d6718a68ba091f4cc8b4f40515',
      'description':
          'Delight in the freshness of a classic Caprese Salad, a simple yet elegant ensemble of ripe tomatoes, fresh mozzarella, and fragrant basil. The combination of vibrant colors and flavors creates a refreshing and light salad that celebrates the harmony of high-quality ingredients. Drizzled with extra virgin olive oil and balsamic glaze, this salad is a testament to the beauty of simplicity and the rich tradition of Italian cuisine. Whether enjoyed as a starter or a side dish, the Caprese Salad invites you to savor the essence of summer in every delightful bite.'
    },
    {
      'name': 'Mushroom Risotto',
      'price': '₱130.00',
      'image':
          'https://img.freepik.com/free-photo/mushroom-risotto-parmesan-plate-top-view_2829-14722.jpg?w=740&t=st=1702631499~exp=1702632099~hmac=9b80496b68b87698c381773aada1a1a2b178189da0e6f60714f6f8e1e3f70da4',
      'description':
          'Indulge in the rich and creamy goodness of Mushroom Risotto, a comforting Italian dish that marries perfectly cooked Arborio rice with a medley of sautéed mushrooms and Parmesan cheese. The risotto is prepared with care, allowing the rice to absorb the savory flavors of the mushrooms and broth, resulting in a velvety and satisfying texture. Each spoonful offers a harmonious blend of earthy mushrooms, creamy rice, and the umami notes of Parmesan. Whether served as a main course or a side dish, Mushroom Risotto stands as a luxurious and flavorful option that invites you to experience the heartwarming embrace of Italian comfort food.'
    },
    {
      'name': 'Vegan Buddha Bowl',
      'price': '₱140.00',
      'image':
          'https://img.freepik.com/free-photo/salmon-poke-bowl-flat-lay-photography_53876-108183.jpg?size=626&ext=jpg&ga=GA1.1.508634008.1702611671&semt=ais',
      'description':
          'Embrace a nourishing and colorful meal with the Vegan Buddha Bowl, a vibrant assortment of nutrient-rich vegetables, grains, and plant-based proteins. This bowl celebrates variety and balance, featuring an array of fresh vegetables, quinoa or rice, avocado, and a flavorful tahini or hummus dressing. The combination of textures and flavors provides a satisfying and wholesome dining experience, while the diverse ingredients contribute to a well-rounded and nutritious meal. Whether you follow a vegan lifestyle or simply appreciate a bowlful of goodness, the Vegan Buddha Bowl invites you to savor the healthful delight of plant-powered eating.'
    },
    {
      'name': 'Eggplant Parmesan',
      'price': '₱125.00',
      'image':
          'https://img.freepik.com/free-photo/moussaka-eggplant-casserole-traditional-greek-dish_2829-20002.jpg?w=740&t=st=1702635474~exp=1702636074~hmac=fc7d9d0f754af82eef83d9b09523fef11ad07cb4cc8eb5408d536fbfc27f361d',
      'description':
          'Experience the savory indulgence of Eggplant Parmesan, a classic Italian dish that layers slices of eggplant with marinara sauce and melted mozzarella and Parmesan cheeses. The eggplant is breaded and baked to golden perfection, creating a satisfying crunch that contrasts with the rich and gooey cheese. Each bite is a medley of flavors, from the tender eggplant to the robust tomato sauce and the cheesy goodness. Whether enjoyed as a main course or a hearty side, Eggplant Parmesan invites you to savor the comforting embrace of traditional Italian flavors.'
    },
    {
      'name': 'Shrimp Stir-Fry',
      'price': '₱150.00',
      'image':
          'https://img.freepik.com/free-photo/stir-fried-shrimp-with-chili-paste_1150-38070.jpg?w=740&t=st=1702635504~exp=1702636104~hmac=80eb95bb57e4689b60cbfbc87597e64b911e71fed135dfabcd8b47ef2a37bd35',
      'description':
          'Delight in the flavors of the sea with Shrimp Stir-Fry, a delicious and vibrant dish that features succulent shrimp, crisp vegetables, and a savory soy-based sauce. The stir-frying technique preserves the natural sweetness and crisp texture of the shrimp and vegetables, creating a medley of tastes and textures in every bite. Whether served over rice or noodles, this shrimp stir-fry is a quick and flavorful option that allows you to enjoy the freshness of seafood and the goodness of colorful vegetables in a single, satisfying dish.'
    },
    {
      'name': 'Salsa Chicken',
      'price': '₱135.00',
      'image':
          'https://img.freepik.com/free-photo/tasty-chicken-soup-with-potato_140725-113416.jpg?w=740&t=st=1702635542~exp=1702636142~hmac=bf6254348efff0b21be1a9d6ab18c5e2896faea76c3acff0a061cda139aa8ea6',
      'description':
          'Savor the tropical fusion of Mango Salsa Chicken, a delightful dish that combines tender grilled chicken with a refreshing mango salsa. The grilled chicken breast, seasoned to perfection, serves as the perfect canvas for the vibrant and fruity salsa, which features ripe mango, tomatoes, red onions, cilantro, and a hint of lime juice. The result is a symphony of flavors that balances the savory and juicy notes of the chicken with the sweet and tangy elements of the mango salsa. Whether enjoyed on its own or paired with rice or salad, Mango Salsa Chicken invites you to experience the sunny and tropical essence of this delightful culinary creation.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Options'),
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
