import XCTest
@testable import MarsRover

final class RoverTests: XCTestCase {
    func testRoverMovements() {
        let testCases: [(Configuration, String, Configuration)] = [
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                " ",
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                String(Rover.leftTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
                String(Rover.leftTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
                String(Rover.leftTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
                String(Rover.leftTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                String(Rover.rightTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
                String(Rover.rightTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
                String(Rover.rightTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
                String(Rover.rightTurn),
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                String(Rover.forwardStep),
                Configuration(position: .init(latitude: 1, longitude: 3), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .east),
                String(Rover.forwardStep),
                Configuration(position: .init(latitude: 2, longitude: 2), bearing: .east),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .south),
                String(Rover.forwardStep),
                Configuration(position: .init(latitude: 1, longitude: 1), bearing: .south),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .west),
                String(Rover.forwardStep),
                Configuration(position: .init(latitude: 0, longitude: 2), bearing: .west),
            ),
            (
                Configuration(position: .init(latitude: 1, longitude: 2), bearing: .north),
                [
                    Rover.leftTurn,
                    Rover.forwardStep,
                    Rover.leftTurn,
                    Rover.forwardStep,
                    Rover.leftTurn,
                    Rover.forwardStep,
                    Rover.leftTurn,
                    Rover.forwardStep,
                    Rover.forwardStep,
                ].map { String($0) }.joined(),
                Configuration(position: .init(latitude: 1, longitude: 3), bearing: .north),
            ),
            (
                Configuration(position: .init(latitude: 3, longitude: 3), bearing: .east),
                [
                    Rover.forwardStep,
                    Rover.forwardStep,
                    Rover.rightTurn,
                    Rover.forwardStep,
                    Rover.forwardStep,
                    Rover.rightTurn,
                    Rover.forwardStep,
                    Rover.rightTurn,
                    Rover.rightTurn,
                    Rover.forwardStep,
                ].map { String($0) }.joined(),
                Configuration(position: .init(latitude: 5, longitude: 1), bearing: .east),
            )
        ]
        
        for (startingConfiguration, instructions, expectedOutput) in testCases {
            var rover = Rover(startingConfiguration: startingConfiguration)
            rover.go(commands: instructions)
            XCTAssertEqual(rover.configuration, expectedOutput, "Failed for starting position: \(startingConfiguration), instructions: \(instructions)")
        }
    }
}
