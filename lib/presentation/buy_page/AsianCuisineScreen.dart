import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'buy_info_screen.dart'; // Import the BuyInfoScreen

class AsianCuisineScreen extends StatelessWidget {
  // Sample data for items
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Sushi',
      'price': '₱250.00',
      'image':
          'https://t4.ftcdn.net/jpg/01/35/23/71/360_F_135237184_vZnNVRuaHQZclXjxJ7ftEa3IyerhDF2y.jpg',
      'description':
          'Savor the delightful flavors of sushi, a mouthwatering Japanese dish that features vinegared rice harmoniously paired with an array of ingredients, including fresh seafood, crisp vegetables, and on occasion, exotic tropical fruits. This culinary masterpiece is not only a feast for the taste buds but also a visual delight, with skilled chefs crafting intricate rolls that showcase a perfect blend of textures and tastes. The artistry of sushi lies in its meticulous preparation, where each ingredient is carefully chosen to create a symphony of flavors. Whether indulging in classic nigiri or creative rolls, the combination of rice and toppings in sushi offers a culinary experience that captivates food enthusiasts worldwide. Immerse yourself in the rich tradition of Japanese cuisine with this delectable and artfully crafted dish.',
    },
    {
      'name': 'Pad Thai',
      'price': '₱200.00',
      'image':
          'https://www.kitchensanctuary.com/wp-content/uploads/2019/07/Pad-Thai-square-FS-29.jpg',
      'description':
          'Experience the vibrant taste of Pad Thai, a classic Thai stir-fried noodle dish that brings together the perfect medley of rice noodles, succulent prawns, tofu, crunchy peanuts, zesty lime, and crisp bean sprouts. This iconic Thai creation delights the senses with its harmonious blend of sweet, salty, sour, and umami flavors, creating a symphony of taste in every bite. The dish is a culinary masterpiece, showcasing the balance and depth of Thai cuisine. From the tender rice noodles to the tantalizing combination of fresh ingredients, Pad Thai offers a delightful journey through the heart of Thai culinary tradition, making it a beloved and internationally acclaimed dish.',
    },
    {
      'name': 'Dim Sum',
      'price': '₱160.00',
      'image':
          'https://www.thefoodranger.com/wp-content/uploads/2019/05/best-dim-sum-in-hong-kong-2.jpg',
      'description':
          'Embark on a culinary adventure with dim sum, an assortment of bite-sized delights originating from Chinese cuisine. Served in small steamer baskets or on petite plates, dim sum offers a diverse array of flavors and textures, from delicate dumplings to savory buns and tantalizing rolls. This traditional dining experience is characterized by its communal nature, as diners share and savor the variety of small, flavorful dishes. Each dim sum item reflects the artistry of Chinese culinary craftsmanship, combining fresh ingredients and expert techniques to create a symphony of tastes. Whether enjoyed in a bustling dim sum restaurant or as part of a leisurely tea ceremony, these delectable small bites showcase the richness and sophistication of Chinese gastronomy.',
    },
    {
      'name': 'Pho',
      'price': '₱180.00',
      'image':
          'https://assets.bonappetit.com/photos/601185e9e0a941bb1291e9e2/1:1/w_2560%2Cc_limit/GoLive-Beef-Pho.jpg',
      'description':
          'Indulge in the comforting flavors of pho, a Vietnamese noodle soup that weaves together a fragrant broth, tender rice noodles, and a medley of fresh herbs. This iconic dish typically features succulent beef or chicken, enhancing the broth with savory richness. The art of pho lies in the balance of its components, where the delicate interplay of flavors creates a harmonious and satisfying bowl. Served with lime wedges, bean sprouts, and basil on the side, pho allows for a customizable dining experience, adding layers of texture and freshness. Whether enjoyed as a warming bowl on a chilly day or as a culinary exploration of Vietnamese cuisine, pho captivates the senses with its depth and simplicity, making it a beloved staple.',
    },
    {
      'name': 'Bibimbap',
      'price': '₱220.00',
      'image':
          'https://www.maangchi.com/wp-content/uploads/2008/01/bibimbap-bowl.jpg',
      'description':
          'Delight in the savory goodness of bibimbap, a Korean mixed rice dish adorned with an array of colorful vegetables, thinly sliced beef, a perfectly fried egg, and a dollop of gochujang, a spicy chili pepper paste. This culinary masterpiece showcases the beauty of balance, as the varied textures and flavors harmonize in a single, visually appealing bowl. The ingredients are thoughtfully arranged on a bed of warm rice, inviting diners to mix and meld the components to their liking. Bibimbap not only tantalizes the taste buds with its combination of sweet, spicy, and umami notes but also embodies the essence of Korean cuisine, where freshness and presentation play integral roles in culinary enjoyment.',
    },
    {
      'name': 'Curry Laksa',
      'price': '₱260.00',
      'image':
          'https://images.food52.com/mwAsRvkr60diyNqoZo89455emb4=/1200x1200/6092154f-b33f-4cf6-bb17-edb72ff52882--WoonHengXFood52_CollabPost2_online-.jpg',
      'description':
          'Savor the robust flavors of laksa, a spicy noodle soup that traces its roots to the vibrant Peranakan culture, blending Chinese and Malay culinary traditions. This delectable fusion dish features a rich and aromatic broth, often infused with coconut milk and a harmonious blend of spices. The soup envelops rice noodles and an array of ingredients, such as prawns, tofu, and bean sprouts, creating a symphony of textures and tastes. Laksa stands as a testament to the diverse and intricate tapestry of Peranakan cuisine, where the aromatic spices from Malay heritage meet the noodle-centric influences of Chinese cooking, resulting in a uniquely satisfying and flavorful culinary experience.',
    },
    {
      'name': 'Margherita Pizza',
      'price': '₱180.00',
      'image':
          'https://img.freepik.com/free-photo/front-view-pizza-with-cheese-brown-round-wooden-desk-dark-surface_140725-14476.jpg?w=740&t=st=1702634702~exp=1702635302~hmac=263c0f3744bd58f707fbd74d44b366acb72abd018f7816a59be0d93898f2a84b',
      'description':
          'Indulge in the classic simplicity of Margherita Pizza, where a thin crust is adorned with the timeless trio of fresh mozzarella, ripe tomatoes, and fragrant basil. The harmony of these high-quality ingredients creates a culinary masterpiece that celebrates the essence of Italian pizza. With a golden crust, melted mozzarella, and bursts of tomato and basil in every bite, Margherita Pizza is a timeless favorite that captures the heart and soul of traditional Italian pizzerias.'
    },
    {
      'name': 'Chicken Satay',
      'price': '₱160.00',
      'image':
          'https://img.freepik.com/free-photo/chicken-skewers-with-slices-apples-chili-top-view_2829-19996.jpg?w=740&t=st=1702634779~exp=1702635379~hmac=db5c733bc8633dc4c5cc82a734ad2d0a998d725abe1b3496c93a56c7f8849691',
      'description':
          'Satisfy your taste buds with the bold and savory flavors of Chicken Satay, a popular Southeast Asian dish. Succulent skewers of grilled and marinated chicken are served with a rich and peanutty sauce, creating a perfect balance of sweetness, spiciness, and umami. The grilled aroma and the tender texture of the chicken combined with the creamy peanut sauce make Chicken Satay a delightful and appetizing choice. This dish not only reflects the diverse culinary heritage of Southeast Asia but also offers a delightful interplay of textures and flavors that will leave you craving more.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asian Cuisine'),
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
