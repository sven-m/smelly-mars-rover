class RoverState {
    var latitude = defaultLatitude
    var longitude = defaultLongitude
    var bearing = defaultBearing

    static let defaultLatitude: Int = 0
    static let defaultLongitude: Int = 0
    static let defaultBearing = RoverState.bearingNorth

    static let bearingNorth: Character = "N"
    static let bearingWest: Character = "W"
    static let bearingSouth: Character = "S"
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
                    state.bearing = RoverState.bearingNorth
                case RoverState.bearingNorth:
                    state.bearing = RoverState.bearingWest
                case RoverState.bearingWest:
                    state.bearing = RoverState.bearingSouth
                case RoverState.bearingSouth:
                    state.bearing = "E"
                default:
                    break
                }
            case "R":
                switch state.bearing {
                case "E":
                    state.bearing = RoverState.bearingSouth
                case RoverState.bearingSouth:
                    state.bearing = RoverState.bearingWest
                case RoverState.bearingWest:
                    state.bearing = RoverState.bearingNorth
                case RoverState.bearingNorth:
                    state.bearing = "E"
                default:
                    break
                }
            case "M":
                switch state.bearing {
                case "E":
                    state.latitude += 1
                case RoverState.bearingSouth:
                    state.longitude -= 1
                case RoverState.bearingWest:
                    state.latitude -= 1
                case RoverState.bearingNorth:
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
