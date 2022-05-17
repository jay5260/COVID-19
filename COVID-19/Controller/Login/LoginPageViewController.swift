//
//  ViewController.swift
//  COVID-19
//
//  Created by R & W on 29/04/22.
//

import UIKit

class LoginPageViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var emailTextfiled: UITextField!
    @IBOutlet weak var passwordTextfiled: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextfiledAndButton()
        setUpImageVIew()
    }
    
    // MARK: - Intial Setup
    private func setUpImageVIew(){
        logoImageView.layer.cornerRadius = 75
        logoImageView.layer.masksToBounds = true
    }

    private func setTextfiledAndButton(){
        setTextFiledCorners(TCorner: emailTextfiled)
        setTextFiledCorners(TCorner: passwordTextfiled)
        setButtonCorners(BCorners: signInButton)
        setButtonCorners(BCorners: facebookButton)
        setButtonCorners(BCorners: googleButton)
        setButtonCorners(BCorners: twitterButton)
    }
    
    private func setTextFiledCorners(TCorner: UITextField) {
        TCorner.layer.cornerRadius = 10
        TCorner.layer.masksToBounds = true
    }
    private func setButtonCorners(BCorners: UIButton!) {
        BCorners.layer.cornerRadius = 10
        BCorners.layer.masksToBounds = true
    }
    
    // MARK: - IBAction
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        pushBasicDetails()
    }
    @IBAction func googleButtonTapped(_ sender: Any) {
    }
    @IBAction func facebookButtonTapped(_ sender: Any) {
    }
    @IBAction func twitterButtonTapped(_ sender: Any) {
    }
    @IBAction func registerButtonTapped(_ sender: Any) {
        push()
    }
    
    // MARK: - Navigation
    private func push(){
    let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    let signUpViewController: SignUpViewController = mainStoryBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController

    navigationController?.pushViewController(signUpViewController, animated: true)
    }
    private func pushBasicDetails(){
    let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    let basicDetailsViewController: BasicDetailsViewController = mainStoryBoard.instantiateViewController(withIdentifier: "BasicDetailsViewController") as! BasicDetailsViewController

    navigationController?.pushViewController(basicDetailsViewController, animated: false)
    }
}

