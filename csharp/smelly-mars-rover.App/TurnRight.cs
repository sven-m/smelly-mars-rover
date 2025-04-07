namespace smelly_mars_rover.App
{
    public class TurnRight : ICommand
    {
        public void ApplyTo(Position position)
        {
            position.TurnRight();
        }
    }
}