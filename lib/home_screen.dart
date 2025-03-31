import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Food Item Data Model
class FoodItem {
  final String name;
  final String category;
  final double price;
  final String imagePath;

  FoodItem({
    required this.name,
    required this.category,
    required this.price,
    required this.imagePath,
  });
}

/// Cart Management using Map (FoodItem -> quantity)
class CartProvider with ChangeNotifier {
  final Map<FoodItem, int> _cartMap = {};

  Map<FoodItem, int> get cartMap => _cartMap;

  void addItem(FoodItem item) {
    if (_cartMap.containsKey(item)) {
      _cartMap[item] = _cartMap[item]! + 1;
    } else {
      _cartMap[item] = 1;
    }
    notifyListeners();
  }

  void removeOneItem(FoodItem item) {
    if (_cartMap.containsKey(item)) {
      if (_cartMap[item]! > 1) {
        _cartMap[item] = _cartMap[item]! - 1;
      } else {
        _cartMap.remove(item);
      }
      notifyListeners();
    }
  }

  void removeItemCompletely(FoodItem item) {
    if (_cartMap.containsKey(item)) {
      _cartMap.remove(item);
      notifyListeners();
    }
  }

  double get totalPrice {
    double total = 0;
    _cartMap.forEach((food, quantity) {
      total += food.price * quantity;
    });
    return total;
  }

