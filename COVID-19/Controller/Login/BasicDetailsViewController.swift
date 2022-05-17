//
//  BasicDetailsViewController.swift
//  COVID-19
//
//  Created by JAY on 29/04/22.
//

import UIKit

class BasicDetailsViewController: UIViewController {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var ageTextFiled: UITextField!
    @IBOutlet weak var genderTextFiled: UITextField!
    @IBOutlet weak var addressTextFiled: UITextField!
    @IBOutlet weak var letsGoButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImageVIew()
        setTextfiledAndButton()
    }
    
    // MARK: - Intial Setup
    private func setUpImageVIew(){
        detailsView.layer.cornerRadius = 10
        profilePictureImageView.layer.cornerRadius = 87.5
        profilePictureImageView.layer.masksToBounds = true
        profilePictureImageView.layer.borderColor = UIColor(red: 236/255.0, green: 240/255.0, blue: 244/255.0, alpha: 1).cgColor
        profilePictureImageView.layer.borderWidth = 10
    }

    private func setTextfiledAndButton(){
        setTextFiledCorners(TCorner: ageTextFiled)
        setTextFiledCorners(TCorner: genderTextFiled)
        setTextFiledCorners(TCorner: addressTextFiled)
        setButtonCorners(BCorners: letsGoButton)
        cameraButton.layer.cornerRadius = 30
        cameraButton.layer.masksToBounds = true
        cameraButton.layer.borderWidth = 5
        cameraButton.layer.borderColor = UIColor(red: 236/255.0, green: 240/255.0, blue: 244/255.0, alpha: 1).cgColor
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
    @IBAction func letsGoButtonTapped(_ sender: Any) {
        pushBasicDetails()
    }
    @IBAction func cameraButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Navigation
    private func pushBasicDetails(){
    let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    let homePageViewController: LoginPageViewController = mainStoryBoard.instantiateViewController(withIdentifier: "HomePageViewController") as! LoginPageViewController

    navigationController?.pushViewController(homePageViewController, animated: false)
    }
}
