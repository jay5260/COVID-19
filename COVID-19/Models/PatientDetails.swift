//
//  PatientDetails.swift
//  COVID-19
//
//  Created by R & W on 11/05/22.

//struct PatientDetails: Codable {
//    var success: Bool
//    var data: DataP
//}
//
//struct DataP: Codable {
//    var source: String?
//    var lastRefreshed: String?
//    var summary: Summary
//    var rawPatientData: [PatientData]
//}
//
//struct Summary: Codable {
//    var total: Int?
//}
//
//struct PatientData: Codable {
//    var patientId: Int?
//    var reportedOn: String?
//   // var onsetEstimate: String?
//    var ageEstimate: String?
//    var gender: String?
//    var city: String?
//    var district: String?
//    var state: String?
//    var status: String?
//    var notes: String?
//    //var contractedFrom: String?
//}
//// MARK: - Welcome
//struct PatientDetails: Codable {
//    var success: Bool
//    var data: DataClass
//    var lastRefreshed, lastOriginUpdate: String?
//}
//
//// MARK: - DataClass
//struct DataP: Codable{
//    var source: String?
//    var lastRefreshed: String?
//    var summary: Summary
//    var rawPatientData: [PatientData]
//}
//
//// MARK: - RawPatientDatum
//struct PatientData: Codable {
//    var patientId: Int?
//    var reportedOn: String?
//    var onsetEstimate: String?
//    var ageEstimate: String?
//    var gender: String?
//    var city: String?
//    var district: String?
//    var state: String?
//    var status: String?
//    var notes: String?
//    var contractedFrom: String?
//}
//
//// MARK: - Summary
//struct Summary: Codable {
//    var total: Int?
//}


import Foundation
struct PatientDetails : Codable {
    let success : Bool
    let data : Data
    let lastRefreshed : String
    let lastOriginUpdate : String

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case lastRefreshed = "lastRefreshed"
        case lastOriginUpdate = "lastOriginUpdate"
    }


}
struct Data : Codable {
    let source : String
    let lastRefreshed : String
    let summary : Summary
    let rawPatientData : [RawPatientData]

    enum CodingKeys: String, CodingKey {

        case source = "source"
        case lastRefreshed = "lastRefreshed"
        case summary = "summary"
        case rawPatientData = "rawPatientData"
    }

}
struct Summary : Codable {
    let total : Int
}
struct RawPatientData : Codable {
    let patientId: Int?
    let reportedOn: String?
    let onsetEstimate: String?
    let ageEstimate: String?
    let gender: String?
    let city: String?
    let district: String?
    let state: String?
    let status: String?
    let notes: String?
    let contractedFrom: String?


}
