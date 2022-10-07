import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIoProvider extends ChangeNotifier {
  late final io.Socket socket;
  void init() {
    socket = io.io(
        'http://192.168.20.24:3000',
        //'http://192.168.1.251:3000',
        //'http://localhost:3000',
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.connect();
    socket.on('event', (data) => print(data));
    socket.emit("msg", "hola desde el cliente");
    socket.emit("connectionUser", "3112422857");
  }
}
