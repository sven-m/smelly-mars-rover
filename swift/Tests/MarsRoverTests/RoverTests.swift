import XCTest
@testable import MarsRover

final class RoverTests: XCTestCase {
    func testRoverMovements() {
        let testCases: [(RoverState, String, String)] = [
            (
                .init(latitude: 1, longitude: 2, bearing: .north),
                " ",
                "1 2 \(Bearing.north)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .north),
                String(Rover.leftTurn),
                "1 2 \(Bearing.west)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .west),
                String(Rover.leftTurn),
                "1 2 \(Bearing.south)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .south),
                String(Rover.leftTurn),
                "1 2 \(Bearing.east)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .east),
                String(Rover.leftTurn),
                "1 2 \(Bearing.north)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .north),
                String(Rover.rightTurn),
                "1 2 \(Bearing.east)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .east),
                String(Rover.rightTurn),
                "1 2 \(Bearing.south)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .south),
                String(Rover.rightTurn),
                "1 2 \(Bearing.west)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .west),
                String(Rover.rightTurn),
                "1 2 \(Bearing.north)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .north),
                String(Rover.forwardStep),
                "1 3 \(Bearing.north)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .east),
                String(Rover.forwardStep),
                "2 2 \(Bearing.east)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .south),
                String(Rover.forwardStep),
                "1 1 \(Bearing.south)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .west),
                String(Rover.forwardStep),
                "0 2 \(Bearing.west)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: .north),
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
                "1 3 \(Bearing.north)"
            ),
            (
                .init(latitude: 3, longitude: 3, bearing: .east),
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
                "5 1 \(Bearing.east)"
            )
        ]
        
        for (startingState, instructions, expectedOutput) in testCases {
            var rover = Rover(startingState: startingState)
            rover.go(commands: instructions)
            XCTAssertEqual(rover.positionAndBearing(), expectedOutput, "Failed for starting position: \(startingState), instructions: \(instructions)")
        }
    }
}
