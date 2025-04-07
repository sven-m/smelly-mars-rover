//----------------
//Test Input: 1
//----------------
//1 2 N Position and direction of the landed rover
//LMLMLMLMM sequence of commands for the rover
//----------------
//Expected Output: 1
//----------------
//1 3 N Final position and direction of the rover

//----------------
//Test Input: 2
//----------------
//3 3 E - Position and direction of the landed rover
//MMRMMRMRRM - sequence of commands for the rover
//
//----------------
//Expected Output: 2
//----------------
//5 1 E


using NUnit.Framework;
using smelly_mars_rover.App;

namespace smelly_mars_rover.Tests;

[TestFixture]
public class MarsRoverShould
{
    [TestCase("1 2 N", "", "1 2 N")]
    [TestCase("1 2 N", "L", "1 2 W")]
    [TestCase("1 2 W", "L", "1 2 S")]
    [TestCase("1 2 S", "L", "1 2 E")]
    [TestCase("1 2 E", "L", "1 2 N")]
    [TestCase("1 2 N", "R", "1 2 E")]
    [TestCase("1 2 E", "R", "1 2 S")]
    [TestCase("1 2 S", "R", "1 2 W")]
    [TestCase("1 2 W", "R", "1 2 N")]
    [TestCase("1 2 N", "M", "1 3 N")]
    [TestCase("1 2 E", "M", "2 2 E")]
    [TestCase("1 2 S", "M", "1 1 S")]
    [TestCase("1 2 W", "M", "0 2 W")]
    [TestCase("1 2 N", "LMLMLMLMM", "1 3 N")]
    [TestCase("3 3 E", "MMRMMRMRRM", "5 1 E")]
    public void ExecuteCommands(string stratingPosition, string instructions, string expectedOutput)
    {
        var rover = new Rover(stratingPosition);

        rover.Go(instructions);

        Assert.That(rover.Pos(), Is.EqualTo(expectedOutput));
    }
}
