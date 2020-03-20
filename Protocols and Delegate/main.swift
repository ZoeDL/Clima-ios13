protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func analyzeSituation() {
        print("Could you tell me what is the situation?")
    }
    
    func performMedicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The paramedic does the chest compression, 30 per second")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does the chest compression, 30 per second")
    }
    
    func useStethescope() {
        print("Listening for heart sound")
    }
}

// automatically adopt the protocol
class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Singing staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr....")
    }
}

var emilio = EmergencyCallHandler()
//var pet = Paramedic(handler: emilio)
var Angela = Surgeon(handler: emilio)

emilio.analyzeSituation()
emilio.performMedicalEmergency()
