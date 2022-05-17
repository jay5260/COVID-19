//
//  CaseDataViewController.swift
//  COVID-19
//
//  Created by Milan Chhodavadiya on 10/05/22.
//

import UIKit

class CaseDataViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var confirmedView: UIView!
    @IBOutlet weak var recoverdView: UIView!
    @IBOutlet weak var activeView: UIView!
    @IBOutlet weak var deathsView: UIView!
    @IBOutlet weak var confirmedCaseLabel: UILabel!
    @IBOutlet weak var recoveredCaseLabel: UILabel!
    @IBOutlet weak var deathsCaseLabel: UILabel!
    @IBOutlet weak var activeCaseLabel: UILabel!
    
    var confirmedCase = ""
    var recoveredCase = ""
    var deathsCase = ""
    var activeCase = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpLabels()
    }
    
    private func setUpLabels(){
        confirmedCaseLabel.text = confirmedCase
        recoveredCaseLabel.text = recoveredCase
        deathsCaseLabel.text = deathsCase
        activeCaseLabel.text = activeCase
    }
    
    private func setUpViews(){
        setUpViewCorners(Corner: confirmedView)
        setUpViewCorners(Corner: recoverdView)
        setUpViewCorners(Corner: activeView)
        setUpViewCorners(Corner: deathsView)
        
    }
    
    private func setUpViewCorners(Corner: UIView){
        Corner.layer.cornerRadius = 10
        Corner.layer.masksToBounds = true
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        pushBasicDetails()
    }
    private func pushBasicDetails(){
    let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    let homePageViewController: HomePageViewController = mainStoryBoard.instantiateViewController(withIdentifier: "HomePageViewController") as! HomePageViewController

    navigationController?.pushViewController(homePageViewController, animated: false)
    }
}
