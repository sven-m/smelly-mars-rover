class RoverState {
    var latitude: Int = 0
    var yy: Int = 0
    var dd: Character = "N"
}

class Rover {
    private var state = RoverState()
    
    init(startingPosition: String = "") {
        let s = startingPosition.split(separator: " ")
        if s.count >= 3 {
            state.latitude = Int(s[0]) ?? 0
            state.yy = Int(s[1]) ?? 0
            state.dd = s[2].first ?? "N"
        }
    }
    
    func go(_ cms: String) {
        for c in cms {
            switch c {
            case "L":
                switch state.dd {
                case "E":
                    state.dd = "N"
                case "N":
                    state.dd = "W"
                case "W":
                    state.dd = "S"
                case "S":
                    state.dd = "E"
                default:
                    break
                }
            case "R":
                switch state.dd {
                case "E":
                    state.dd = "S"
                case "S":
                    state.dd = "W"
                case "W":
                    state.dd = "N"
                case "N":
                    state.dd = "E"
                default:
                    break
                }
            case "M":
                switch state.dd {
                case "E":
                    state.latitude += 1
                case "S":
                    state.yy -= 1
                case "W":
                    state.latitude -= 1
                case "N":
                    state.yy += 1
                default:
                    break
                }
            default:
                break
            }
        }
    }
    
    func pos() -> String {
        return "\(state.latitude) \(state.yy) \(state.dd)"
    }
}
