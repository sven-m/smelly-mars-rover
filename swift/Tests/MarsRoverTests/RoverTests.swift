import XCTest
@testable import MarsRover

final class RoverTests: XCTestCase {
    func testRoverMovements() {
        let testCases = [
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
                "R",
                "1 2 \(RoverState.bearingEast)"
            ),
            (
                "1 2 \(RoverState.bearingEast)",
                "R",
                "1 2 \(RoverState.bearingSouth)"
            ),
            (
                "1 2 \(RoverState.bearingSouth)",
                "R",
                "1 2 \(RoverState.bearingWest)"
            ),
            (
                "1 2 \(RoverState.bearingWest)",
                "R",
                "1 2 \(RoverState.bearingNorth)"
            ),
            (
                "1 2 \(RoverState.bearingNorth)",
                "M",
                "1 3 \(RoverState.bearingNorth)"
            ),
            (
                "1 2 \(RoverState.bearingEast)",
                "M",
                "2 2 \(RoverState.bearingEast)"
            ),
            (
                "1 2 \(RoverState.bearingSouth)",
                "M",
                "1 1 \(RoverState.bearingSouth)"
            ),
            (
                "1 2 \(RoverState.bearingWest)",
                "M",
                "0 2 \(RoverState.bearingWest)"
            ),
            (
                "1 2 \(RoverState.bearingNorth)",
                "LMLMLMLMM",
                "1 3 \(RoverState.bearingNorth)"
            ),
            (
                "3 3 \(RoverState.bearingEast)",
                "MMRMMRMRRM",
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
