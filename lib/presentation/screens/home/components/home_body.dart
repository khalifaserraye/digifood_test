import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:digifood/presentation/constants/app_colors.dart';
import 'package:digifood/presentation/constants/url.dart';
import 'package:digifood/presentation/screens/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Displaying the logo image
              Image.network(
                logoUrl,
                fit: BoxFit.contain,
                width: 200.r,
              ),
              SizedBox(height: 24.h),
              // Text widget displaying a message
              Text(
                "The POS that boosts the revenues of your",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.r,
                  color: mainColor,
                ),
                textAlign: TextAlign.center,
              ),
              // Container for animated text
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.r),
                height: 100.h,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 48.r,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('Stadium'),
                      RotateAnimatedText('Arena'),
                      RotateAnimatedText('Food court'),
                      RotateAnimatedText('Parc expo'),
                      RotateAnimatedText('Theme park'),
                      RotateAnimatedText('Festival'),
                      RotateAnimatedText('Concert hall'),
                    ],
                  ),
                ),
              ),
              // Text widget displaying a message
              Text(
                "An innovative sales solution for restaurateurs operating across a multitude of outlets, in locations like no other.",
                style: TextStyle(fontSize: 16.r, color: mainColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              // Container containing a button to navigate to the product list screen
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: secondaryColor),
                child: TextButton(
                  onPressed: () {
                    // Navigate to the product list screen
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const ProductListScreen(),
                        transitionDuration: const Duration(seconds: 0),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Show products",
                        style:
                            TextStyle(color: backgroundColor, fontSize: 16.r),
                      ),
                      SizedBox(width: 8.r),
                      const Icon(
                        Icons.arrow_forward,
                        color: backgroundColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
