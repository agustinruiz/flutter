import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
   
  const BasicDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen
          const Image(image: AssetImage('assets/Landscape.jpg')),
          // Titulo
          const Title(),
          // Button Section
          const ButtonSection(),
          // Description
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Text('Ipsum eu dolore sit ea eu occaecat occaecat tempor ipsum exercitation. Nisi nulla exercitation dolor duis velit. Sint laboris do labore excepteur in. Eu dolor veniam sunt officia minim officia nulla elit consequat irure enim reprehenderit aliqua. Cillum labore incididunt veniam eu id. Adipisicing sint incididunt Lorem Lorem est nostrud occaecat ea et nostrud est. Magna irure sunt reprehenderit id nisi laboris. Ullamco exercitation amet ullamco nulla culpa cupidatat veniam consectetur nostrud ipsum mollit tempor mollit Lorem. Lorem aliqua aliquip amet commodo minim. Ullamco ullamco ex proident aliquip proident cillum voluptate et ullamco laborum. Fugiat excepteur excepteur id ut ex occaecat cillum Lorem non pariatur. Duis esse adipisicing sunt adipisicing.')
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Titulo principal de app de ejemplo', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Titulo secundario', style: TextStyle(color: Colors.black45),),
              
            ],
          ),

          Expanded(child: Container()), // el expanded dentro de una columna o un row se expande todo lo que pueda.

          const Icon(Icons.star, color: Colors.red,),

          const Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(icon: Icons.call, text: 'CALL',),
          CustomButton(icon: Icons.route, text: 'ROUTE',),
          CustomButton(icon: Icons.share_rounded, text: 'SHARE',),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final String text;

  const CustomButton({
    Key? key, 
    required this.icon, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue,size: 30,),
        Text(text, style: const TextStyle(color: Colors.blue),)
      ],
    );
  }
}

