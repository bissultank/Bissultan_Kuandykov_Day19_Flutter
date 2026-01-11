import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_lesson19/core/utils/image_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_box_outlined),
          ),
        ],
        title: Row(
          spacing: 5.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home screen"),
            Icon(
              Icons.home,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              
              // Локальное изображение
              Image.asset(
                ImageUtil.image1,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              
              SizedBox(height: 20),
              
              // Сетевое изображение
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  "https://losko.ru/wp-content/uploads/2019/11/cover-1.jpg",
                  semanticLabel: "Картина",
                  fit: BoxFit.cover,
                  width: 200.0,
                  height: 200.0,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(Icons.broken_image),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress?.expectedTotalBytes != null) {
                      final int percentage =
                          ((loadingProgress!.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!) *
                                  100)
                              .toInt();

                      log(
                        "$percentage",
                        name: "Progress %:",
                      );
                    }

                    if (loadingProgress?.cumulativeBytesLoaded ==
                        loadingProgress?.expectedTotalBytes) {
                      return child;
                    }

                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                ),
              ),
              
              SizedBox(height: 20),
              
              // Иконка
              Icon(
                Icons.image,
                size: 50,
                color: Colors.blue,
              ),
              
              SizedBox(height: 20),
              
              // SVG иконки
              SvgPicture.asset(
                IconUtil.icon1,
                height: 100.0,
                width: 100.0,
              ),
              SvgPicture.asset(
                IconUtil.icon2,
                height: 100.0,
                width: 100.0,
              ),
              SvgPicture.asset(
                IconUtil.icon3,
                height: 100.0,
                width: 100.0,
              ),
              
              SizedBox(height: 20),
              
              // Галерея GridView
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    // Локальные изображения
                    Container(
                      height: 150,
                      child: Image.asset(
                        ImageUtil.image1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Image.asset(
                        ImageUtil.image2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Сетевые изображения
                    Container(
                      height: 150,
                      child: Image.network(
                        "https://picsum.photos/200/200?random=1",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Image.network(
                        "https://picsum.photos/200/200?random=2",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Image.network(
                        "https://picsum.photos/200/200?random=3",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Image.network(
                        "https://picsum.photos/200/200?random=4",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
