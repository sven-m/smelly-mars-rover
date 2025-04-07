namespace smelly_mars_rover.App
{
    public class Sprint : ICommand
    {
        public void ApplyTo(Position position)
        {
            position.MoveForward();
            position.MoveForward();
        }
    }
}