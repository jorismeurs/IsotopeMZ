classdef isotopeMZ

    properties (Constant = true)
       version = '0.0.2'; 
    end
    properties
        z
        maxOutput
        inputMZ
    end
    
    properties (Access = private)
       mass13C = 1.003355;
    end
    
    methods
        function obj = isotopeMZ()
            obj.z = 1;
            obj.maxOutput = 1;
            obj.inputMZ = [];
        end
        
        function obj = calculateIsotopes(obj)
            clc
            obj = validateInput(obj);
            fprintf('*********************\n');
            for j = 1:obj.maxOutput
                mzOutput = obj.inputMZ+(obj.mass13C/obj.z);
                fprintf('Isotope %d:    m/z %.5f \n',j,mzOutput);
            end
            fprintf('*********************\n');
        end
        
        function obj = validateInput(obj)
           if isempty(obj.inputMZ)
               disp('Enter a value for input m/z');
               return
           end
           if ~isnumeric(obj.inputMZ) || ~isnumeric(obj.z) || ~isnumeric(obj.maxOutput)
               disp('All input values should be numbers');
               return
           end
           if obj.inputMZ < 1 || obj.z < 1 || obj.maxOutput  < 1
              disp('All input values should be 1 or greater');
              return
           end
           if ~isinteger(obj.z)
               obj.z = uint8(obj.z);
           end
           if ~isinteger(obj.maxOutput)
               obj.maxOutput = uint8(obj.maxOutput); 
           end
        end
    end
    
end

