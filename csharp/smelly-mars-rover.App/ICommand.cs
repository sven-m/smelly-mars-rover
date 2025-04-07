namespace smelly_mars_rover.App
{
    public interface ICommand
    {
        void ApplyTo(Position position);
    }
}