//
//  SM.Weather
//  Created by User on 01.09.2021.
//  Copyright © 2021 Daniel Martines. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let navigationBarRootVC = MainScreenRootViewController(nibName: nil, bundle: nil)
		window = UIWindow()
		window?.frame = UIScreen.main.bounds
		window?.rootViewController = MainScreenViewController(rootViewController: navigationBarRootVC)
		window?.makeKeyAndVisible()
		return true
    }

}
