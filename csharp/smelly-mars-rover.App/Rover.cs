namespace smelly_mars_rover.App
{
    public class Rover(string initialPosition)
    {
        private int _x = int.Parse(initialPosition.Split(' ')[0]);
        private int _y = int.Parse(initialPosition.Split(' ')[1]);
        private char _dir = (initialPosition.Split(' ')[2])[0];

        private static readonly Dictionary<char, char> LeftTurns = new()
        {
            { 'E', 'N' },
            { 'N', 'W' },
            { 'W', 'S' },
            { 'S', 'E' },
        };

        private static readonly Dictionary<char, char> RightTurns = new()
        {
            { 'E', 'S' },
            { 'S', 'W' },
            { 'W', 'N' },
            { 'N', 'E' },
        };


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
                    _dir = LeftTurns[_dir];
                    break;
                case 'R':
                    _dir = RightTurns[_dir];
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