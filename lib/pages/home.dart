
import 'package:flutter/material.dart';

import '../api/api_controller.dart';

class home_Page extends StatefulWidget {
  const home_Page({Key? key}) : super(key: key);

  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {
  ApiController controller = ApiController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: Image.asset('assets/sam.png'),
        actions: [
          Padding(padding: EdgeInsets.only(right: 8.0),
          child: Image.asset('assets/pic.png'),)],
      ),
      body: Stack(
    children: [
    Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/Man.png'),
                ),
                Column(
                  children: [
                    Text(
                      "50",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Post",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "564",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "564",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Following",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rayan Moon',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Photographer',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    '🌟 You are beautiful, and Im here to capture it! 🌟',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF28426B)
                      ,
                    ),
                    child: const Text(
                      'Wallet',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300]
                    ,
                  ),
                  child: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.2,
            color: Colors.grey[400],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('Photos'), Text('Videos')],
          ),
          Divider(
            thickness: 0.2,
            color: Colors.grey[400],
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.fetchData(),
              builder: (
                  BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot,
                  ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<dynamic> media = snapshot.data!['media'];
                  return media.isEmpty
                      ? const Center(
                    child: Icon(Icons.photo_library),
                  )
                      : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      childAspectRatio: 9/16,
                    ),
                    itemCount: media.length,
                    itemBuilder: (
                        BuildContext context,
                        int index,
                        ) {
                      final post = media[index];
                      return GestureDetector(
                        onTap: () {
                          // Handle image tap
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(post['filePath']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  Text(post['likeCount'].toString(),
                                      style: const TextStyle(
                                          color: Colors.white))
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.comment,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    post['commentCount'].toString(),
                                    style: const TextStyle(
                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 0,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 22, 49, 87),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
color: Colors.white,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),

              Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.ondemand_video_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
            ],
          ),
        ),
      )
    ],),

    );
  }
}