struct Configuration: Equatable {
    var position: Position
    var bearing: Bearing
}

struct Position: Equatable {
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

enum Move {
    case leftTurn
    case rightTurn
    case forwardStep
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

    init(startingConfiguration: Configuration) {
        self.configuration = startingConfiguration
    }
    
    mutating func go(moves: [Move]) {
        for move in moves {
            switch move {
            case .leftTurn:
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
            case .rightTurn:
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
            case .forwardStep:
                switch configuration.bearing {
                case .east:
                    configuration.position.longitude += 1
                case .south:
                    configuration.position.latitude -= 1
                case .west:
                    configuration.position.longitude -= 1
                case .north:
                    configuration.position.latitude += 1
                }
            }
        }
    }
}
