import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    GeneratedPluginRegistrant.register(with: self)
    
        if let registrar = self.registrar(forPlugin: "NotificationHandler") {
            NotificationHandler.register(with: registrar)
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// 🎯 Incluimos el Handler aquí abajo dentro del mismo archivo
public class NotificationHandler: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "com.example.routerPractice/notifications",
            binaryMessenger: registrar.messenger()
        )
        let instance = NotificationHandler()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    // Renombrado el parámetro a 'resultHandler' para evitar el conflicto de NSObject
    public func handle(_ call: FlutterMethodCall, result resultHandler: @escaping FlutterResult) {
        if call.method == "requestPermissions" {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                DispatchQueue.main.async {
                    if let error = error {
                        let flutterError = FlutterError(
                            code: "UN_ERROR",
                            message: error.localizedDescription,
                            details: nil
                        )
                        resultHandler(flutterError)
                    } else {
                        resultHandler(granted)
                    }
                }
            }
        } else {
            resultHandler(FlutterMethodNotImplemented)
        }
    }
}