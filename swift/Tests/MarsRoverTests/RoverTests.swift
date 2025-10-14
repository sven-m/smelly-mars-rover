import XCTest
@testable import MarsRover

final class RoverTests: XCTestCase {
    func testRoverMovements() {
        let testCases: [(Configuration, [Move], Configuration)] = [
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                [],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                [.leftTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
                [.leftTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
                [.leftTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
                [.leftTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                [.rightTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
                [.rightTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
                [.rightTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
                [.rightTurn],
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                [.forwardStep],
                Configuration(position: .init(latitude: 1, longitude: 3), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
                [.forwardStep],
                Configuration(position: .init(latitude: 2, longitude: 2), bearing: .east),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
                [.forwardStep],
                Configuration(position: .init(latitude: 1, longitude: 1), bearing: .south),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
                [.forwardStep],
                Configuration(position: .init(latitude: 0, longitude: 2), bearing: .west),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                [
                    .leftTurn,
                    .forwardStep,
                    .leftTurn,
                    .forwardStep,
                    .leftTurn,
                    .forwardStep,
                    .leftTurn,
                    .forwardStep,
                    .forwardStep,
                ],
                Configuration(position: .init(latitude: 1, longitude: 3), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 3, longitude: 3), bearing: .east),
                [
                    .forwardStep,
                    .forwardStep,
                    .rightTurn,
                    .forwardStep,
                    .forwardStep,
                    .rightTurn,
                    .forwardStep,
                    .rightTurn,
                    .rightTurn,
                    .forwardStep,
                ],
                Configuration(position: .init(latitude: 5, longitude: 1), bearing: .east),
            )
        ]
        
        for (startingConfiguration, moves, expectedOutput) in testCases {
            var rover = Rover(startingConfiguration: startingConfiguration)
            rover.go(moves: moves)
            XCTAssertEqual(rover.configuration, expectedOutput, "Failed for starting position: \(startingConfiguration), moves: \(moves)")
        }
    }
}
