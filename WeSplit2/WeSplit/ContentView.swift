//
//  ContentView.swift
//  WeSplit
//
//  Created by RichK on 4/7/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberofPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        //calculate the total per person here
        let peopleCount = Double(numberofPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalOverall: Double {
        //calculate the total bill
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
      
        
        let _ = grandTotal + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection:
                    $numberofPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")){
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Amount with tip")) {
                    Text("$\(totalOverall, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
