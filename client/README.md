# grpc_client_app

#flutter create .
Remove test dir.
#flutter run -d <android device id>
Approve install on android device.

Initially it will fail with error.
E/flutter (16279): [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: gRPC Error (code: 14, codeName: UNAVAILABLE, message: Error connecting: SocketException: Connection refused (OS Error: Connection refused, errno = 111), address = localhost, port = 40262, details: null, rawResponse: null, trailers: {})
E/flutter (16279):

This happens as the physical device cannot access server port 8081 of the machine on physical device. To enable android to use server port 8081 on device run.
#adb reverse tcp:8081 tcp:8081

Now you should see that the server is sending super fast streaming on device for the Random generated number. To slow it down follow below steps and re-run the app.
Open todo_service.dart and modify below line and set the Duration 1 second instead of 1 millisecond.
await Future.delayed(Duration(milliseconds: 1));
await Future.delayed(Duration(seconds: 1));

#adb reverse tcp:8081 tcp:8081
#flutter run -d <select physical device id>


NOTE: To run on macos, you need to enable outgoing network on macos project settings to enable access to server.