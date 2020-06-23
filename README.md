# ErrorKit

`ErrorKit` is initialized with singleton access to `MobKit.setup` function. It has a `delegate` for observing error events occurred in your application. You need to listen to its `delegate` when your application starts. Ideally, it's Scene Delegate's `scene(_, willConnectTo:)` (alternatively, App Delegate's `didFinishLaunchingWithOptions`) function.
```swift
import UIKit
import MobKit
import ErrorKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    ...
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        MobKit.setup(with: [ErrorKit.shared()])
        ErrorKit.shared().delegate = self
    }
    ...
}
```

Then you need to extend `SceneDelegate` (or alternatively, `AppDelegate`) with `ErrorKitDelegate`:
```swift
extension SceneDelegate: ErrorKitDelegate {
    func errorKitDidCatch(networkingError: NetworkingError) {
        // Network errors occured during making request or receiving response.
    }
    
    func errorKitDidCatch(serializationError: NetworkingError) {
        // JSON (de-)serialization error with type
        // NetworkingError.encodingError or NetworkingError.decodingError
    }
    
    func errorKitDidCatch(cryptographyError: Error) {
        // Cryptography errors occurred while secure network usage.
    }
}
```
