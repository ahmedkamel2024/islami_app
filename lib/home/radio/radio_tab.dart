import 'package:flutter/material.dart';

import '../../app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/radio_logo.png'),
              // Update the path to your radio image
              SizedBox(height: 20),
              Text(
                'إذاعة القرآن الكريم',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.skip_previous,
                      size: 60,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      // Add your previous button functionality here
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      size: 60,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      // Add your play button functionality here
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.skip_next,
                      size: 60,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      // Add your next button functionality here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
