import 'package:bachavsetu/utils/user_preferences.dart';
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
    _socket = IO.io('http://192.168.72.160:5000/client',
        OptionBuilder().setTransports(['websocket']).build());
    _socket!.onConnect((data) {
      if (UserPreferences.getToken() != null) {
        _socket?.emit("verify_token", {
          'phone': UserPreferences.getPhone(),
          'token': UserPreferences.getToken()
        });
      } else {
        print("Warning: User has not generated a token yet!!");
      }
      print("Connection Estabilished");
    });
    _socket!.onConnectError((data) => print('Connect error: $data'));
    _socket!.onDisconnect((data) {
      // _socket!.disconnect();
      print("Socket IO server wants to disconnect");
    });
  }

  static void closeSocket() {
    if (_socket != null) {
      _socket!.disconnect();
    }
  }
}
