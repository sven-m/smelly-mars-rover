class RoverState {
    var latitude: Int = 0
    var longitude: Int = 0
    var bearing: Character = "N"
}

class Rover {
    private var state = RoverState()
    
    init(startConfiguration: String = "") {
        let configurationComponents = startConfiguration.split(separator: " ")
        if configurationComponents.count >= 3 {
            state.latitude = Int(configurationComponents[0]) ?? 0
            state.longitude = Int(configurationComponents[1]) ?? 0
            state.bearing = configurationComponents[2].first ?? "N"
        }
    }
    
    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch state.bearing {
                case "E":
                    state.bearing = "N"
                case "N":
                    state.bearing = "W"
                case "W":
                    state.bearing = "S"
                case "S":
                    state.bearing = "E"
                default:
                    break
                }
            case "R":
                switch state.bearing {
                case "E":
                    state.bearing = "S"
                case "S":
                    state.bearing = "W"
                case "W":
                    state.bearing = "N"
                case "N":
                    state.bearing = "E"
                default:
                    break
                }
            case "M":
                switch state.bearing {
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
    
    func positionAndBearing() -> String {
        return "\(state.latitude) \(state.longitude) \(state.bearing)"
    }
}
