import Cocoa

var str = "Hello, playground"

var start = DispatchTime.now()
var end = DispatchTime.now()
var nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
var timeInterval = Double(nanoTime) / 1_000_000_000

let input1 = processInput1()
start = DispatchTime.now()
print("Day 1, part 1: \(reportRepair(arr: input1))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 1.1: \(timeInterval) seconds")


start = DispatchTime.now()
print("Day 1, part 2: \(reportRepair2(arr: input1))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 1.2: \(timeInterval) seconds")

let input2 = processInput2()
start = DispatchTime.now()
print("Day 2, part 1: \(passwordPhilosophy(arr: input2))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 2.1: \(timeInterval) seconds")

start = DispatchTime.now()
print("Day 2, part 2: \(passwordPhilosophy2(arr: input2))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 2.2: \(timeInterval) seconds")

let input3 = processInput3()
start = DispatchTime.now()
print("Day 3, part 1: \(tobogganTrajectory(arr: input3, right: 3, down: 1))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 3.1: \(timeInterval) seconds")

let slopes = [
                (right: 1, down: 1),
                (right: 3, down: 1),
                (right: 5, down: 1),
                (right: 7, down: 1),
                (right: 1, down: 2)
             ]
start = DispatchTime.now()
print("Day 3, part 2: \(tobogganTrajectory2(arr: input3, slopes: slopes))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 3.2: \(timeInterval) seconds")

let input4 = processInput4()
start = DispatchTime.now()
print("Day 4, part 1: \(passportProcessing(passports: input4))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 4.1: \(timeInterval) seconds")

start = DispatchTime.now()
print("Day 4, part 2: \(passportProcessing2(passports: input4))")
end = DispatchTime.now()
nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
timeInterval = Double(nanoTime) / 1_000_000_000
print("Time to evaluate problem 4.2: \(timeInterval) seconds")

