//: [Previous](@previous)

import Foundation

class Music {
    let notes: [String]
    
    init(notes: [String]) {
        self.notes = notes
    }
    
    func prepared() -> String {
        return notes.joined(separator: " ")
    }
}

class Instrument {
    let brand: String
    
    init(brand: String) {
        self.brand = brand
    }
    
    func tune() -> String {
        fatalError("Implement this method for \(brand)")
    }
    
    func play(_ music: Music) -> String {
        return music.prepared()
    }
}

class Piano: Instrument {
    let hasPedals: Bool
    
    static let whiteKeys = 52
    static let blackKeys = 36
    
    init(brand: String, hasPedals: Bool = false) {
        self.hasPedals = hasPedals
        super.init(brand: brand)
    }
    
    override func tune() -> String {
        return "Piano standard tuning for \(brand)."
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Piano playing \(preparedNotes)"
    }
    
    func play(_ music: Music, usingPedals: Bool) -> String {
        let preparedNotes = super.play(music)
        if hasPedals && usingPedals {
            return "Play piano notes \(preparedNotes) with pedals."
        } else {
            return "Play piano notes \(preparedNotes) without pedals."
        }
    }
}

class Guitar: Instrument {
    let stringGauge: String
    
    init(brand: String, stringGauge: String = "medium") {
        self.stringGauge = stringGauge
        super.init(brand: brand)
    }
}

class AcousticGuitar: Guitar {
    static let numberOfStrings = 6
    static let fretCount = 20
    
    override func tune() -> String {
        return "Tune \(brand) acoustic with E A D G B E"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play folk tune on frets \(preparedNotes)."
    }
}

class Amplifier {
    private var _volume: Int
    private(set) var isOn: Bool
    
    init() {
        isOn = false
        _volume = 0
    }
    
    func plugIn() {
        isOn = true
    }
    
    func unPlug() {
        isOn = false
    }
    
    var volume: Int {
        get {
            return isOn ? _volume : 0
        }
        
        set {
            _volume = min(max(newValue, 0), 10)
        }
    }
}

class ElectricGuitar: Guitar {
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "light", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        amplifier.volume = 5
        return "Tune \(brand) electric with E A D G B E"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play solo \(preparedNotes) at volume \(amplifier.volume)"
        
    }
}

class BassGuitar: Guitar {
    let amplifier: Amplifier
    
    init(brand: String, stringGauge: String = "heavy", amplifier: Amplifier) {
        self.amplifier = amplifier
        super.init(brand: brand, stringGauge: stringGauge)
    }
    
    override func tune() -> String {
        amplifier.plugIn()
        return "Tune \(brand) bass with E A D G"
    }
    
    override func play(_ music: Music) -> String {
        let preparedNotes = super.play(music)
        return "Play bass line \(preparedNotes) at volume \(amplifier.volume)."
    }
}


let piano = Piano(brand: "Yamaha", hasPedals: true)
piano.true()

let music = Music(notes: ["C", "G", "F"])
piano.play(music, usingPedals: false)

let acousticGuitar = AcousticGuitar(brand: "Roland", stringGauge: "light")
acousticGuitar.tune()
acousticGuitar.play(music)

piano.play(music)

Piano.whiteKeys
Piano.blackKeys

//: [Next](@next)
