import 'dart:convert';

import 'package:drivernew/pages/mapPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var driver = {};
  var order = {};
  @override
  void initState() {
    readJsonData();
    WebSocket();
    super.initState();
  
  }

  void readJsonData()async{
    final String response = await rootBundle.loadString('lib/data/driver.json');
    final data = await json.decode(response);
    print(data);
    setState(() {
      driver = data;
    });
  }

  Future<void> getOrderDetails(order) async {
  try {

    var url = Uri.https('esummit-back.onrender.com', 'order/getOrderById');
    var response = await http.post(
      url,
      body: jsonEncode({'id':order}),
      headers: {
        "Content-type": "application/json",
      },
    );
    print(response.body);
    setState(() {
      order = jsonDecode(response.body);
    });
    
  } catch (err) {
    print(err);
  }
}


  void handleAccept(order, driver) async {
    var url = Uri.https('esummit-back.onrender.com', 'order/updateOrder');
    var response = await http.post(
      url,
      body: jsonEncode({'id':order, 'driver': driver}),
      headers: {
        "Content-type": "application/json",
      },
    );
    
  }
  void WebSocket()async {
    final wsUrl = Uri.parse('wss://demo.piesocket.com/v3/channel_1230?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self');
    var channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      channel.sink.add('received!');
      if(message.toString().contains("newpickup:${driver['_id']}:")){
        var orderid = message.toString().split("newpickup:${driver['_id']}:")[1];
        print(orderid);
        getOrderDetails(orderid);
        showAlert();
      }
      print(message);
      channel.sink.close(status.goingAway);
    });
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("New Pickup Request"),
        content: const Text("Nit Bhopal Hostel no 9 , Bhopal, Madhya Pradesh"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(14),
              child: const Text("Reject",style: TextStyle(color: Colors.white)),
            ),
          ),

          TextButton(
            onPressed: () {
              handleAccept(order["_id"], driver["_id"]);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample()));
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text("Accept",style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Probable Garbage Pickups'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.maps_home_work),
                        title: Text('Papers'),
                        subtitle: Text(
                            "Nit Bhopal Hostel No 9 . Bhopal, Madhya Pradesh"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('CANCEL'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('CONFIRM'),
                            onPressed: () {
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}


// class NewPickup extends StatelessWidget {
//   const NewPickup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),
//       child: const Text(''),
//     );
//   }
// }