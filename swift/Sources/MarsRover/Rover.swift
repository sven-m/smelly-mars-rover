struct Configuration: Equatable {
    var position: Position = .init()
    var bearing: Bearing = .default

    var positionAhead: Position {
        switch bearing {
        case .north: .init(latitude: position.latitude + 1, longitude: position.longitude)
        case .west: .init(latitude: position.latitude, longitude: position.longitude - 1)
        case .south: .init(latitude: position.latitude - 1, longitude: position.longitude)
        case .east: .init(latitude: position.latitude, longitude: position.longitude + 1)
        }
    }
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

    var left: Self {
        switch self {
        case .north: .west
        case .west: .south
        case .south: .east
        case .east: .north
        }
    }

    var right: Self {
        left.left.left
    }

    static let `default` = Self.north
}

enum Move {
    case leftTurn
    case rightTurn
    case forwardStep
}

struct Rover {
    private(set) var configuration: Configuration

    init(startingConfiguration: Configuration = .init()) {
        self.configuration = startingConfiguration
    }
    
    mutating func go(moves: [Move]) {
        for move in moves {
            switch move {
            case .leftTurn:
                configuration.bearing = configuration.bearing.left
            case .rightTurn:
                configuration.bearing = configuration.bearing.right
            case .forwardStep:
                configuration.position = configuration.positionAhead
            }
        }
    }
}
