//
//  JWTabBarController.swift
//  JuWallet
//
//  Created by Kiven on 2018/9/14.
//  Copyright © 2018年 juwallet. All rights reserved.
//

import UIKit

class JWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewControllers()
    }
    
    private func configViewControllers() -> Void {
        self.viewControllers?.removeAll()
        let guess = JWMainAssetController()
        self.appendController(#imageLiteral(resourceName: "contact_group"), #imageLiteral(resourceName: "contact_group"), guess, "资产",0,nil)
        
        let lotteryAnn = JWQuotesController()
        self.appendController(#imageLiteral(resourceName: "contact_group"), #imageLiteral(resourceName: "contact_group"), lotteryAnn, "行情",1,nil)
        
        let leaderboard = JWAdvisoryController()
        self.appendController(#imageLiteral(resourceName: "contact_group"), #imageLiteral(resourceName: "contact_group"), leaderboard, "咨询",2,nil)
        
        let my = JWSettingController()
        self.appendController(#imageLiteral(resourceName: "contact_group"), #imageLiteral(resourceName: "contact_group"), my, "设置",3,nil)
    }
    
    private func appendController(_ selImage:UIImage ,_ unselImage:UIImage ,_ controller :UIViewController , _ title:String, _ tag: Int, _ badge : String?) -> Void {
        controller.title = title
        let tabBarItem = UITabBarItem(title: title, image: unselImage.withRenderingMode(.alwaysOriginal), selectedImage: selImage.withRenderingMode(.alwaysOriginal))
        tabBarItem.tag = tag
        tabBarItem.badgeValue = badge
        controller.tabBarItem = tabBarItem
        let nav = UINavigationController(rootViewController:controller)
        if self.viewControllers != nil {
            self.viewControllers!.append(nav)
        } else {
            var controllers = [UINavigationController]()
            controllers.append(nav)
            self.viewControllers = controllers
        }
    }

}
