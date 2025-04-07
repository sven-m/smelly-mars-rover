namespace smelly_mars_rover.App
{
    public class TurnLeft : ICommand
    {
        public void ApplyTo(Position position)
        {
            position.TurnLeft();
        }
    }
}