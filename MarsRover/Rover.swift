public enum Direction: Int {
    case north = 1,
    east,
    south,
    west
}

final class Rover {
    
    // MARK:- Private Variables
    private var xPoint = 0
    private var yPoint = 0
    private lazy var facing: Direction = {
        return .north
    }()
    
    // MARK:- Public Functions
    public func setPosition(xPoint:Int, yPoint:Int, facing:Direction){
        self.xPoint = xPoint
        self.yPoint = yPoint
        self.facing = facing
    }
    
    @discardableResult public func currentPosition() -> String {
        switch facing {
        case .north:
            return "\(xPoint) \(yPoint) N"
        case .east:
            return "\(xPoint) \(yPoint) E"
        case .south:
            return "\(xPoint) \(yPoint) S"
        case .west:
            return "\(xPoint) \(yPoint) W"
        }
    }
    
    public func processRoverCommand(command:String) {
        _ = command.map { processCommand(char: $0) }
    }
    
    // MARK:- Private Functions
    private func processCommand(char: Character) {
        switch char {
        case "L": turnLeftCommand()
        case "R": turnRightCommand()
        case "M": moveCommand()
        default:  print(Constants.RoverInputs.errorInCommand)
        }
    }
    
    private func turnLeftCommand(){
        if (facing.rawValue - 1) < Direction.north.rawValue {
            facing = .west
        } else {
            guard let rawValueFacing = Direction(rawValue: facing.rawValue - 1) else { return }
            facing = rawValueFacing
        }
    }
    
    private func turnRightCommand(){
        if (facing.rawValue + 1) > Direction.west.rawValue {
            facing = .north
        } else {
            guard let rawValueFacing = Direction(rawValue: facing.rawValue + 1) else { return }
            facing = rawValueFacing
        }
    }
    
    private func moveCommand() {
        if (facing == .north && yPoint != 5 && yPoint >= 0) {
            yPoint = yPoint + 1
        } else if (facing == .east && xPoint != 5 && xPoint >= 0) {
            xPoint = xPoint + 1
        } else if (facing == .south && yPoint != 0 && yPoint >= 0) {
            yPoint = yPoint - 1
        } else if (facing == .west && xPoint != 0 && xPoint >= 0) {
            xPoint = xPoint - 1
        } else {
            print(Constants.RoverInputs.errorInRange)
        }
    }
}
