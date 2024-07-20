import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  // Define the widgets/screens for each tab
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    CartScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(




      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Color(0xFF513597),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Color(0xFF513597),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xFF6945B8),
            padding: EdgeInsets.all(16),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(icon: Icons.home,
                text: 'Home',
              ),

              GButton(icon: Icons.search_sharp,
                text: 'Search',),
              GButton(icon: Icons.favorite_border,
                text: 'Wishlist',),
              GButton(icon: Icons.shopping_cart_outlined,
                text: 'Cart',),

            ],
          ),
        ),
      ),
    );
  }
}




// Define HomeScreen widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  int indexselect = 0;


  // CarouselSlider List
  List<String> imagePaths = [
    "Images/black1.jpg",
    "Images/bag.png",
    "Images/online-shopping.jpg"
  ];
  List<String> imageIcon = [
    "Images/Keyboard.png",
    "Images/mouse.png",
    "Images/Phone.png",
    "Images/Vector.png",
    "Images/Screen.png"
  ];
  List<String> IconText = [
    'Keyboard',
    'Mice',
    'Mobile',
    'Headphone',
    'Monitor'
  ];

  final List<String> items = [
    'Images/Dell.png',
    'Images/earbuds.webp',
    'Images/keyboard.jpg',
    'Images/powerbank.jpg',
    'Images/tv.jpg',
    'Images/laptop.webp'
  ];

  final List<String> itemsname = [
    'Dell Laptop',
    'Ear Buds',
    'Keyboard',
    'Powerbank',
    'TV',
    'Acer Laptop',


  ];

  final List<String> itemsprice = [
    'Rs 72,700',
    'Rs 2,000',
    'Rs 1,300',
    'Rs 999',
    'Rs 23,000',
    '50,500',


  ];


  Widget build(BuildContext context) {
    return Scaffold(

      // AppBar
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Text('SHOPSAGE',
            style: TextStyle(color: Color(0xFF5F449F),fontSize: 35,fontWeight: FontWeight.w900),),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(image: AssetImage('Images/maleprofile.jpg'),height: 60)),
            ),
          ),

        ],

      ),

      body: ListView(
        children: [
          SizedBox(height: 40,),


          // CarouselSlider
          Container(
            alignment: Alignment.center,
            child: CarouselSlider.builder(itemCount: 3, itemBuilder: (context, index, realIndex) {
              return Container(
                decoration: BoxDecoration(image:DecorationImage(image: AssetImage(imagePaths[index]),fit: BoxFit.fill),borderRadius: BorderRadius.circular(20) ),

              );
            },  options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  indexselect = index;
                });
              },
              autoPlay: true,
              height: 200,
              viewportFraction:0.8,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: Duration(seconds: 1),

            )),


          ),
          SizedBox(height: 20,),

          // AnimatedSmoothIndicator
          Center(
            child: AnimatedSmoothIndicator(

              activeIndex: indexselect,
              count: 3,
              duration: Duration(seconds: 1),
              effect: ScrollingDotsEffect(),
            ),
          ),

          // Text Categories
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text("Categories",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
          ),


          Center(
            child: Container(
              height: 121,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child:ListView.builder(
                shrinkWrap: true,
                itemCount: imageIcon.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF5F449F),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image(
                            image: AssetImage(imageIcon[index]),
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8), // Adjust the height between the image and text
                        Container(
                          width: 56, // Ensure the text is centered under the image container
                          child: Text(
                            IconText[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),





            ),
          ),


          // SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text('Recomented For You',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          ),

          Container(
            height: 800,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 9/13
                ),
                itemCount: 6,
                itemBuilder: (context, int i) {
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {

                      },
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 5,
                                  offset: Offset(3, 3)
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: Image.asset(items[i],height: 100),
                            ),

                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                    child: Text(itemsname[i],
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17
                                      ),

                                    ),

                                  ),

                                ),

                                SizedBox(height: 15,),



                                Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                    child: Text(itemsprice[i],
                                      style: TextStyle(color: Colors.black38,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),

                                    ),



                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },),
            ),
          )


        ],

      ),


    );
  }
}




