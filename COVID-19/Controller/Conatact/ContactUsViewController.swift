//
//  ContactUsViewController.swift
//  COVID-19
//
//  Created by R & W on 03/05/22.
//

import UIKit

class ContactUsViewController: LoginPageViewController {

    @IBOutlet weak var sideBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSideBar()
    }
    
    func setUpSideBar(){
        if self.revealViewController() != nil {
            sideBarButton.target = self.revealViewController()
            sideBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
