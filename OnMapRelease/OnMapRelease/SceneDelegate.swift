//
//  SceneDelegate.swift
//  OnMapRelease
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func checkLogin() -> Bool {
        return true
    }

    func rootMainTabBar(_ winScene: UIWindowScene) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let newViewController = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let vc1 = storyboard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
        
        let vc2 = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        
        let vc3 = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        let tb = UITabBarController()
        
        tb.setViewControllers([vc1, vc2, vc3], animated: false)
        
        tb.selectedIndex = 1
        
        let win = UIWindow(windowScene: winScene)
        win.rootViewController = tb
        win.makeKeyAndVisible()
        window = win
        
        //let
//        let vc1 = FirstViewController()
//        let vc2 = SecondViewController()
//        //let nc = UINavigationController(rootViewController: vc)
//
//        let tb = UITabBarController()
//        tb.setViewControllers([vc1, vc2], animated: false)
//        tb.selectedIndex = 1
//        // Create the window. Be sure to use this initializer and not the frame one.
//        let win = UIWindow(windowScene: winScene)
//        win.rootViewController = tb
//        win.makeKeyAndVisible()
//        window = win
    }
    
    func rootLoginViewController(_ winScene: UIWindowScene) {
        
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let key = checkLogin()
        if key {
            rootMainTabBar(winScene)
        } else {
            rootLoginViewController(winScene)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

