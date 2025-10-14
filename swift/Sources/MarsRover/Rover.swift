class RoverState {
    var latitude: Int = 0
    var longitude: Int = 0
    var heading: Character = "N"
}

class Rover {
    private var state = RoverState()
    
    init(startConfiguration: String = "") {
        let configurationComponents = startConfiguration.split(separator: " ")
        if configurationComponents.count >= 3 {
            state.latitude = Int(configurationComponents[0]) ?? 0
            state.longitude = Int(configurationComponents[1]) ?? 0
            state.heading = configurationComponents[2].first ?? "N"
        }
    }
    
    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch state.heading {
                case "E":
                    state.heading = "N"
                case "N":
                    state.heading = "W"
                case "W":
                    state.heading = "S"
                case "S":
                    state.heading = "E"
                default:
                    break
                }
            case "R":
                switch state.heading {
                case "E":
                    state.heading = "S"
                case "S":
                    state.heading = "W"
                case "W":
                    state.heading = "N"
                case "N":
                    state.heading = "E"
                default:
                    break
                }
            case "M":
                switch state.heading {
                case "E":
                    state.latitude += 1
                case "S":
                    state.longitude -= 1
                case "W":
                    state.latitude -= 1
                case "N":
                    state.longitude += 1
                default:
                    break
                }
            default:
                break
            }
        }
    }
    
    func pos() -> String {
        return "\(state.latitude) \(state.longitude) \(state.heading)"
    }
}
