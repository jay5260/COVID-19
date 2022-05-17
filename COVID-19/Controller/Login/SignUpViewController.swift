//
//  signUpViewController.swift
//  COVID-19
//
//  Created by JAY on 29/04/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var mobileNumberTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageVIew()
        setTextfiledAndButton()
    }
    
    private func setUpImageVIew(){
        logoImageView.layer.cornerRadius = 75
        logoImageView.layer.masksToBounds = true
    }

    private func setTextfiledAndButton(){
        setTextFiledCorners(TCorner: nameTextFiled)
        setTextFiledCorners(TCorner: emailTextFiled)
        setTextFiledCorners(TCorner: mobileNumberTextFiled)
        setTextFiledCorners(TCorner: passwordTextFiled)
        setButtonCorners(BCorners: signUpButton)
    }
    
    private func setTextFiledCorners(TCorner: UITextField) {
        TCorner.layer.cornerRadius = 10
        TCorner.layer.masksToBounds = true
    }
    private func setButtonCorners(BCorners: UIButton!) {
        BCorners.layer.cornerRadius = 10
        BCorners.layer.masksToBounds = true
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        pushBasicDetails()
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        push()
    }
    
    // MARK: - Navigation
    private func push(){
    let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    let viewController: LoginPageViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! LoginPageViewController

    navigationController?.pushViewController(viewController, animated: false)
    }
    
   
    private func pushBasicDetails(){
    let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    let basicDetailsViewController: BasicDetailsViewController = mainStoryBoard.instantiateViewController(withIdentifier: "BasicDetailsViewController") as! BasicDetailsViewController

    navigationController?.pushViewController(basicDetailsViewController, animated: false)
    }
}

