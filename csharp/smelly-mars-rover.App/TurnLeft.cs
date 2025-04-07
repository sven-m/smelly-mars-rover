namespace smelly_mars_rover.App
{
    public class TurnLeft : ICommand
    {
        public void ApplyTo(Position position)
        {
            Dictionary<Direction, Direction> leftTurns = new Dictionary<Direction, Direction>
            {
                { Direction.East, Direction.North },
                { Direction.North, Direction.West },
                { Direction.West, Direction.South },
                { Direction.South, Direction.East },
            };
            position._direction = leftTurns[position._direction];
        }
    }
}