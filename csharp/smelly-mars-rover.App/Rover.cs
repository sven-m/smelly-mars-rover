namespace smelly_mars_rover.App
{
    public class Rover(string initialPosition)
    {
        private int _x = int.Parse(initialPosition.Split(' ')[0]);
        private int _y = int.Parse(initialPosition.Split(' ')[1]);
        private char _dir = (initialPosition.Split(' ')[2])[0];

        public void Go(string instructions)
        {
            foreach (var instruction in instructions)
            {
                Go(instruction);
            }
        }

        private void Go(char instruction)
        {
            switch (instruction)
            {
                case 'L':
                    if (_dir == 'E')
                    {
                        _dir = 'N';
                    }
                    else if (_dir == 'N')
                    {
                        _dir = 'W';
                    }
                    else if (_dir == 'W')
                    {
                        _dir = 'S';
                    }
                    else if (_dir == 'S')
                    {
                        _dir = 'E';
                    }

                    break;
                case 'R':
                    if (_dir == 'E')
                    {
                        _dir = 'S';
                    }
                    else if (_dir == 'S')
                    {
                        _dir = 'W';
                    }
                    else if (_dir == 'W')
                    {
                        _dir = 'N';
                    }
                    else if (_dir == 'N')
                    {
                        _dir = 'E';
                    }
                    
                    break;
                case 'M':
                    if (_dir == 'E')
                    {
                        _x++;
                    }

                    if (_dir == 'S')
                    {
                        _y--;
                    }

                    if (_dir == 'W')
                    {
                        _x--;
                    }

                    if (_dir == 'N')
                    {
                        _y++;
                    }

                    break;
            }
        }

        public string Position()
        {
            return $"{_x} {_y} {_dir}";
        }
    }
}