// Define SearchScreen widget
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<String> _searchResults = [];
  List<String> _recentSearches = [];
  List<String> IconText = [
    'Keyboard',
    'Mice',
    'Mobile',
    'Headphone',
    'Monitor'
  ];

  void _clearRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  void _handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear();
      } else {
        _searchResults = IconText
            .where((text) => text.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.purpleAccent),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _handleSearch,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Search in Store',
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 40),
            // Your existing UI components...

            Column(
              children: [


                // Recent Searches Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Searches',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: _clearRecentSearches,
                        child: Text(
                          'Clear All',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Display recent searches
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _recentSearches.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Chip(
                          label: Text(_recentSearches[index]),
                          backgroundColor: Colors.purple[100],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),


          ],
        ),

      ),
    );
  }
}




// Define WishlistScreen widget
// class WishlistScreen extends StatefulWidget {
//   const WishlistScreen({super.key});
//
//
//
//   @override
//
//   State<WishlistScreen> createState() => _WishlistScreenState();
//
//   void setState(Null Function() param0) {}
// }
//
// class _WishlistScreenState extends State<WishlistScreen> {
//   final TextEditingController _searchController = TextEditingController();
//
//   List<String> _searchResults = [];
//   List<String> _recentSearches = [];
//
//
//   bool _isTapped = false;
//
//   void _toggleImageColor() {
//     setState(() {
//       _isTapped = !_isTapped;
//     });
//   }
//
//   @override
//
//
//   void _clearRecentSearches() {
//     setState(() {
//       _recentSearches.clear();
//     });
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white12,
//       appBar: AppBar(
//         title: Padding(
//           padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
//           child: Text('WISHLIST',
//             style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w900),),
//         ),
//
//         actions: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
//             child: GestureDetector(
//               onTap: (){
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfilePage()),
//                 );
//               },
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image(image: AssetImage('Images/maleprofile.jpg'),height: 60)),
//             ),
//           ),
//
//         ],
//
//       ),
//
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(290, 16, 0, 0),
//             child: TextButton(
//               onPressed: _clearRecentSearches,
//               child: Text(
//                 'Clear All',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20
//                 ),
//               ),
//             ),
//           ),
//
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 140,
//               width: 500,
//
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.grey[300],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Image.asset('Images/oneplus.png',height: 100,),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
//                       child: Column(
//                         children: [
//                           Text('OnePlus Nord CE 3',style: TextStyle(),),
//                           Text('Rs 19,999'),
//
//                           TextButton(onPressed: () {
//
//                           }, child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color(0xFF513597),
//                                 borderRadius: BorderRadius.circular(20)
//                             ),
//
//                             child: Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Text('Add to Cart',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20),),
//                             ),
//                           ))
//                         ],
//                       ),
//
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
//                       child: GestureDetector(
//                           onTap: _toggleImageColor,
//                           child: Image.asset('Images/iconsheart2.png',
//
//                             color: _isTapped ? Colors.red : null,
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//
//
//
//
//
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 140,
//               width: 500,
//
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.grey[300],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Image.asset('Images/laptop.webp',height: 100,),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
//                       child: Column(
//                         children: [
//                           Text('Acer Laptop',style: TextStyle(),),
//                           Text('Rs 69,999'),
//
//                           TextButton(onPressed: () {
//
//                           }, child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color(0xFF513597),
//                                 borderRadius: BorderRadius.circular(20)
//                             ),
//
//                             child: Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Text('Add to Cart',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20),),
//                             ),
//                           ))
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
//                       child: GestureDetector(
//                           onTap: _toggleImageColor,
//                           child: Image.asset('Images/iconsheart2.png',
//
//                             color: _isTapped ? Colors.red : null,
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//
//
//
//
//
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 140,
//               width: 500,
//
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.grey[300],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     Image.asset('Images/keyboard.jpg',height: 100,),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
//                       child: Column(
//                         children: [
//                           Text('Wireless Keyboard',style: TextStyle(),),
//                           Text('Rs 3,200'),
//
//                           TextButton(onPressed: () {
//
//                           }, child: Container(
//                             decoration: BoxDecoration(
//                                 color: Color(0xFF513597),
//                                 borderRadius: BorderRadius.circular(20)
//                             ),
//
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Text('Add to Cart',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20),),
//                             ),
//                           ))
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
//                       child: GestureDetector(
//                           onTap: _toggleImageColor,
//                           child: Image.asset('Images/iconsheart2.png',
//
//                             color: _isTapped ? Colors.red : null,
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//
//
//
//
//     );
//   }
// }



