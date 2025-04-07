namespace smelly_mars_rover.App
{
    public class Rover
    {
        private static readonly Dictionary<Direction, Direction> LeftTurns = new()
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
            foreach (var instruction in instructions)
            {
                Go(instruction);
            }
        }

        private void Go(char instruction)
        {
            switch (instruction)
            {
                case 'L':
                    _position._direction = LeftTurns[_position._direction];
                    break;
                case 'R':
                    _position._direction = RightTurns[_position._direction];
                    break;
                case 'M':
                    if (_position._direction == Direction.East)
                    {
                        _position._x++;
                    }

                    if (_position._direction == Direction.South)
                    {
                        _position._y--;
                    }

                    if (_position._direction == Direction.West)
                    {
                        _position._x--;
                    }

                    if (_position._direction == Direction.North)
                    {
                        _position._y++;
                    }

                    break;
            }
        }

        public string Position()
        {
            return $"{_position._x} {_position._y} {_position._direction.ToString()[0]}";
        }
    }
}