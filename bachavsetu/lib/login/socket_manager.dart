import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  static IO.Socket? _socket;

  // Private constructor to prevent instantiation
  SocketManager._();

  static Socket getSocket() {
    if (_socket == null) {
      // Create a new socket instance if it doesn't exist or is closed
      _createSocket();
    }
    return _socket!;
  }

  static void _createSocket() {
    _socket = IO.io('http://192.168.72.216:5000/client',
        OptionBuilder().setTransports(['websocket']).build());
    _socket!.onConnect((data) => print("Connection Estabilished"));
    _socket!.onConnectError((data) => print('Connect error: $data'));
    _socket!.onDisconnect((data) {
      _socket!.disconnect();
      print("Socket IO server disconnected");
    });
  }

  static void closeSocket() {
    if (_socket != null) {
      _socket!.disconnect();
    }
  }
}
