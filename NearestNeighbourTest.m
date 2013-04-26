
classdef NearestNeighbourTest < matlab.unittest.TestCase
   
    methods(Test)
        function testFindsSolutions(testCase)
            input = [
                [0,  5,  30, 29, 11];
                [5,  0,  21, 7,  15];
                [30, 21,  0, 8,  16];
                [29,  7,  8, 0,   3];
                [11, 15, 16, 3,   0];
            ];
        
            expSolution = [
                [0,   5,  0,  29,  11];
                [5,   0,  0,   7,  15];
                [0,   21, 0,   8,  16];
                [29,  7,  8,   0,  3];
                [11,  15, 0,   3,  0];
            ];
        
            testCase.verifyEqual(NearestNeighbours(input), expSolution);
        end
    end
    
end

