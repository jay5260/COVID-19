//
//  PatientDetalisTableViewCell.swift
//  COVID-19
//
//  Created by R & W on 16/05/22.
//

import UIKit

class PatientDetalisTableViewCell: UITableViewCell {

    @IBOutlet weak var patientIdLabel: UILabel!
    @IBOutlet weak var reportedOnLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
