import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile({
    @required String title,
    @required String subtitle,
    @required bool currentValue,
    @required Function onSwitch,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: onSwitch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your recipes section',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  title: 'Gluten free',
                  subtitle: 'Only include gluten free recipes',
                  currentValue: _glutenFree,
                  onSwitch: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian recipes',
                  currentValue: _vegetarian,
                  onSwitch: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Vegan',
                  subtitle: 'Only include vegan recipes',
                  currentValue: _vegan,
                  onSwitch: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
              _buildSwitchListTile(
                  title: 'Lactose free',
                  subtitle: 'Only include lactose free recipes',
                  currentValue: _lactoseFree,
                  onSwitch: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
