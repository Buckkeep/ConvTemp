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
    
    var inCelsius: Double {
        
        let finalInputValue: Double = inputValue
        
        switch inputUnit {
            case "Fahrenheit":
                return (inputValue - 32) * 5/9
            case "Kelvin":
                return inputValue - 273.15
            default:
                return finalInputValue
        }
    }
        
    var outputValue: Double {
        let finalOutputValue: Double = inCelsius
        
        switch outputUnit {
            case "Fahrenheit":
                return (inCelsius * 9/5) + 32
            case "Kelvin":
                return inCelsius + 273.15
            default:
                return finalOutputValue
        }
    }
        
        
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

