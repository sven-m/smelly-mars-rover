namespace smelly_mars_rover.App
{
    public class Rover
    {
        private readonly Position _position;
        private readonly string _commands = string.Empty;

        public Rover(Position position)
        {
            _position = position;
        }

        public Rover(string startingPosition)
        {
            _position = new Position(startingPosition);
        }

        public Position CurrentPosition()
        {
            return _position;
        }

        public void SendCommands(List<ICommand> commands)
        {
            commands.ForEach(command => command.ApplyTo(_position));
        }

        public void ExecuteCommands()
        {
            foreach (var command in _commands)
            {
                if (command == 'L')
                {
                    _position.TurnLeft();
                }

                if (command == 'R')
                {
                    _position.TurnRight();
                }

                if (command == 'M')
                {
                    _position.MoveForward();
                }
            }

        }

        public void Go(string instructions)
        {
            foreach (var command in instructions)
            {
                if (command == 'L')
                {
                    _position.TurnLeft();
                }

                if (command == 'R')
                {
                    _position.TurnRight();
                }

                if (command == 'M')
                {
                    _position.MoveForward();
                }
            }
        }
        
        public string Position()
            {
                return _position.ToString();
            }
        }
    }