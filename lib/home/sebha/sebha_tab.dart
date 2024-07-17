import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../provider/app_mode_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  String _currentText = 'سبحان الله';
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 33) {
        _changeText();
        _counter = 0;
      }
      _controller.forward(from: 0.0);
    });
  }

  void _changeText() {
    if (_currentText == 'سبحان الله') {
      _currentText = 'الحمد لله';
    } else if (_currentText == 'الحمد لله') {
      _currentText = 'الله اكبر';
    } else {
      _currentText = 'سبحان الله';
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppModeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20.0, bottom: 0.0),
            child: Column(
              children: [
                Image.asset('assets/images/head_sebha_logo.png'),
                SizedBox(height: 0),
                RotationTransition(
                  turns: _animation,
                  child: Image.asset('assets/images/body_sebha_logo.png'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'عدد التسبيحات',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 23.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: provider.isDarkMode()
                            ? AppColors.primaryDarkColor
                            : AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text('$_counter',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.whiteColor)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 12.0),
                        child: Text(
                          _currentText,
                          style: TextStyle(
                              color: provider.isDarkMode()
                                  ? AppColors.primaryDarkColor
                                  : AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: provider.isDarkMode()
                            ? AppColors.yellowColor
                            : AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
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
