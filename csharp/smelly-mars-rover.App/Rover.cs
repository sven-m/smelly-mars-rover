namespace smelly_mars_rover.App
{
    public class Rover
    {
        private readonly Position _position;

        public Rover(string startingPosition)
        {
            _position = new Position(startingPosition);
        }

        public void Go(string instructions)
        {
            foreach (var command in instructions)
            {
                switch (command)
                {
                    case 'L': _position.TurnLeft(); break;
                    case 'R': _position.TurnRight(); break;
                    case 'M': _position.MoveForward(); break;
                }
            }
        }

        public string Position()
        {
            return _position.ToString();
        }
    }
}