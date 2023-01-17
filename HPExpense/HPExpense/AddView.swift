//
//  AddView.swift
//  HPExpense
//
//  Created by Harish on 27/12/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    //Using @observedObject as the value is passed in from somewhere else.
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .keyboardType(.default)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
