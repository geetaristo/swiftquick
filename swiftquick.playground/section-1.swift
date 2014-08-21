//////////////////////////////////////////////////
// Swift Playground Cheatsheet
//
//
// Why Swift?
// After years of supporting ObjectiveC for the Apple platforms,
//      why come up with a new language?
// ObjectiveC
//  - Yoda's programming language
//  - 30 years old
//  - Swift designed to be easier to learn
//  - Similar to modern C Family of programming languages
//           (TODO: Ruby, JavaScript, Groovy )
//  - Expand the number of iOS/OSX developers
//  http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
//      ObjectiveC @ 6.3% vs Java @ 26.7%
//  https://sites.google.com/site/pydatalog/pypl/PyPL-PopularitY-of-Programming-Language
//  State Farm thousands of Java Developers vs. handful of iOS/OSX developers
//   - Created by Apple, giving them more control over it (Still changing with each release)
// Performance:
// http://www.jessesquires.com/apples-to-apples-part-two/
// Safety
//  - Not real garbage collection, but Automatic Reference Counting
//  - Type inferrence
//  - let, var and nil
// Readability
// WARNING: The language is still being finalized
//              and can change with each beta release
//
// You can clone this from github at:
// https://github.com/geetaristo/swiftquick.git

import Foundation

var me = "Michael Luttrell"


//*** Basics
// Playground - noun: a place where people can play

// No entry point for a Swift app
// No semi-colons
// No parens in if, for, while, do-while statements
for ch in "mobile meetup" {
    println(ch)
}

var i:Int=0
// consecutive statements on a line must have a semi-colon
while i<4 {
    println("some stuff to do");  i++
}

// var and let
// var variableName: Type = value
var str:String = "Hello, world!"

/////// Common Data Types
// String: Character strings
var stringType:String = "This is a character string"
// Int: whole numbers
var intType:Int = 42
// Float: decimal numbers
var floatType:Float = 4.2
// Double: bigger decimal numbers
var doubleType:Double =  (Double.infinity) / Double(42)
// Bool: true or false
var canDance:Bool = false

//// Inferred types.
var strInferred = "Hello, Phoenix mobile community!"
var intInferred = 42
var floatInferred = 4.2
var doubleInferred = 4.2 * (Double.infinity)
var canDanceInferred = false
doubleInferred = floatInferred


// can use any Unicode value for types... includes emojis
let 🌍 = "world"
//🌍 = "Earth"
// Strings are Unicode as well
let world = "🌍"
let hello = "👋"
let 👋 = "hello"

//string concatenation with +
var salutation = hello + " " + world
var 💩Code = 👋 + 🌍

//Use constants by default… only use var where mutability is needed.

//if you’re working with Foundation...
//-- import Foundation
// Then you can use a Swift string anywhere you can use an NSString
let lastPathComponent = "~/Documents/Development/Swift".lastPathComponent


//String Interpolation
let a=3
let b=5
let mathResult = "\(a) times \(b) is \(a * b)"

//String Mutability
var variableString = "Love"
variableString + " and Happiness"

let constantString = "Elvis"
// constantString += " lives!"
// compiler error: constant String cannot be changed

println("\(constantString) lives")

///////////////////////////
// Collections: Array and Dictionary
// interchangeable with NSArray and NSDictionary
//Array
var jazzMusicians = ["Trane", "Miles", "Monk"]
// Dictionary
var jazzMusiciansInstruments = ["Trane": "🎷",
                                "Miles": "🎺",
                                "Monk": "🎹"]
//they can work with any type…
// unlike their NS counterparts
// Typed Collections
var songs = ["Giant Steps", "So What", "Epistrophy"]
var songsAndNumbers = ["Giant Steps", "So What", "Epistrophy", 1, 3, 5, 7, 9, 13]
class Song{ }
var songObjects = [Song(), "Giant Steps", "So What", "Epistrophy"] // Legal

//Array types are written like this...
var moreJazzMusicians: [String] = ["Dizzy", "Bird", "Duke"]

// Illegal.
//var jazzSingers: [String] = ["Ella", "Billie", "Nat", "Frank", 42, Song()]
// Legal and infers only strings in this array... inferred as a typed collection
var jazzSingers = ["Ella", "Billie", "Nat", "Frank"]
//jazzSingers += [42]


