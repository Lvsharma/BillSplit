//
//  ContentView.swift
//  BillSplit
//
//  Created by Luv Sharma .
//

import SwiftUI

struct ContentView: View {
    @State private var amountPaid = 0.0
    @State private var noOfPeople = 2
    @State private var tipPercent = 10
    //@FocusState private var amountIsFocused = Bool
    let tipPercentage = [5,10,15,20,0]
    var billSplit: Double {
        let peopleCount = Double(noOfPeople)
        let tip = Double(tipPercent)
        let tipValue = amountPaid/100 * tip
        let total = amountPaid + tipValue
        let grandTotal = total / peopleCount
        return grandTotal
        
    }

    var body: some View {
        NavigationView{
            Form{
            Section{
                TextField("Amount Paid",value:$amountPaid, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                Picker("No of People", selection: $noOfPeople){
                    ForEach(2..<100){Text("\($0) People ")}
                }
            }.keyboardType(.decimalPad)
                Section{
                Picker("Tip Percentage", selection: $tipPercent){
                    ForEach(tipPercentage, id: \.self){
                        Text($0, format: .percent)
                        
                    }
                } .pickerStyle(.segmented)
            } header: {
                Text("How much tip do you want to leave ?")
            }
                Section{
                    Text(billSplit, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                    
                }
            }.navigationTitle("BILL SPLIT")
               
            }
            
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
