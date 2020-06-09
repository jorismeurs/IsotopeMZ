classdef isotopeMZ

    properties (Constant = true)
       version = '0.0.4'; 
    end
    properties
        z_max
        inputMZ
        inputIntensity
    end
    
    properties (Access = private)
       mass13C = 1.003355;
       abundance = 1.109;
    end
    
    methods
        function obj = isotopeMZ()
            obj.z_max = 4;
            obj.inputMZ = [];
            obj.inputIntensity = [];
        end
        
        function calculateIsotopes(obj)
            clc
            obj = validateInput(obj);
            fprintf('*********************\n');
            fprintf('Theoretical m/z 13C isotope at charge z \n');
            for j = 1:obj.z_max
                mzOutput = double(obj.inputMZ+(obj.mass13C/double(j)));
                if ~isempty(obj.inputIntensity)
                    validateIntensity(obj)
                    intOutput = (obj.abundance/100)*obj.inputIntensity;
                    fprintf('z = %d:    m/z %.5f | int: %.2f \n',j,mzOutput,intOutput);
                else
                    fprintf('z = %d:    m/z %.5f \n',j,mzOutput);
                end
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
        
        function validateIntensity(obj)
           if ~isnumeric(obj.inputIntensity)
              disp('Value should be a number');
              return
           end
           if obj.inputIntensity <= 0 
              disp('Intensity should be greater than 0');
              return
           end
        end
    end
    
end

