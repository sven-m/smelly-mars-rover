namespace smelly_mars_rover.App
{
    public class Sprint : ICommand
    {
        public void ApplyTo(Position position)
        {
            if (position._direction == Direction.East) {
                position._x++; }
            if (position._direction == Direction.South) {
                position._y--; }
            if (position._direction == Direction.West) {
                position._x--; }
            if (position._direction == Direction.North) {
                position._y++; }

            if (position._direction == Direction.East) {
                position._x++; }
            if (position._direction == Direction.South) {
                position._y--; }
            if (position._direction == Direction.West) {
                position._x--; }
            if (position._direction == Direction.North) {
                position._y++; }
        }
    }
}