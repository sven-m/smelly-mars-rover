namespace smelly_mars_rover.App
{
    public class Rover
    {
        private RoverState _rs = new RoverState();
        public Rover():this(""){}

        public Rover(string p)
        {
            var s=p.Split(' ');
            var roverStae =  new RoverState { xx = int.Parse(s[0]), yy = int.Parse(s[1]), dd = s[2][0] };
            _rs.xx = int.Parse(s[0]); _rs.yy = int.Parse(s[1]);
            _rs.dd = s[2][0];
        }

        public void Go(string cms)
        {
            for(int i=0;i<cms.Length;i++)
            {
                //Handle instructions
                var c=cms[i];
                if(c=='L'){if(_rs.dd=='E'){_rs.dd='N';}else if(_rs.dd=='N'){_rs.dd='W';}else if(_rs.dd=='W'){_rs.dd='S';}else if(_rs.dd=='S'){_rs.dd='E';}}
                else if(c=='R'){if(_rs.dd=='E'){_rs.dd='S';}else if(_rs.dd=='S'){_rs.dd='W';}else if(_rs.dd=='W'){_rs.dd='N';}else if(_rs.dd=='N'){_rs.dd='E';}}
                else if(c=='M')
                {
                    if(_rs.dd=='E'){_rs.xx++;}
                    if(_rs.dd=='S'){_rs.yy--;}
                    if(_rs.dd=='W'){_rs.xx--;}
                    if(_rs.dd=='N'){_rs.yy++;}
                }
            }
        }

        public void G(char z){
            G(z.ToString()[0]);
        }

        public string XYD=>_rs.xx+" "+_rs.yy+" "+_rs.dd;

        public string Pos(){return XYD;}
    }

    public class RoverState
    {
        public int xx, yy; 
        public char dd;
    }
}