class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});



  @override

  State<WishlistScreen> createState() => _WishlistScreenState();

  void setState(Null Function() param0) {}
}
class _WishlistScreenState extends State<WishlistScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<String> _searchResults = [];
  List<String> _recentSearches = [];
  List<bool> _isTappedList = List<bool>.filled(3, false); // Adjust the length based on the number of items

  void _toggleImageColor(int index) {
    setState(() {
      _isTappedList[index] = !_isTappedList[index];
    });
  }

  void _clearRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Text(
            'WISHLIST',
            style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.w900),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image: AssetImage('Images/maleprofile.jpg'), height: 60),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(290, 16, 0, 0),
            child: TextButton(
              onPressed: _clearRecentSearches,
              child: Text(
                'Clear All',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          // Item 1
          _buildWishlistItem(0, 'Images/oneplus.png', 'OnePlus Nord CE 3', 'Rs 19,999'),
          // Item 2
          _buildWishlistItem(1, 'Images/laptop.webp', 'Acer Laptop', 'Rs 69,999'),
          // Item 3
          _buildWishlistItem(2, 'Images/keyboard.jpg', 'Wireless Keyboard', 'Rs 3,200'),
        ],
      ),
    );
  }

  Widget _buildWishlistItem(int index, String imagePath, String title, String price) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Row(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  child: Image.asset(imagePath, height: 100)),
              SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Column(
                  children: [
                    Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(price ,style: TextStyle(fontSize: 14, color: Colors.grey[700]),),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF513597),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: GestureDetector(
                  onTap: () => _toggleImageColor(index),
                  child: Image.asset(
                    'Images/iconsheart2.png',
                    color: _isTappedList[index] ? Colors.red : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}














// Define CartScreen widget
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    if (_count > 1) {
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Center(
            child: Text('CART',
              style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w900),),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 30, 0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(image: AssetImage('Images/maleprofile.jpg'),height: 60)),
            ),
          ),

        ],

      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140,
              width: 500,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset('Images/oneplus.png',height: 100,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                      child: Column(
                        children: [
                          Text('OnePlus Nord CE 3',style: TextStyle(),),
                          Text('Rs 19,999'),
                          Text('In Stock',style: TextStyle(color: Colors.purple[300]),),



                        ],
                      ),

                    ),

                    Spacer(),
                    Row(
                      children: [
                        IconButton(style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                          icon: Icon(Icons.remove,),
                          onPressed: _decrementCount,
                        ),
                        Text(
                          '$_count',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5F449F)),

                          ),
                          icon: Icon(Icons.add),
                          onPressed: _incrementCount,
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),




          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140,
              width: 500,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset('Images/earbuds.webp',height: 100,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26, 8, 0, 0),
                      child: Column(
                        children: [
                          Text('Ear Buds',style: TextStyle(),),
                          Text('Rs 999'),
                          Text('In Stock',style: TextStyle(color: Colors.purple[300]),),



                        ],
                      ),

                    ),

                    Spacer(),
                    Row(
                      children: [
                        IconButton(style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                          icon: Icon(Icons.remove,),
                          onPressed: _decrementCount,
                        ),
                        Text(
                          '$_count',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF5F449F)),

                          ),
                          icon: Icon(Icons.add),
                          onPressed: _incrementCount,
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),






        ],
      ),
    );
  }
}










