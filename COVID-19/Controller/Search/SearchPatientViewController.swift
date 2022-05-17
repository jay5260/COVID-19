//
//  SearchPatientViewController.swift
//  COVID-19
//
//  Created by R & W on 11/05/22.
//

import UIKit

class SearchPatientViewController: UIViewController {
    
//  MARK: - IBOutlet
    @IBOutlet weak var patientDeatilsTableView: UITableView!
    
    //  MARK: - Variable
    var arrPatient: [RawPatientData] = []
    
    //  MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callOrederDetailsAPI()
        setUpTableview()
    }
    
    private func setUpTableview(){
        patientDeatilsTableView.register(UINib(nibName: "PatientDetalisTableViewCell", bundle: nil), forCellReuseIdentifier: "PatientDetalisTableViewCell")
            }
  
    private func callOrederDetailsAPI(){
//            animationView.play()
        let baseString: String = "https://api.rootnet.in/covid19-in/unofficial/covid19india.org"
        var urlRequest: URLRequest = URLRequest(url: URL(string: baseString)!)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("appliaction/json", forHTTPHeaderField: "Content-type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, reponse, error) -> Void in
            let decoder = JSONDecoder()
            guard let resonseData = data else { return }
            do {
                let responseObject = try decoder.decode(PatientDetails.self, from: resonseData)
                self.arrPatient = responseObject.data.rawPatientData
                //print(responseObject)
                //self.arrPatient = []
                DispatchQueue.main.async {
                    self.patientDeatilsTableView.reloadData()
                }
            }catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}


extension SearchPatientViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPatient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PatientDetalisTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PatientDetalisTableViewCell", for: indexPath) as! PatientDetalisTableViewCell
        //cell.textLabel?.text = arrPatient[indexPath.row].city
        cell.patientIdLabel?.text = "\(arrPatient[indexPath.row].patientId!)"
        cell.reportedOnLabel?.text = "\(arrPatient[indexPath.row].reportedOn!)"
        cell.stateLabel?.text = "\(arrPatient[indexPath.row].state!)"
        cell.ageLabel?.text = "\(arrPatient[indexPath.row].ageEstimate!)"
        cell.cityLabel?.text = "\(arrPatient[indexPath.row].city!)"
        cell.districtLabel?.text = "\(arrPatient[indexPath.row].district!)"
        cell.statusLabel?.text = "\(arrPatient[indexPath.row].status!)"
        cell.notesLabel?.text = "\(arrPatient[indexPath.row].notes!)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}

