import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const String name = 'ui_control_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDevelepore = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBareakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDevelepore,
          onChanged: (value) => setState(() {
            isDevelepore = !isDevelepore;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehículo de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('By Card'),
                subtitle: const Text('Viajar por carro'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = Transportation.car;
                    }))),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Viajar por Barco'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    }))),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Viajar por Avion'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    }))),
            RadioListTile(
                title: const Text('By Submarine'),
                subtitle: const Text('Viajar por Sub-Marino'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    }))),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Quieres desayuno?'),
          value: wantsBareakfast, 
          onChanged: (value) => setState(() {
            wantsBareakfast = !wantsBareakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Quieres almuerzo?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Quieres cena?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
             wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
