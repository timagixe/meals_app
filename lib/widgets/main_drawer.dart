import 'package:flutter/material.dart';
import 'package:meals_app/routes/routes.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({
    @required IconData icon,
    @required String title,
    @required Function onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(kAppInitialRoute);
            },
          ),
          buildListTile(
            icon: Icons.filter_alt_sharp,
            title: 'Filters',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.FILTERS);
            },
          )
        ],
      ),
    );
  }
}
