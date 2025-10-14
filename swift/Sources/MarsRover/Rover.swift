struct RoverState {
    var latitude = defaultLatitude
    var longitude = defaultLongitude
    var bearing = defaultBearing

    static let defaultLatitude: Int = 0
    static let defaultLongitude: Int = 0
    static let defaultBearing = Bearing.north
}

enum Bearing {
    case north
    case west
    case south
    case east
}

extension Bearing: CustomStringConvertible {
    var description: String {
        switch self {
        case .north: "N"
        case .west: "W"
        case .south: "S"
        case .east: "E"
        }
    }
}

struct Rover {
    private var state: RoverState

    static let leftTurn: Character = "L"
    static let rightTurn: Character = "R"
    static let forwardStep: Character = "M"

    init(startingState: RoverState) {
        self.state = startingState
    }
    
    mutating func go(commands: String) {
        for command in commands {
            switch command {
            case Rover.leftTurn:
                switch state.bearing {
                case .east:
                    state.bearing = .north
                case .north:
                    state.bearing = .west
                case .west:
                    state.bearing = .south
                case .south:
                    state.bearing = .east
                }
            case Rover.rightTurn:
                switch state.bearing {
                case .east:
                    state.bearing = .south
                case .south:
                    state.bearing = .west
                case .west:
                    state.bearing = .north
                case .north:
                    state.bearing = .east
                }
            case Rover.forwardStep:
                switch state.bearing {
                case .east:
                    state.latitude += 1
                case .south:
                    state.longitude -= 1
                case .west:
                    state.latitude -= 1
                case .north:
                    state.longitude += 1
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
