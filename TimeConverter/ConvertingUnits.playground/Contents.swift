import Foundation

/* Tip :
 * https://www.hackingwithswift.com/example-code/system/how-to-convert-units-using-unit-and-measurement
 */

let days = Measurement(value : 24 , unit : UnitDuration.hours)
let hours = Measurement(value : 1 , unit : UnitDuration.hours)
let minutes = Measurement(value : 1 , unit : UnitDuration.minutes)
let seconds = minutes.converted(to : .seconds)

let daysToSeconds = days.converted(to : .seconds)
let hoursToSeconds = hours.converted(to : .seconds)
let minutesToSeconds = minutes.converted(to : .seconds)

print(days.value)
print(daysToSeconds)

let secondsToDays = daysToSeconds.converted(to : .hours)
let secondsToHours = hoursToSeconds.converted(to : .hours)
let secondsToMinutes = minutesToSeconds.converted(to : .minutes)

print(Int(secondsToDays.value))



func convertFromDaysToSeconds(days: Double)
-> Double {
    
    let startNumber = Measurement(value : 24 * days , unit : UnitDuration.hours)
    let daysToSeconds = startNumber.converted(to: .seconds)
    
    return Double(daysToSeconds.value)
}


convertFromDaysToSeconds(days : 1) // 86_400
convertFromDaysToSeconds(days : 2) // 172_800



func convertFromHoursToSeconds(hours: Double)
-> Double {
    
    let startNumber = Measurement(value : 1 * hours , unit : UnitDuration.hours)
    let hoursToSeconds = startNumber.converted(to: .seconds)
    
    return Double(hoursToSeconds.value)
}


convertFromHoursToSeconds(hours : 1) // 3_600
convertFromHoursToSeconds(hours : 2) // 7_200



func convertFromMinutesToSeconds(minutes: Double)
-> Double {
    
    let startNumber = Measurement(value : 1 * minutes , unit : UnitDuration.minutes)
    let minutesToSeconds = startNumber.converted(to: .seconds)
    
    return Double(minutesToSeconds.value)
}


convertFromMinutesToSeconds(minutes : 1) // 60
convertFromMinutesToSeconds(minutes : 2) // 120
