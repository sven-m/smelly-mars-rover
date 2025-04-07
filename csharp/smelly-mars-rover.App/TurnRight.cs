namespace smelly_mars_rover.App
{
    public class TurnRight : ICommand
    {
        public void ApplyTo(Position position)
        {
            Dictionary<Direction, Direction> rightTurns = new Dictionary<Direction, Direction>
            {
                { Direction.East, Direction.South },
                { Direction.South, Direction.West },
                { Direction.West, Direction.North },
                { Direction.North, Direction.East },
            };
            position._direction = rightTurns[position._direction];
        }
    }
}