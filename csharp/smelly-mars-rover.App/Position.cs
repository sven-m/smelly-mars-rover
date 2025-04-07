namespace smelly_mars_rover.App
{
    public class Position(string initialPosition) : IEquatable<Position>
    {
        private int _x = int.Parse(initialPosition.Split(' ')[0]);
        private int _y = int.Parse(initialPosition.Split(' ')[1]);
        private Direction _direction = (initialPosition.Split(' ')[2]).Parse();

        public bool Equals(Position other)
        {
            return _x == other._x && _y == other._y && _direction == other._direction;
        }

        public override string ToString()
        {
            return $"{_x} {_y} {_direction.ToString()[0]}";
        }

        public void TurnLeft()
        {
            Dictionary<Direction, Direction> leftTurns = new Dictionary<Direction, Direction>
            {
                { Direction.East, Direction.North },
                { Direction.North, Direction.West },
                { Direction.West, Direction.South },
                { Direction.South, Direction.East },
            };
            _direction = leftTurns[_direction];
        }
        
        public void TurnRight()
        {
            Dictionary<Direction, Direction> rightTurns = new Dictionary<Direction, Direction>
            {
                { Direction.East, Direction.South },
                { Direction.South, Direction.West },
                { Direction.West, Direction.North },
                { Direction.North, Direction.East },
            };
            _direction = rightTurns[_direction];
        }

        public void MoveForward()
        {
            if (_direction == Direction.East) { _x++; }
            if (_direction == Direction.South) { _y--; }
            if (_direction == Direction.West) { _x--; }
            if (_direction == Direction.North) { _y++; }
        }
    }
}