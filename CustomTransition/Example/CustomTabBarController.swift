//
//  CustomTabBarController.swift
//  CustomTransition
//
//  Created by Mayank Rikh on 10/08/20.
//  Copyright © 2020 Mayank Rikh. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.black
        tabBar.barTintColor = UIColor.white
        self.delegate = self

        if let viewControllers = viewControllers{

            let createImage = UIImage(named : "create_plus")
            let explore = UIImage(named : "icons8-search-30")
            let profile = UIImage(named : "icons8-user-30")

            viewControllers[0].tabBarItem = UITabBarItem(title: nil, image: explore, selectedImage: explore)
            viewControllers[1].tabBarItem = UITabBarItem(title: nil, image: createImage, selectedImage: createImage)
            viewControllers[2].tabBarItem = UITabBarItem(title: nil, image: profile, selectedImage: profile)
        }
    }
}

extension CustomTabBarController : UITabBarControllerDelegate{

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        if let index = tabBarController.viewControllers?.firstIndex(where: {$0 == viewController}), index == 1{

            let storyboard = UIStoryboard(name: "Second", bundle: nil)
            let viewController = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController

            viewController.transitioningDelegate = self
            viewController.modalPresentationStyle = .overCurrentContext
            present(viewController, animated: true, completion: nil)
            return false

        }
        return true
    }
}

extension CustomTabBarController : UIViewControllerTransitioningDelegate{

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let animator = CircleFadeInAniamtor()

        let tabbarItem = tabBar.subviews[2]
        if let frame = tabbarItem.subviews.first?.frame{
            let convert = tabbarItem.convert(frame, to: view)
            animator.triggerFrame = convert
            return animator
        }else{
            return nil
        }
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let animator = CircularFadeOutAnimation()
        let tabbarItem = tabBar.subviews[2]
        if let frame = tabbarItem.subviews.first?.frame{
            let convert = tabbarItem.convert(frame, to: view)
            animator.triggerFrame = convert
            return animator
        }else{
            return nil
        }
    }
}

