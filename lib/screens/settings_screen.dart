import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value, 
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações')
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline1
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem glúten', 
                  'Só exibe refeições sem glúten', 
                  settings.isGlutenFree, 
                  (value) => setState(() => {
                    settings.isGlutenFree = value
                  })
                ),

                _createSwitch(
                  'Sem lactose', 
                  'Só exibe refeições sem lactose', 
                  settings.isLactoseFree, 
                  (value) => setState(() => {
                    settings.isLactoseFree = value
                  })
                ),

                _createSwitch(
                  'Veganas', 
                  'Só exibe refeições veganas', 
                  settings.isVegan, 
                  (value) => setState(() => {
                    settings.isVegan = value
                  })
                ),

                _createSwitch(
                  'Vegetarianas', 
                  'Só exibe refeições Vegetarianas', 
                  settings.isVegetarian, 
                  (value) => setState(() => {
                    settings.isVegetarian = value
                  })
                )
              ],
            ),
          )
        ],
      )
    );
  }
}