  int get itemCount => _cartMap.length;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        backgroundColor: Colors.red[900],
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  final List<FoodItem> allFoods = [
    FoodItem(name: 'Cheese Burger', category: 'Burger', price: 10.0, imagePath: 'images/sandwich-5930490_1280.jpg'),
    FoodItem(name: 'Double Burger', category: 'Burger', price: 12.0, imagePath: 'images/burger-3847279_1280.jpg'),
    FoodItem(name: 'Cheese Burger', category: 'Burger', price: 10.0, imagePath: 'images/istockphoto-496389174-612x612.jpg'),
    FoodItem(name: 'Double Burger', category: 'Burger', price: 12.0, imagePath: 'images/sandwich-5930494_1280.jpg'),
    FoodItem(name: 'Cheese Burger', category: 'Burger', price: 10.0, imagePath: 'images/burger-7383718_1280.jpg'),
    FoodItem(name: 'Double Burger', category: 'Burger', price: 12.0, imagePath: 'images/hamburger-7461299_1280.jpg'),

    FoodItem(name: 'Caesar Salad', category: 'Salad', price: 8.0, imagePath: 'images/istockphoto-1425572827-612x612.jpg'),
    FoodItem(name: 'Greek Salad', category: 'Salad', price: 9.0, imagePath: 'images/istockphoto-166130816-612x612.jpg'),
    FoodItem(name: 'Caesar Salad', category: 'Salad', price: 8.0, imagePath: 'images/istockphoto-1394777972-612x612.jpg'),
    FoodItem(name: 'Greek Salad', category: 'Salad', price: 9.0, imagePath: 'images/istockphoto-169986941-612x612.jpg'),
    FoodItem(name: 'Caesar Salad', category: 'Salad', price: 8.0, imagePath: 'images/istockphoto-937016542-612x612.jpg'),
    FoodItem(name: 'Greek Salad', category: 'Salad', price: 9.0, imagePath: 'images/istockphoto-505685702-612x612.jpg'),

    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'images/istockphoto-1144350231-612x612.jpg'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'images/istockphoto-545099646-612x612.jpg'),
    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'images/istockphoto-1152441440-612x612.jpg'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'images/istockphoto-1323890695-2048x2048.jpg'),
    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'images/istockphoto-936008054-612x612.jpg'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'images/istockphoto-1027738202-612x612.jpg'),

    FoodItem(name: 'Pepperoni Pizza', category: 'Pizza', price: 11.0, imagePath: 'images/istockphoto-1514290382-612x612.jpg'),
    FoodItem(name: 'Veggie Pizza', category: 'Pizza', price: 10.0, imagePath: 'images/istockphoto-1473906544-612x612.jpg'),
    FoodItem(name: 'Pepperoni Pizza', category: 'Pizza', price: 11.0, imagePath: 'images/istockphoto-153784617-612x612.jpg'),
    FoodItem(name: 'Veggie Pizza', category: 'Pizza', price: 10.0, imagePath: 'images/istockphoto-184946701-612x612.jpg'),
    FoodItem(name: 'Pepperoni Pizza', category: 'Pizza', price: 11.0, imagePath: 'images/istockphoto-1414575281-612x612.jpg'),
    FoodItem(name: 'Veggie Pizza', category: 'Pizza', price: 10.0, imagePath: 'images/istockphoto-1442417585-612x612.jpg'),

    FoodItem(name: 'Chickens Meal 1', category: 'Chickens', price: 13.0, imagePath: 'images/istockphoto-1369101558-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 2', category: 'Chickens', price: 14.0, imagePath: 'images/istockphoto-502474519-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 1', category: 'Chickens', price: 13.0, imagePath: 'images/istockphoto-835903320-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 2', category: 'Chickens', price: 14.0, imagePath: 'images/istockphoto-467639228-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 1', category: 'Chickens', price: 13.0, imagePath: 'images/istockphoto-531469196-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 2', category: 'Chickens', price: 14.0, imagePath: 'images/istockphoto-491487758-612x612.jpg'),
  ];

  final List<String> categories = ['All', 'Burger', 'Salad', 'Drinks', 'Pizza', 'Chickens'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<FoodItem> filteredFoods = selectedCategory == 'All'
        ? allFoods
        : allFoods.where((item) => item.category == selectedCategory).toList();

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hungry Today?\nFind your Meals',
              style: GoogleFonts.poppins(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ).animate().fade(duration: 500.ms).scale(),
            SizedBox(height: size.height * 0.02),
            _buildHealthyCard(size),
            SizedBox(height: size.height * 0.02),
            Wrap(
              spacing: size.width * 0.02,
              runSpacing: size.height * 0.01,
              children: categories.map((cat) {
                bool isSelected = (cat == selectedCategory);
                return GestureDetector(
                  onTap: () => setState(() => selectedCategory = cat),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(size.width * 0.04),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: size.width * 0.01,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      cat,
                      style: GoogleFonts.poppins(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                      color: Color(0xFFB20303),
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.015),
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: size.height * 0.015,
              crossAxisSpacing: size.width * 0.03,
              children: filteredFoods.map((food) => _buildFoodCard(food, size)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    final size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.red[900],
      elevation: 0,
      title: Text(
        'Hello Amy!',
        style: GoogleFonts.poppins(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: size.width * 0.045,
        ),
      ),
    );
  }

  Widget _buildHealthyCard(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(size.width * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: size.width * 0.01,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.03),
            child: Image.asset(
              'images/ezgif 1.png',
              width: size.width * 0.15,
              height: size.width * 0.15,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: size.width * 0.15,
                  height: size.width * 0.15,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.error, color: Colors.red),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: size.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Healthy food near you',
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  'Lorem ipsum dolor sit amet consectetur...',
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.035,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCard(FoodItem item, Size size) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * 0.04),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: size.width * 0.01,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.02),
                child: Image.asset(
                  item.imagePath,
                  height: size.height * 0.12,
                  width: size.width * 0.3,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: size.height * 0.12,
                      width: size.width * 0.3,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Text(
                  item.name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.035,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.005),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFEECC67),
                    fontWeight: FontWeight.w500,
                    fontSize: size.width * 0.03,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.02), // مسافة لزر الإضافة
            ],
          ),
          Positioned(
            bottom: size.height * 0.01,
            right: size.width * 0.01,
            child: IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.orange,
                size: size.width * 0.06,
              ),
              onPressed: () {
                cartProvider.addItem(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} added to cart!'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: Color(0xFFF3CB45),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  List<FoodItem> _searchResults = [];

  final List<FoodItem> allFoods = [
    FoodItem(name: 'Cheese Burger', category: 'Burger', price: 10.0, imagePath: 'images/sandwich-5930490_1280.jpg'),
    FoodItem(name: 'Double Burger', category: 'Burger', price: 12.0, imagePath: 'images/burger-3847279_1280.jpg'),
    FoodItem(name: 'Cheese Burger', category: 'Burger', price: 10.0, imagePath: 'images/istockphoto-496389174-612x612.jpg'),
    FoodItem(name: 'Double Burger', category: 'Burger', price: 12.0, imagePath: 'images/sandwich-5930494_1280.jpg'),
    FoodItem(name: 'Cheese Burger', category: 'Burger', price: 10.0, imagePath: 'images/burger-7383718_1280.jpg'),
    FoodItem(name: 'Double Burger', category: 'Burger', price: 12.0, imagePath: 'images/hamburger-7461299_1280.jpg'),

    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'images/istockphoto-1144350231-612x612.jpg'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'images/istockphoto-545099646-612x612.jpg'),
    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'images/istockphoto-1152441440-612x612.jpg'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'images/istockphoto-1323890695-2048x2048.jpg'),
    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'images/istockphoto-936008054-612x612.jpg'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'images/istockphoto-1027738202-612x612.jpg'),

    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'assets/cola.png'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'assets/lemonade.png'),
    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'assets/cola.png'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'assets/lemonade.png'),
    FoodItem(name: 'Cola', category: 'Drinks', price: 3.0, imagePath: 'assets/cola.png'),
    FoodItem(name: 'Lemonade', category: 'Drinks', price: 4.0, imagePath: 'assets/lemonade.png'),

    FoodItem(name: 'Pepperoni Pizza', category: 'Pizza', price: 11.0, imagePath: 'images/istockphoto-1514290382-612x612.jpg'),
    FoodItem(name: 'Veggie Pizza', category: 'Pizza', price: 10.0, imagePath: 'images/istockphoto-1473906544-612x612.jpg'),
    FoodItem(name: 'Pepperoni Pizza', category: 'Pizza', price: 11.0, imagePath: 'images/istockphoto-153784617-612x612.jpg'),
    FoodItem(name: 'Veggie Pizza', category: 'Pizza', price: 10.0, imagePath: 'images/istockphoto-184946701-612x612.jpg'),
    FoodItem(name: 'Pepperoni Pizza', category: 'Pizza', price: 11.0, imagePath: 'images/istockphoto-1414575281-612x612.jpg'),
    FoodItem(name: 'Veggie Pizza', category: 'Pizza', price: 10.0, imagePath: 'images/istockphoto-1442417585-612x612.jpg'),

    FoodItem(name: 'Chickens Meal 1', category: 'Chickens', price: 13.0, imagePath: 'images/istockphoto-1369101558-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 2', category: 'Chickens', price: 14.0, imagePath: 'images/istockphoto-502474519-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 1', category: 'Chickens', price: 13.0, imagePath: 'images/istockphoto-835903320-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 2', category: 'Chickens', price: 14.0, imagePath: 'images/istockphoto-467639228-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 1', category: 'Chickens', price: 13.0, imagePath: 'images/istockphoto-531469196-612x612.jpg'),
    FoodItem(name: 'Chickens Meal 2', category: 'Chickens', price: 14.0, imagePath: 'images/istockphoto-491487758-612x612.jpg'),
  ];

  @override
  void initState() {
    super.initState();
    _searchResults = [];
  }

  void _searchFood(String query) {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
    } else {
      final results = allFoods.where((food) {
        return food.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      setState(() => _searchResults = results);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Meals',
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: TextField(
              controller: _searchCtrl,
              onChanged: _searchFood,
              decoration: InputDecoration(
                hintText: 'Enter meal name...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFE7E1E1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: size.height * 0.015),
              ),
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? const Center(child: Text('No results found!'))
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final item = _searchResults[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                    child: Image.asset(
                      item.imagePath,
                      width: size.width * 0.12,
                      height: size.width * 0.12,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: size.width * 0.12,
                          height: size.width * 0.12,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          ),
                        );
                      },
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: GoogleFonts.poppins(fontSize: size.width * 0.035),
                  ),
                  subtitle: Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(fontSize: size.width * 0.03),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.orange,
                      size: size.width * 0.06,
                    ),
                    onPressed: () {
                      cartProvider.addItem(item);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.name} added to cart!'),
                          duration: const Duration(seconds: 1),
                          backgroundColor: Color(0xFF880505),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cart = Provider.of<CartProvider>(context);
    final cartMap = cart.cartMap;
    final items = cartMap.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart (${cart.itemCount})',
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: items.isEmpty
          ? const Center(child: Text('No items in cart yet!'))
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final quantity = cartMap[item]!;
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              child: Image.asset(
                item.imagePath,
                width: size.width * 0.12,
                height: size.width * 0.12,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: size.width * 0.12,
                    height: size.width * 0.12,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
            title: Text(
              item.name,
              style: GoogleFonts.poppins(fontSize: size.width * 0.035),
            ),
            subtitle: Text(
              '\$${item.price.toStringAsFixed(2)} x $quantity = \$${(item.price * quantity).toStringAsFixed(2)}',
              style: GoogleFonts.poppins(fontSize: size.width * 0.03),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Color(0xFFD90606),
                    size: size.width * 0.05,
                  ),
                  onPressed: () {
                    cart.removeOneItem(item);
                  },
                ),
                Text(
                  '$quantity',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.035,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Color(0xFF309B06),
                    size: size.width * 0.05,
                  ),
                  onPressed: () {
                    cart.addItem(item);
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: size.width * 0.01,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
              style: GoogleFonts.poppins(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            ElevatedButton(
              onPressed: () => _sendOrderViaWhatsApp(context, cart),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFAE262),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.03),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.015,
                ),
              ),
              child: Text(
                'Send Order via WhatsApp',
                style: GoogleFonts.poppins(
                  fontSize: size.width * 0.035,
                  color: Color(0xFF880505),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendOrderViaWhatsApp(BuildContext context, CartProvider cart) async {
    const phoneNumber = '+306981908678';
    String orderDetails = 'New Order:\n';

    cart.cartMap.forEach((foodItem, quantity) {
      orderDetails +=
      '${foodItem.name} (x$quantity) - \$${(foodItem.price * quantity).toStringAsFixed(2)}\n';
    });

    orderDetails += '\nTotal: \$${cart.totalPrice.toStringAsFixed(2)}';

    final encodedMessage = Uri.encodeComponent(orderDetails);
    final url = 'https://wa.me/$phoneNumber?text=$encodedMessage';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch WhatsApp')),
      );
    }
  }
}