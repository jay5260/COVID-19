//
//  StateCaseData.swift
//  COVID-19
//
//  Created by R & W on 11/05/22.
//

import Foundation

struct Welcome: Codable {
    var success: Bool
    var data: DataClass
    var lastRefreshed: String
    var lastOriginUpdate: String
}

// MARK: - DataClass
struct DataClass: Codable {
    var source, lastRefreshed: String
    var total: Total
    var statewise: [Total]
}

// MARK: - Total
struct Total: Codable {
    var state: String?
    var confirmed: Int
    var recovered: Int
    var deaths: Int
    var active: Int
}
