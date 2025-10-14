import XCTest
@testable import MarsRover

final class RoverTests: XCTestCase {
    func testRoverMovements() {
        let testCases: [(RoverState, String, String)] = [
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingNorth),
                " ",
                "1 2 \(RoverState.bearingNorth)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingNorth),
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingWest)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingWest),
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingSouth)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingSouth),
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingEast)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingEast),
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingNorth)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingNorth),
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingEast)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingEast),
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingSouth)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingSouth),
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingWest)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingWest),
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingNorth)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingNorth),
                String(Rover.forwardStep),
                "1 3 \(RoverState.bearingNorth)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingEast),
                String(Rover.forwardStep),
                "2 2 \(RoverState.bearingEast)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingSouth),
                String(Rover.forwardStep),
                "1 1 \(RoverState.bearingSouth)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingWest),
                String(Rover.forwardStep),
                "0 2 \(RoverState.bearingWest)"
            ),
            (
                .init(latitude: 1, longitude: 2, bearing: RoverState.bearingNorth),
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
                "1 3 \(RoverState.bearingNorth)"
            ),
            (
                .init(latitude: 3, longitude: 3, bearing: RoverState.bearingEast),
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
                "5 1 \(RoverState.bearingEast)"
            )
        ]
        
        for (startingState, instructions, expectedOutput) in testCases {
            var rover = Rover(startingState: startingState)
            rover.go(commands: instructions)
            XCTAssertEqual(rover.positionAndBearing(), expectedOutput, "Failed for starting position: \(startingState), instructions: \(instructions)")
        }
    }
}
