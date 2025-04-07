namespace smelly_mars_rover.App
{
    public class Rover(string initialPosition)
    {
        private int _x = int.Parse(initialPosition.Split(' ')[0]);
        private int _y = int.Parse(initialPosition.Split(' ')[1]);
        private Direction _direction = (initialPosition.Split(' ')[2]).Parse();
        private char _dir = (initialPosition.Split(' ')[2])[0];

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
                    _direction = LeftTurns[_direction];
                    break;
                case 'R':
                    _direction = RightTurns[_direction];
                    break;
                case 'M':
                    if (_direction == Direction.East)
                    {
                        _x++;
                    }

                    if (_direction == Direction.South)
                    {
                        _y--;
                    }

                    if (_direction == Direction.West)
                    {
                        _x--;
                    }

                    if (_direction == Direction.North)
                    {
                        _y++;
                    }

                    break;
            }
        }

        public string Position()
        {
            return $"{_x} {_y} {_direction.ToString()[0]}";
        }
    }
}