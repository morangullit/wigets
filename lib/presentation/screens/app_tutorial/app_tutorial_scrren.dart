import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title, 
    this.caption, 
    this.imageUrl);

}


final slides = <SlideInfo>[
  SlideInfo('Buscar la comida', 'Id elit ipsum pariatur nostrud exercitation pariatur fugiat id elit nisi exercitation culpa deserunt ullamco.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Ut sit esse anim pariatur dolor officia est enim ut eiusmod do ut.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Fugiat nisi cillum dolore quis proident velit.', 'assets/images/3.png'),
];


class AppTutorialScreen extends StatefulWidget {
  
  static const String name = 'tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() { 
      
      final page = pageviewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }


  @override
  void dispose() {
    
    pageviewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideDate) => _Slide(
              title: slideDate.title, 
              caption: slideDate.caption, 
              imageUrl: slideDate.imageUrl
            )).toList(),
          ),


          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: const Text('Salir') 
            )
          ),

          endReached ?
          Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 500),
              child: FilledButton(
                onPressed: () => context.pop(), 
                child: const Text('Comenzar')
              ),
            )
          ) : const SizedBox()


        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
            
          ],
        ),
      ),
    );
  }
}