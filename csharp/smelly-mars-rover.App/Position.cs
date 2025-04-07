namespace smelly_mars_rover.App
{
    public class Position(string initialPosition) : IEquatable<Position>
    {
        public int _x = int.Parse(initialPosition.Split(' ')[0]);
        public int _y = int.Parse(initialPosition.Split(' ')[1]);
        public Direction _direction = (initialPosition.Split(' ')[2]).Parse();

        public bool Equals(Position other)
        {
            return _x == other._x && _y == other._y && _direction == other._direction;
        }
    }
}