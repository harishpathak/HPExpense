//
//  ExpenseItem.swift
//  HPExpense
//
//  Created by Harish on 27/12/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
