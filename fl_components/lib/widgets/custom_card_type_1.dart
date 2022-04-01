import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album, color: AppTheme.primary,),
            title: Text('Soy un titulo'),
            subtitle: Text('Adipisicing officia dolore ipsum amet ad. Voluptate quis aliqua pariatur nulla irure Lorem irure sint eiusmod. Mollit dolore excepteur dolor sint excepteur in amet excepteur ea cupidatat velit nostrud. Culpa duis laborum ut aliquip minim esse.'),
          ),
          Padding( // envielvo el row de los botones en el padding para separarlos del borde
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Ok')
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}