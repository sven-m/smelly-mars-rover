class RoverState {
    var latitude = defaultLatitude
    var longitude = defaultLongitude
    var bearing = defaultBearing

    static let defaultLatitude: Int = 0
    static let defaultLongitude: Int = 0
    static let defaultBearing: Character = "N"
}

class Rover {
    private var state = RoverState()
    
    init(startConfiguration: String = "") {
        let configurationComponents = startConfiguration.split(separator: " ")
        if configurationComponents.count >= 3 {
            state.latitude = Int(configurationComponents[0]) ?? RoverState.defaultLatitude
            state.longitude = Int(configurationComponents[1]) ?? RoverState.defaultLongitude
            state.bearing = configurationComponents[2].first ?? RoverState.defaultBearing
        }
    }
    
    func go(commands: String) {
        for command in commands {
            switch command {
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
