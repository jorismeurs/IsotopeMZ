classdef isotopeMZ

    properties (Constant = true)
       version = '0.0.3'; 
    end
    properties
        z_max
        inputMZ
    end
    
    properties (Access = private)
       mass13C = 1.003355;
    end
    
    methods
        function obj = isotopeMZ()
            obj.z_max = 4;
            obj.inputMZ = [];
        end
        
        function obj = calculateIsotopes(obj)
            clc
            obj = validateInput(obj);
            fprintf('*********************\n');
            fprintf('Theoretical m/z 13C isotope at charge z \n');
            for j = 1:obj.z_max
                mzOutput = double(obj.inputMZ+(obj.mass13C/double(j)));
                fprintf('z = %d:    m/z %.5f \n',j,mzOutput);
            end
            fprintf('*********************\n');
        end
        
        function obj = validateInput(obj)
           if isempty(obj.inputMZ)
               disp('Enter a value for input m/z');
               return
           end
           if ~isnumeric(obj.inputMZ) || ~isnumeric(obj.z_max) 
               disp('All input values should be numbers');
               return
           end
           if obj.inputMZ < 1 || obj.z_max < 1 
              disp('All input values should be 1 or greater');
              return
           end
           if ~isinteger(obj.z_max)
              obj.z_max = uint8(obj.z_max);
           end
        end
    end
    
end

