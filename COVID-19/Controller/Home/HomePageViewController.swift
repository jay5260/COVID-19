//
//  HomePageViewController.swift
//  COVID-19
//
//  Created by JAY on 02/05/22.
//

import UIKit
import Lottie

class HomePageViewController: UIViewController,SWRevealViewControllerDelegate {

    @IBOutlet weak var callingView: UIView!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var covidCaseCollectionView: UICollectionView!
    @IBOutlet weak var sideBarButton: UIBarButtonItem!

    
    var arrState: [Total] = []
    var numberOfItem = 2
    var inset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    var selectedCellIndex = -1
    var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()
        animationView = collectionViewAnimation()
        setUpSideBar()
        callOrederDetailsAPI()
        SetCollectionView()
    }
    
    private func lottieAnimation() -> AnimationView {
            let animationView = AnimationView(name: "29584-telephone")
            animationView.frame = CGRect(x: 30, y: 100, width: 150, height: 150)
            //animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFit
            view.addSubview(animationView)
            animationView.play()
            animationView.loopMode = .loop
            return animationView
        }
    
    
    private func collectionViewAnimation() -> AnimationView {
            let animationView = AnimationView(name: "lf30_editor_o5lzsw8c")
            animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFit
            view.addSubview(animationView)
            animationView.loopMode = .loop
            return animationView
        }
    
    func setUpSideBar(){
        if self.revealViewController() != nil {
            sideBarButton.target = self.revealViewController()
            sideBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
           self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    private func SetCollectionView(){
        covidCaseCollectionView.delegate = self
        covidCaseCollectionView.dataSource = self
        covidCaseCollectionView.register(UINib(nibName: "StateCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StateCollectionViewCell")
    }
    
    private func callOrederDetailsAPI(){
        animationView.play()
        let baseString: String = "https://api.rootnet.in/covid19-in/unofficial/covid19india.org/statewise"
        var urlRequest: URLRequest = URLRequest(url: URL(string: baseString)!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("appliaction/json", forHTTPHeaderField: "Content-type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, reponse, error) -> Void in
            let decoder = JSONDecoder()
            guard let resonseData = data else {
                return
            }
            do {
                let responseObject = try decoder.decode(Welcome.self, from: resonseData)
                self.arrState = []
                self.arrState = responseObject.data.statewise
                DispatchQueue.main.async {
                    self.animationView.stop()
                    self.animationView.isHidden = true
                    self.covidCaseCollectionView.reloadData()
                }
            }catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    // MARK: - push Method
    func navigation(index: Int) {
            let caseData = storyboard?.instantiateViewController(withIdentifier: "CaseDataViewController") as! CaseDataViewController
        caseData.confirmedCase = "\(arrState[index].confirmed)"
        caseData.recoveredCase = "\(arrState[index].recovered)"
        caseData.deathsCase = "\(arrState[index].deaths)"
        caseData.activeCase = "\(arrState[index].active)"
            navigationController?.pushViewController(caseData, animated: true)
        }
    
    private func pushBasicDetails(){
    let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    let basicDetailsViewController: BasicDetailsViewController = mainStoryBoard.instantiateViewController(withIdentifier: "BasicDetailsViewController") as! BasicDetailsViewController

    navigationController?.pushViewController(basicDetailsViewController, animated: false)
    }
}

// MARK: - Extensions - UICollectionViewDelegate , UICollectionViewDataSource
extension HomePageViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrState.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StateCollectionViewCell", for: indexPath) as! StateCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = selectedCellIndex == indexPath.row ? 4 : 2
        cell.layer.borderColor = selectedCellIndex == indexPath.row ? UIColor(red: 236/255.0, green: 240/255.0, blue: 244/255.0, alpha: 1).cgColor :
        UIColor(red: 68/255.0, green: 66/255.0, blue: 144/255.0, alpha: 1).cgColor
        cell.stateLabel.text = arrState[indexPath.row].state
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigation(index: indexPath.row)
        covidCaseCollectionView.reloadData()
    }
}

// MARK: - Extensions - UICollectionViewDelegateFlowLayout
extension HomePageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let paddingSpace = inset.left * CGFloat(numberOfItem+1)
        let availableWidth = width - paddingSpace
        let cellWidth = availableWidth/CGFloat(numberOfItem)
        let cellSize: CGSize = CGSize(width: cellWidth, height: cellWidth)
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inset.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return inset.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
    
}
