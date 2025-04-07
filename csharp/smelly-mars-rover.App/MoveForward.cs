namespace smelly_mars_rover.App
{
    public class MoveForward : ICommand
    {
        public void ApplyTo(Position position)
        {
            position.MoveForward();
        }
    }
}