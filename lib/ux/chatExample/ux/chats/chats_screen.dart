import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Column(
        children: [
          const CustomAppBar(),
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF151718),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  hintText: 'Search your friend',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  focusColor: Colors.grey,
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                keyboardType: TextInputType.text,
                cursorColor: Colors.grey,
              ),
            ),
          ),*/
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: (index == 9)
                      ? const EdgeInsets.only(bottom: 110)
                      : EdgeInsets.zero,
                  child: const ChatItem(),
                ),
              ),
              itemCount: 10,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF292929),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 15,
                      height: 15,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFF21CF72),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const Text(
                    'Richar mateo',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                'helo dfdfd frffdfdfdfdfkjldhfd fdfdf',
                style: TextStyle(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 35,
                )),
          ),
          const Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Chats',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
              size: 40,
            ),
          ))
        ],
      ),
    );
  }
}