////////////////////
//Loops
func playNotes(){println("🎶")}
var donePlaying:Bool = false
while !donePlaying {
    playNotes()
    donePlaying = true
}

func solo(let jammer: String){ println("go " + jammer)}

for var measures = 1; measures <= 32; ++measures {
    if measures == 32 {
        solo("play another \(measures) bars")
    } else {
        playNotes()
    }
}

////// Ranges…
for number in 1...5 { // Includes 1 and 5 closed range
    println("\(number) times 4 is \(number * 4)")
}

// half-closed range
for number in 0..<3 { // does not include 3
    println("\(number) half closed range!")
}

for name in ["John", "Jacob", "Jingle", "Heimer", "Schmidt"] {
    println("Hello, \(name)")
}
    
var numberOfLegs = ["human": 2, "threeLeggedDog": 3,
                    "elephant": 4, "centipede": 100,
                    ]

for (animalName, legCount) in numberOfLegs{
    println("\(animalName)s have \(legCount) legs")
} // An Array is also an example of a tuple

//////
// Modifying an Array
var band = ["Guitar", "Bass"]
    
band += ["Drums"] // this syntax has changed.
band += ["Piano", "Trumpet", "Saxophone"]
//band = ["Orchestra"]
band[3...5] = ["Keyboard", "Violin", "Cello"]//   Replaces items 3 -5
band

////////
// Modifying a Dictionary
numberOfLegs["spider"]=273 // adding a new value.. add a key that’s in the dictionary
numberOfLegs["spider"]=8 // modifying an existing key
numberOfLegs
    
////////
// Retrieving a Value from a Dictionary
// Optionals
//let possibleLegCount = numberOfLegs["aardvark"]
//numberOfLegs["aardvark"] = 4
let possibleLegCount: Int? = numberOfLegs["aardvark"]
//nil ... no value at all.. different from ObjectiveC
if possibleLegCount == nil {
    println("Aardvark wasn’t found")
} else {
    let legCount = possibleLegCount! // unwrap operator… not specifying the type
    println("An aardvark has \(legCount) legs")
}

// Why do this? Why unwrap?
// If there’s nothing there an exception will be thrown

//can do this in one step
if let legCount = possibleLegCount { // if this doesn’t unwrap this block of code is skipped
    println("An aardvark has \(legCount) legs")
}
    
////////
//If Statements
var legCount:Int = numberOfLegs["human"]! // optional... unwrapping
//var legCount:Int = numberOfLegs["aardvark"]! // optional... unwrapping
//-- println("What is this??? \(legCount)")

//can do this...  parens are optional braces ARE required
if legCount == 0 {
    println("it slithers and slides around")
} else {
    println("It walks")
}

//not recommended to use if if-else if-else… but to use switch - case
switch legCount {
case 0:
    println("it slithers and slides around")
case 1:
    println("it hops")
default:
    println("It walks")
} // no automatic fall -through

//can use any value you’d like to switch…  can match on objects

/*
    switch must be exhaustive.
    default MUST be there
    uncomment the below code and try it out
*/
//switch legCount {
//case 0:
//    println("It slithers and slides around")
//case 1, 3, 5, 7, 9, 11, 13:
//    println("It limps")
//case 2, 4, 6, 8, 10, 12, 14:
//    println("It walks")
////default:println("what??")
//}



// match against a range…
switch legCount {
case 0:
    println("It has no legs")
case 1...8: // closed range operator
    println("It has some legs")
default:
    println("It has a LOT of legs")
}
// there’s a lot more about the switch statement

//    Functions
func sayMyName(name :String){ // parameters
    println("Hello \(name)!")
}

func sayMyName2(name :String = "Big Pappa"){ // parameters can have default values
    println("Hello \(name)!")
}

sayMyName(world)

// Specifying a default
func lionelGreeting(name: String = "Big Pappa") -> String { // return value
    return "Hello, " + name + ". Is it me you're looking for?"
}

let greeting = lionelGreeting() // don’t have to specify the value… it’s returned

///// Tuples
//    Returning multiple values
func httpGetRequest() -> (Int, String) {
    // … try to refresh ..
    return (200, "Success") // return Tuple
}

//    Tuple is a grouping of values
//    (123, 342, 421)
//    (404, "Not Found)
//        (2, "banana", 0.72) Int, String, Double
//        Not supposed to be a replacement for a data structure
    
let (statusCode, message) = httpGetRequest() // no type
println("Received \(statusCode): \(message)") // decomposition of the Tuple

