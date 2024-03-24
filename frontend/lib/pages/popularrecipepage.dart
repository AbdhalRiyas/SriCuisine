import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/popularrecipe.dart';
import 'package:iconsax/iconsax.dart';

class PopularRecipePage extends StatefulWidget {
  final PopularRecipe popularrecipe;
  PopularRecipePage({required this.popularrecipe});

  @override
  State<PopularRecipePage> createState() => _PopularRecipePageState();
}

class _PopularRecipePageState extends State<PopularRecipePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    _scrollController.addListener(() {
      changeAppBarColor(_scrollController);
    });
  }

  Color appBarColor = Colors.transparent;

  changeAppBarColor(ScrollController scrollController) {
    if (scrollController.position.hasPixels) {
      if (scrollController.position.pixels > 2.0) {
        setState(() {
          appBarColor = Colors.transparent;
        });
      }
      if (scrollController.position.pixels <= 2.0) {
        setState(() {
          appBarColor = Colors.transparent;
        });
      }
    } else {
      setState(() {
        appBarColor = Colors.transparent;
      });
    }
  }

  // // fab to write review
  // showFAB(TabController tabController) {
  //   int reviewTabIndex = 2;
  //   if (tabController.index == reviewTabIndex) {
  //     return true;
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                child: const Text("Start Cooking"),
              ),
            ),
            // const SizedBox(width: 10),
            // Expanded(
            //   child: IconButton(
            //     onPressed: () {},
            //     style: IconButton.styleFrom(
            //       shape: CircleBorder(
            //         side: BorderSide(
            //           color: Colors.grey.shade300,
            //           width: 2,
            //         ),
            //       ),
            //     ),
            //     icon: Icon(
            //       // widget.food.isLiked ? Iconsax.heart5 : Iconsax.heart,
            //       // color: widget.food.isLiked ? Colors.red : Colors.black,
            //       // size: 20,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),

      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AnimatedContainer(
          color: appBarColor,
          duration: const Duration(milliseconds: 200),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            // title: const Text('Search Recipe',
            //     style: TextStyle(
            //         fontFamily: 'inter',
            //         fontWeight: FontWeight.w400,
            //         fontSize: 16)),
            // leading: IconButton(
            //   onPressed: () => Navigator.pop(context),
            //   style: IconButton.styleFrom(
            //     backgroundColor: Colors.yellow[50],
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     fixedSize: const Size(5, 50),
            //   ),
            //   icon: const Icon(CupertinoIcons.chevron_back),
            // ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: const Icon(Iconsax.heart,
            //           color: Colors.white)),
            // ],
            //systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
      ),
      // Post Review FAB
      // floatingActionButton: Visibility(
      //   visible: showFAB(_tabController),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               content: Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 height: 150,
      //                 color: Colors.white,
      //                 child: const TextField(
      //                   keyboardType: TextInputType.multiline,
      //                   minLines: 6,
      //                   decoration: InputDecoration(
      //                     hintText: 'Write your review here...',
      //                   ),
      //                   maxLines: null,
      //                 ),
      //               ),
      //               actions: [
      //                 Row(
      //                   children: [
      //                     Container(
      //                       width: 120,
      //                       child: TextButton(
      //                         onPressed: () {
      //                           Navigator.of(context).pop();
      //                         },
      //                         style: TextButton.styleFrom(
      //                           foregroundColor: Colors.grey[600],
      //                         ),
      //                         child: const Text('cancel'),
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: Container(
      //                         child: ElevatedButton(
      //                           onPressed: () {},
      //                           style: ElevatedButton.styleFrom(
      //                           backgroundColor: Colors.yellow,
      //                           ),
      //                           child: const Text('Post Review'),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             );
      //           });
      //     },
      //     child: const Icon(Icons.edit),
      //     backgroundColor: Colors.yellow,
      //   ),
      // ),
      body: ListView(
        controller: _scrollController,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        // physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Recipe Image
          GestureDetector(
            // onTap: () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => FullScreenImage(
            //           image:
            //               Image.asset(widget.data.photo, fit: BoxFit.cover))));
            // },
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.popularrecipe.image),
                      fit: BoxFit.cover)),
              child: SizedBox(
                //decoration: BoxDecoration(gradient: AppColor.linearBlackTop),
                height: 280,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          // Section 2 - Recipe Info
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 16),
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe Calories and Time
                Row(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        "${widget.popularrecipe.cal} Cal",
                        style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 50),
                    const Icon(
                      Icons.alarm,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        "${widget.popularrecipe.time} min",
                        style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 50),
                    const Icon(
                      Iconsax.user,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        "${widget.popularrecipe.servings} servings",
                        style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                    // const SizedBox(width: 20),
                    // const Icon(Iconsax.user),
                    // Text(
                    //   "${widget.recipe.servings} servings",
                    //   style: const TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // ),
                  ],
                ),
                // Recipe Title
                Container(
                  margin: const EdgeInsets.only(bottom: 16, top: 16),
                  child: Text(
                    widget.popularrecipe.name,
                    style: const TextStyle(
                      //color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Recipe Description
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.dining_outlined),
                        const SizedBox(width: 5),
                        Text(
                          "Dish Type: ${widget.popularrecipe.course}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.yellow[100],
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text(
                      "Allergens: ${widget.popularrecipe.allergens}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Tabbar ( Ingridients, Tutorial, Reviews )
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.yellow[100],
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  _tabController.index = index;
                });
              },
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black.withOpacity(0.6),
              labelStyle: const TextStyle(
                  fontFamily: 'inter', fontWeight: FontWeight.w500),
              indicatorColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Ingridients',
                ),
                Tab(
                  text: 'Tutorial',
                ),
                // Tab(
                //   text: 'Reviews',
                // ),
              ],
            ),
          ),
          // IndexedStack based on TabBar index
          IndexedStack(
            index: _tabController.index,
            children: [
              // Ingridients
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      widget.popularrecipe.ingredients,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'inter',
                      ),
                    );
                  },
                ),
              // Tutorials
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 1,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      widget.popularrecipe.instructions,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    );
                  },
                ),
              // Reviews
              // if (widget.data.reviews != null)
              //   ListView.builder(
              //     shrinkWrap: true,
              //     padding: EdgeInsets.zero,
              //     itemCount: widget.data.reviews!.length,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return ReviewTile(data: widget.data.reviews![index]);
              //     },
              //   )
            ],
          ),
        ],
      ),
    );
  }
}
