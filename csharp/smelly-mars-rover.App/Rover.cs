namespace smelly_mars_rover.App
{
    public class Rover
    {
        private static readonly Dictionary<Direction, Direction> LeftTurns = new Dictionary<Direction, Direction>
        {
            { Direction.East, Direction.North },
            { Direction.North, Direction.West },
            { Direction.West, Direction.South },
            { Direction.South, Direction.East },
        };

        private static readonly Dictionary<Direction, Direction> RightTurns = new()
        {
            { Direction.East, Direction.South },
            { Direction.South, Direction.West },
            { Direction.West, Direction.North },
            { Direction.North, Direction.East },
        };

        private readonly Position _position;

        public Rover(string startingPosition)
        {
            _position = new Position(startingPosition);
        }

        public void Go(string instructions)
        {
            foreach (var command in instructions)
            {
                switch (command)
                {
                    case 'L':
                        _position._direction = LeftTurns[_position._direction];
                        break;
                    case 'R':
                        _position._direction = RightTurns[_position._direction];
                        break;
                    case 'M': _position.MoveForward(); break;
                }
            }
        }

        public string Position()
        {
            return _position.ToString();
        }
    }
}