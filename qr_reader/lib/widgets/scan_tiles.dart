import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({
    Key? key,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    final scans = scanListProvider.scans;

    return Scaffold(
      body: ListView.builder(
          itemCount: scans.length,
          itemBuilder: (_, i) => Dismissible(
                key: // El key le dice al dismissable que elemento tiene que borrarse
                    UniqueKey(), //Cuando no nos interesa el key podemos usar UniqueKey que se encarga de generar un key unico
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (DismissDirection direction) {
                  Provider.of<ScanListProvider>(context, listen: false)
                      .borraScanPorId(scans[i].id!);
                },
                child: ListTile(
                  leading: Icon(
                    tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(scans[i].valor),
                  subtitle: Text(scans[i].id.toString()),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                  onTap: () => launchUrlAddress(context, scans[i]),
                ),
              )),
    );
  }
}