// named return values in a Tuple
func httpPostRequest() -> (code: Int, message: String){
    return (200, "Success")
}
//    then can do this...
let status = httpPostRequest()
println("Received \(status.code): \(status.message)")
    
//// Closures
let greetingPrinter = {
    println("hello")
}

//functions are just named closures
greetingPrinter()
    
//    Closures as parameters...
func repeat( count: Int, task: () -> ()){
    for i in 0..<count {
        task()
    }
}
    
repeat (2, {
        println("hello!")
        })
    
// if the closer is the last parameter to the function
// you can move it outside of the function call
// so that it looks like a control flow statement
repeat(2) {
    println("Hello")
}
    
//  Classes
class Motorcycle {
    // all properties methods and initializers go in here
    var numberOfWheels:Int = 2
}

// DO NOT NEED HEADER FILES.
// no import Motorcycle.h
// do not need a base class
// There is not a base class for classes in Swift
    
class Cruiser: Motorcycle { // Cruiser inherits Motorcycle
        
}

class Motorbike {
    var numberOfCylinders = 0 // modifiable variable
}

class Musician {
    var name:String
    var instrument:String
    init(name:String, instrument:String) {
        self.name = name
        self.instrument = instrument
    }
}

var musc = Musician (name: "Miles Davis", instrument:  "Trumpet")

// no distinction between instance variables and properties
// Swift handles all access to the value.
class Vehicle {
    var numberOfWheels = 0 // property
    var description: String { // computed property … read only… no setter
        get { return "\(numberOfWheels) wheels" }
    }
}

// Backing store
// no backing store for a computed property
class Vehicle2 {
    var numberOfWheels = 0
    var description: String { // for read only. don’t even have to write the getter
        return "\(numberOfWheels) wheels"
    }
} // Computed properties Must be Variables
    
////// Class instantiation:
let someVehicle = Vehicle()
//Automatic Memory Allocation… no alloc
// no type specified
// no initializer
    
someVehicle.description
println(someVehicle.description)
    
someVehicle.numberOfWheels = 2
println(someVehicle.description)

    
//    Class Initalization
//    initializers do not return a value…
class Bicycle :Vehicle {
     override init() { // initialized can use parameters
        super.init(); // called to initialize the parent class
        numberOfWheels = 2
    }
}

let myBicycle = Bicycle()
println(myBicycle.description)
    
    
////// Overriding a Property
class Car: Vehicle {
    var speed = 0.0
    override init() {
        super.init()
        numberOfWheels = 4
    }
        
    override var description: String{
        return super.description + ",  \(speed) mph"
    }
}
    
let myCar = Car()
println(myCar.description)
    
// 4 wheels, 0.0 mph
myCar.speed = 35.0 //  change the value of the speed
// 4 wheels, 35 mph
    
////// Property Observers
class ParentalCar: Car {
    override init() {
        super.init()
    }
        
    override var speed: Double {
        willSet{
            //newValue constant
            if newValue > 65.0 {
                println("Careful now")
            }
        }
        didSet{
            // oldValue constant
        }
    }
}

////// Methods
class Counter {
    var count = 0 // stored property
    func increment(){
        count++;
    }
        
    func incrementBy( amount: Int) {
        count += amount
    }
        
    func resettoCount(count: Int) {
        // parameter is the same as the member variable
        // need self to refer to the stored property
         self.count = count
    }
}
    
    
//////  Structures in Swift
struct Point {
    var x, y: Double
}
    
struct Size {
    var width, height: Double
}
struct Rect {
    var origin: Point
    var size: Size
}
    
var point = Point (x: 0.0, y: 0.0)
var size = Size(width:640.0, height: 480.0)
var rect = Rect(origin: point, size: size)
    
//////    Custom Initializers for Structures
struct Rect2 {
    var origin: Point
    var size: Size
        
    var area: Double { // structures can have computed properties
        return size.width * size.height
    }
        
    func isBiggerThanRect(other: Rect2) -> Bool { // structures can have methods
        return self.area > other.area
    }
}
    
    
////    What is the difference between a structure and a class?
//
//    1. Structures cannot inherit from other structures.
//    2. is how values are passed around…
    
class Window {
    init(frame: Rect){self.frame = frame}
    var frame:Rect
}
    
var window = Window(frame: rect) ////window is a reference
    
