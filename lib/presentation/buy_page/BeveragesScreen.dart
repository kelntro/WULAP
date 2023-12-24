import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'buy_info_screen.dart'; // Import the BuyInfoScreen

class BeveragesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Sago\'t Gulaman',
      'price': '₱400.00',
      'image':
          'https://www.pingdesserts.com/wp-content/uploads/2019/07/melon-sagot-gulaman-2.jpg',
      'description':
          'Quench your thirst with the delightful taste of gulaman at sago, a sweet Filipino drink featuring sago pearls and gulaman jelly. This refreshing beverage is a harmonious blend of chewy tapioca pearls and agar jelly, creating a unique and satisfying texture. The drink is often infused with a syrupy concoction, infusing it with sweetness and a touch of flavor. A popular choice for cooling down in the tropical Philippines, gulaman at sago captures the essence of Filipino culinary creativity, offering a sweet respite in every cool, flavorful sip.',
    },
    {
      'name': 'Buko Pandan',
      'price': '₱500.00',
      'image':
          'https://t4.ftcdn.net/jpg/05/33/06/11/360_F_533061124_GMXD2L6VjRgZLnLKduaTwK2N8q423iNU.webp',
      'description':
          'Quench your thirst with the invigorating taste of buko pandan, a refreshing drink that combines the natural sweetness of coconut with the aromatic essence of pandan leaves. This tropical beverage features shredded young coconut, adding a delightful chewiness to each sip. The marriage of coconut and pandan creates a harmonious blend of flavors, providing a cooling and satisfying experience, especially in warm climates. Buko pandan encapsulates the essence of tropical refreshment, making it a popular choice for those seeking a taste of the lush and vibrant flavors found in Filipino and Southeast Asian culinary traditions.',
    },
    {
      'name': 'Guyabano Juice',
      'price': '₱450.00',
      'image':
          'https://img.freepik.com/free-photo/lychee-juice-lychee-fruit_1150-13685.jpg?w=360&t=st=1702612198~exp=1702612798~hmac=cfddeb4b515692fc1c13287cab04cbdcd8d020d9c8c6764f218c6ac110bcaa96',
      'description':
          'Quench your thirst with the distinctive taste of guyabano juice, a healthy beverage crafted from the guyabano fruit, celebrated for its unique and tropical flavor. This refreshing drink captures the essence of the fruits sweet and tangy notes, providing a delicious alternative to traditional fruit juices. Guyabano, also known as soursop, contributes not only to the beverages delightful taste but also to its potential health benefits, as the fruit is rich in vitamins and antioxidants. Sip on the natural goodness of guyabano juice, embracing a flavorful and nutritious option in the realm of tropical beverages.',
    },
    {
      'name': 'Salabat',
      'price': '₱300.00',
      'image':
          'https://img.freepik.com/premium-photo/glass-ginger-tea-with-milk-spicy-masala-spices-karak-tea-adrak-chai-popular-indian-drink_338311-3542.jpg',
      'description':
          'Embrace the warmth and wellness of salabat, a Filipino ginger tea revered for its health benefits. This soothing beverage is crafted from ginger, known for its anti-inflammatory and immune-boosting properties. Salabat offers a comforting respite, especially during chilly weather or as a remedy for colds and sore throats. Beyond its therapeutic qualities, the tea boasts a robust and spicy flavor profile that invigorates the senses. Celebrated for both its taste and potential health-promoting attributes, salabat stands as a cherished Filipino tradition, providing a comforting and flavorful way to nourish the body.',
    },
    {
      'name': 'Calamansi Juice',
      'price': '₱350.00',
      'image':
          'https://img.freepik.com/free-photo/fresh-summer-drink-with-lemon_23-2147632003.jpg?t=st=1702611975~exp=1702612575~hmac=fde28dcf29d84946ef0ba6dd298cb30c44dd0b800864e77adc4e209ad6106c7b',
      'description':
          'Quench your thirst with the zesty allure of calamansi juice, a tangy and refreshing drink made from the small, citrusy Filipino lime known as calamansi. This beverage captures the essence of tropical citrus, offering a burst of vibrant flavor that balances sweetness with a delightful tang. Calamansi juice is a popular and invigorating choice in Filipino cuisine, enjoyed on its own or as a base for various refreshing concoctions. Whether sipped over ice on a hot day or used as a flavorful ingredient in cocktails and culinary creations, calamansi juice embodies the tropical zest of Filipino citrus, providing a delightful and rejuvenating experience.',
    },
    {
      'name': 'Mango Shake',
      'price': '₱600.00',
      'image':
          'https://img.freepik.com/free-photo/mango-juice-glass-blue-surface_1150-41955.jpg?w=360&t=st=1702611707~exp=1702612307~hmac=1f453c1cc5c0551b55a01d0e36806760be62303bc36677735ce774542324789e',
      'description':
          'Indulge in the luscious delight of a Philippine mango shake, a smooth and creamy beverage crafted from the rich, golden goodness of ripe mangoes. This tropical treat captures the essence of the sweet and velvety Philippine mango, blending it into a silky concoction that offers a heavenly fusion of flavor and texture. Sipped as a refreshing escape on warm days, the mango shake stands as a testament to the Philippines renowned mangoes, showcasing their natural sweetness and vibrant character. Elevate your taste buds with the sumptuous experience of this velvety shake, celebrating the unparalleled richness of Philippine mangoes in each satisfying sip.',
    },
    {
      'name': 'Pineapple Cooler',
      'price': '₱380.00',
      'image':
          'https://img.freepik.com/free-photo/front-view-pineapple-juice-with-pineapple-slices-cutting-board-pineapple-green-surface-white-surface_141793-13920.jpg?w=740&t=st=1702634906~exp=1702635506~hmac=569142feb74d08972818ebb59b4a6b68ed028603cad250c737f0c92cf5919441',
      'description':
          'Escape to the tropics with the Pineapple Cooler, a revitalizing drink that combines the sweet and tangy goodness of fresh pineapple with a hint of mint. This tropical cooler is perfect for quenching your thirst on a warm day, offering a burst of refreshing flavors that dance on your palate. Served over ice, the Pineapple Cooler is a delightful and hydrating option that captures the essence of a tropical paradise, making every sip a mini vacation for your taste buds.'
    },
    {
      'name': 'Watermelon Slush',
      'price': '₱420.00',
      'image':
          'https://img.freepik.com/free-photo/cold-watermelon-smoothie-dark-background_1150-41818.jpg?w=740&t=st=1702634942~exp=1702635542~hmac=1d1eea7a93d95cf1ba45f784282c79fdd2167052f159b50b420aaf56f9d9be45',
      'description':
          'Beat the heat with the Watermelon Slush, a cool and invigorating beverage that blends the juicy sweetness of watermelon with a frosty, slushy texture. This thirst-quenching slush is not only visually appealing but also a delightful treat for your taste buds. The natural sweetness of watermelon shines through in every sip, creating a refreshing experience that is perfect for hot summer days. Whether enjoyed by the pool or as a sweet pick-me-up, the Watermelon Slush is a delicious and hydrating option that embodies the essence of summer.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filipino Beverages'),
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
