//  ContentView.swift
// LIBRARIES :
import SwiftUI



struct ContentView: View {
    
    @State private var inputNumber: String = ""
    @State private var inputUnitIndex: Int = 0
    @State private var outputUnitIndex: Int = 1
    
    let inputUnits: [String] = [ "seconds" , "minutes" , "hours" , "days" ]
    let outputUnits: [String] = [ "seconds" , "minutes" , "hours" , "days" ]
    
    
    var convertedNumber: Double {
        
        switch (inputUnits[inputUnitIndex] , outputUnits[outputUnitIndex]) {
        
        case ("seconds" , "seconds") : return Double(inputNumber) ?? 0.00
        case ("seconds" , "minutes") : return (Double(inputNumber) ?? 0.00) / 60
        case ("seconds" , "hours")   : return (Double(inputNumber) ?? 0.00) / (60 * 60)
        case ("seconds" , "days")    : return (Double(inputNumber) ?? 0.00) / (60 * 60 * 24)
        case ("minutes" , "seconds") : return convertFromMinutesToSeconds(minutes : inputNumber)
        case ("minutes" , "minutes") : return Double(inputNumber) ?? 0.00
        case ("minutes" , "hours")   : return convertFromMinutesToSeconds(minutes : inputNumber) / (60 * 60)
        case ("minutes" , "days")    : return convertFromMinutesToSeconds(minutes : inputNumber) / (60 * 60 * 24)
        case ("hours" , "seconds")   : return convertFromHoursToSeconds(hours : inputNumber)
        case ("hours" , "minutes")   : return convertFromHoursToSeconds(hours : inputNumber) / 60
        case ("hours" , "hours")     : return Double(inputNumber) ?? 0.00
        case ("hours" , "days")      : return convertFromHoursToSeconds(hours : inputNumber) / (60 * 60 * 24)
        case ("days" , "seconds")    : return convertFromDaysToSeconds(days : inputNumber)
        case ("days" , "minutes")    : return convertFromDaysToSeconds(days : inputNumber) / (60)
        case ("days" , "hours")      : return convertFromDaysToSeconds(days : inputNumber) / (60 * 60)
        case ("days" , "days")       : return Double(inputNumber) ?? 0.00
        default                      : return 0.00
        }
    }
    
    
    var body: some View {
        
        Form {
            Section(header: Text("convert :")) {
                TextField("Enter a number ." ,
                          text: $inputNumber)
            }
            
            Section(header : Text("from :")) {
                Picker("Select start unit" ,
                       selection : $inputUnitIndex) {
                    ForEach(0..<inputUnits.count) {
                        return Text("\(inputUnits[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header : Text("to :")) {
                Picker("Select end unit" ,
                       selection : $outputUnitIndex) {
                    ForEach(0..<outputUnits.count) {
                        return Text("\(outputUnits[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Result :")) {
                Text("\(convertedNumber , specifier : "%.6f") \(outputUnits[outputUnitIndex])")
            }
        }
    }
    
    
    func convertFromDaysToSeconds(days: String)
    -> Double {
        
        let stringToDoubleDays = Double(days) ?? 0.00
        let startNumber = Measurement(value : 24 * stringToDoubleDays , unit : UnitDuration.hours)
        let daysToSeconds = startNumber.converted(to: .seconds)
        
        return Double(daysToSeconds.value)
    }
    
    
    func convertFromHoursToSeconds(hours: String)
    -> Double {
        
        let stringToDoubleHours = Double(hours) ?? 0.00
        let startNumber = Measurement(value : 1 * stringToDoubleHours , unit : UnitDuration.hours)
        let hoursToSeconds = startNumber.converted(to: .seconds)
        
        return Double(hoursToSeconds.value)
    }


    func convertFromMinutesToSeconds(minutes: String)
    -> Double {
        
        let stringToDoubleMinutes = Double(minutes) ?? 0.00
        let startNumber = Measurement(value : 1 * stringToDoubleMinutes , unit : UnitDuration.minutes)
        let minutesToSeconds = startNumber.converted(to: .seconds)
        
        return Double(minutesToSeconds.value)
    }
}





struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
