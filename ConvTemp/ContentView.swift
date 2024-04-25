//
//  ContentView.swift
//  ConvTemp
//
//  Created by Neeta Buhecha on 25/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Fahrenheit"
    @State private var inputValue: Double = 0.0
    @State private var outputUnit = "Celsius"
    @FocusState private var inputIsFocused: Bool
    
    var units = ["Fahrenheit", "Celsius", "Kelvin"]
    
    func allCelsius (number: Double) -> Double {
        if inputUnit == "Fahrenheit" {
            return (number - 32) * 5/9
        } else if inputUnit == "Kelvin" {
            return number - 273.15
        } else {
            return number
        }
    }
    
    func celsiusOut (celsius: Double) -> Double {
        if outputUnit == "Fahrenheit" {
            return (celsius * 9/5) + 32
        } else if inputUnit == "Kelvin" {
            return celsius + 273.15
        } else {
            return celsius
        }
    }
    
    // # TODO make outputValue a computed property calling on the two functions above
    var outputValue: Double = 0.0
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select input unit") {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Enter input value") {
                    TextField("Your number", value: $inputValue, format: .number)
                }
                .keyboardType(.decimalPad)
                .focused($inputIsFocused)
                
                Section("Select output unit") {
                    Picker("Input unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Your result") {
                    // Maths result here
                    Text(outputValue, format: .number)
                }
                
            }
            .navigationTitle("ConvTemp")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
