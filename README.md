# Requirements to run this sample:

1. XCode 10.1 and iOS version 11.0 onwards.
2. Sample using Swift 4.2.
3. I am not using any third-party dependencies code, not Cocoa pod nor Carthage.
4. This sample code is also covering the unit and UI test case using XCTestCase.
5. This sample uses MVC design pattern, Strategy Design Pattern



![](MarsRoverDemo1.gif)
# MarsRoverChallenge

* Mars Rover Challenge:

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth. 
A rover's position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. 
The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North. In order to control a rover, NASA sends a simple string of letters.

The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, 
without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading. 
Assume that the square directly North from (x, y) is (x, y+1).  

* INPUT: 

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0. 
The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. 
The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau. 
The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation. 
Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.  

* OUTPUT: 

The output for each rover should be its final co-ordinates and heading.  

* INPUT AND OUTPUT:  

* Test Input: 
5 5 

1 2 N

LMLMLMLMM 

3 3 E 

MMRMMRMRRM  

* Expected Output: 

1 3 N

5 1 E

#STRATEGY to solve this problem:
1) At the outset of this problem I have created the problem on the below image, and created soultion the the paper.

![](PaperGraphMarsRover.jpg)

# Unit Testing Coverage is ~83%
![](UnitTestCoverage.png)



