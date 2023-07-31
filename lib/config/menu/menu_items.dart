import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  
  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
    ),

  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
    ),

  MenuItem(
    title: 'Progress Indicators', 
    subTitle: 'Generales y Controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
    ),
  
  MenuItem(
    title: 'Snackbar y dialogos', 
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbar', 
    icon: Icons.info_outline
    ),

  MenuItem(
    title: 'Animated containers',  
    subTitle: 'Statefull widget animado', 
    link: '/animated', 
    icon: Icons.info_outline
    ),

  MenuItem(
    title: 'UI Control + Titles',  
    subTitle: 'Una serie de controles de Flutter', 
    link: '/ui_controls', 
    icon: Icons.car_rental_outlined
    ),

  MenuItem(
    title: 'Introduccion a la aplicación',  
    subTitle: 'Pequeño tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.accessible_forward_rounded
    ),

  MenuItem(
    title: 'InfiniteScroll y Pull',  
    subTitle: 'Lista inifinitas y pull ti refresh', 
    link: '/infinite',  
    icon: Icons.list_alt_rounded
    ),
];