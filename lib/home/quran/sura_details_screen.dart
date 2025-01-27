import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/quran/item_sura_details.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      Image.asset('assets/images/main_background.png'),
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.06,
                ),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColors.primaryColor,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetails(
                      content: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
