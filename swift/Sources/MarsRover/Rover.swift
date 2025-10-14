struct Configuration {
    var position: Position
    var bearing: Bearing
}

struct Position {
    var latitude = 0
    var longitude = 0
}

enum Bearing {
    case north
    case west
    case south
    case east

    static let `default` = Self.north
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
    private(set) var configuration: Configuration

    static let leftTurn: Character = "L"
    static let rightTurn: Character = "R"
    static let forwardStep: Character = "M"

    init(startingConfiguration: Configuration) {
        self.configuration = startingConfiguration
    }
    
    mutating func go(commands: String) {
        for command in commands {
            switch command {
            case Rover.leftTurn:
                switch configuration.bearing {
                case .east:
                    configuration.bearing = .north
                case .north:
                    configuration.bearing = .west
                case .west:
                    configuration.bearing = .south
                case .south:
                    configuration.bearing = .east
                }
            case Rover.rightTurn:
                switch configuration.bearing {
                case .east:
                    configuration.bearing = .south
                case .south:
                    configuration.bearing = .west
                case .west:
                    configuration.bearing = .north
                case .north:
                    configuration.bearing = .east
                }
            case Rover.forwardStep:
                switch configuration.bearing {
                case .east:
                    configuration.position.latitude += 1
                case .south:
                    configuration.position.longitude -= 1
                case .west:
                    configuration.position.latitude -= 1
                case .north:
                    configuration.position.longitude += 1
                }
            default:
                break
            }
        }
    }
    
    func positionAndBearing() -> String {
        return "\(configuration.position.latitude) \(configuration.position.longitude) \(configuration.bearing)"
    }
}