func setup(window: Window){ // do nothing
}
    
setup(window)// window is a class, so the reference is passed
        // rect is a structure, it’s passed by value. new copy
    
func reSize(size: Rect) {
}
    
var newFrame = window.frame
/// window.frame should be a structure, so as to make it a value type
// if it’s a class. this will move the original frame.
newFrame.origin.x = 20
    
/////// Constants and Variables
let window2 = Window(frame: rect) // constant window reference
// reference to the Window object… window is constant… Window is NOT
    
//    window2 = Window(frame: rect)  // error: Cannot mutate a constant!
    
var point1 = Point(x: 0.0, y: 0.0)
point1.x = 5
let point2 = Point(x: 0.0, y: 0.0)
// cannot modify point2
//point2.y = 10
    
    
struct AnotherPoint {
    var x, y: Double // Remove type from x, y is declared as a double, x is a Uint... kinda confusing
        
    func moveToTheRightBy(delta: Double) {
        // Still don't know why this doesn't work += delta
    }
}

struct AndAnotherPoint {
    var x, y: Double
        
    mutating func moveToTheRightBy(dx: Double) {
        x += dx
    }
}

//-- let aaPoint = AndAnotherPoint(x: 0.0, y: 0.0)
//-- aaPoint.moveToTheRightBy(10.1)
var aaPoint2 = AndAnotherPoint(x: 0.0, y: 0.0)
aaPoint2.moveToTheRightBy(10.2)

    
/////// Enumerations
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthNumber = Planet.Earth.toRaw()
    
enum ControlCharacter: Character {
    case Tab = "\t"
    case Linefeed = "\n"
    case CarriageReturn = "\r"
}
    
enum CompassPoint {
    case North, South, East, West
}
    
var directionToHead = CompassPoint.West
directionToHead = .East // compiler knows this is a CompassPoint
    
    
//// Enumerations with Associated Values
enum FlightStatus {
    case OnTime
    case Delayed(Int)
}
    
var flightStatus = FlightStatus.OnTime
// status is inferred to be a FlightStatus
flightStatus = .Delayed(42)
    
enum FlightStatusBetter {
    case OnTime, Delayed(Int)
    init(){ // Initializer
        self = OnTime
    }
    var description: String {
        switch self {
        case OnTime:
            return "on time"
        case Delayed(let minutes):
            return "delayed by \(minutes) minutes"
        }
    }
}
    
var betterFlightStatus = FlightStatusBetter()
println("Your flight is \(betterFlightStatus.description)")
    
betterFlightStatus = .Delayed(42)
println("Your flight is \(betterFlightStatus.description)")
    
class mostAccurateFlightStatus {
    enum Status {
        case OnTime, Delayed(Int)
        init() {
            self = OnTime
        }
        var description: String { return "the most accurate flight status in the world" }
    }
}
    
//////// Extensions - like a Category in ObjectiveC

extension Size {
    mutating func increaseByFactor(factor: Double) {
        width *= factor
        height *= factor
    }
}

extension Int { // declaration is only valid at file scope
    func repeatTask(task: () -> ()) {
        for i in 0..<self {
            task()
        }
    }
}
    
10.repeatTask({ println("Hello!") })
// since repeat is a trailing closure
10.repeatTask{ println("Hello") }

// A Non-Generic Stack Structure
struct IntStack {
    var elements = [Int]()
        
    mutating func push( element: Int) {
        elements.append(element)
    }
        
    mutating func pop() -> Int {
        return elements.removeLast()
    }
}
    
//A Generic Stack Structure
struct GenericStack<T> {
    var elements = [T]()
        
    mutating func push( element: T) {
        elements.append(element)
    }
        
    mutating func pop() -> T {
        return elements.removeLast()
    }
}
    
var intStack = GenericStack<Int>()
intStack.push(1)
println(intStack.pop())
    
var stringStack = GenericStack<String>()
stringStack.push("1")
println(stringStack.pop())

//////// How do you learn Swift????
//        Apple has provided two books
//          The Swift Programming Language
//          Using Swift with Cocoa & Objective-C
//        WWDC videos: Swift
//      https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/index.html
// Some other good links:
//
//      https://github.com/ksm/SwiftInFlux - keep up with changes in the language
//
//      A pretty good tutorial
//      http://www.raywenderlich.com/74438/swift-tutorial-a-quick-start
//
//
