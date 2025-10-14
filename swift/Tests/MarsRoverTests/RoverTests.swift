import XCTest
@testable import MarsRover

final class RoverTests: XCTestCase {
    func testRoverMovements() {
        let testCases: [(String, String, String)] = [
            (
                "1 2 \(RoverState.bearingNorth)",
                " ",
                "1 2 \(RoverState.bearingNorth)"
            ),
            (
                "1 2 \(RoverState.bearingNorth)",
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingWest)"
            ),
            (
                "1 2 \(RoverState.bearingWest)",
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingSouth)"
            ),
            (
                "1 2 \(RoverState.bearingSouth)",
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingEast)"
            ),
            (
                "1 2 \(RoverState.bearingEast)",
                String(Rover.leftTurn),
                "1 2 \(RoverState.bearingNorth)"
            ),
            (
                "1 2 \(RoverState.bearingNorth)",
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingEast)"
            ),
            (
                "1 2 \(RoverState.bearingEast)",
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingSouth)"
            ),
            (
                "1 2 \(RoverState.bearingSouth)",
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingWest)"
            ),
            (
                "1 2 \(RoverState.bearingWest)",
                String(Rover.rightTurn),
                "1 2 \(RoverState.bearingNorth)"
            ),
            (
                "1 2 \(RoverState.bearingNorth)",
                String(Rover.forwardStep),
                "1 3 \(RoverState.bearingNorth)"
            ),
            (
                "1 2 \(RoverState.bearingEast)",
                String(Rover.forwardStep),
                "2 2 \(RoverState.bearingEast)"
            ),
            (
                "1 2 \(RoverState.bearingSouth)",
                String(Rover.forwardStep),
                "1 1 \(RoverState.bearingSouth)"
            ),
            (
                "1 2 \(RoverState.bearingWest)",
                String(Rover.forwardStep),
                "0 2 \(RoverState.bearingWest)"
            ),
            (
                "1 2 \(RoverState.bearingNorth)",
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
                "3 3 \(RoverState.bearingEast)",
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
        
        for (startingPosition, instructions, expectedOutput) in testCases {
            let rover = Rover(startConfiguration: startingPosition)
            rover.go(commands: instructions)
            XCTAssertEqual(rover.positionAndBearing(), expectedOutput, "Failed for starting position: \(startingPosition), instructions: \(instructions)")
        }
    }
}
