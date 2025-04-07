namespace smelly_mars_rover.App
{
    public enum Direction
    {
        East = 'E',
        North = 'N',
        South = 'S',
        West ='W',
        Mona = 'M'
    } 
    

    public static class DirectionExtensions
    {
        public static Direction Parse(this string direction)
        {
            return direction switch
            {
                "N" => Direction.North,
                "E" => Direction.East,
                "S" => Direction.South,
                "W" => Direction.West,
                _ => throw new ArgumentException($"Unknown direction: {direction}")
            };
        }
    }
}