import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

import '../../components/item_list.dart';

const _tituloAppBar = 'Transferências';

class ListTransfer extends StatefulWidget {
  ListTransfer({Key? key}) : super(key: key);
  final List<Transfer> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListTransferState();
  }
}

class ListTransferState extends State<ListTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transfer = widget._transferencias[indice];
          return Item(
            title: transfer.valor.toString(),
            subtitle: transfer.accountNumber.toString(),
            icon: Icons.monetization_on,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormTransfer();
          })).then((transfer) {
            // Testar tempo de delay
            Future.delayed(const Duration(seconds: 0), () {
              _atualiza(transfer);
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transfer? transfer) {
    if (transfer != null) {
      setState(() {
        widget._transferencias.add(transfer);
      });
    }
  }
}
