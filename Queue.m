classdef Queue < handle

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	properties
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		lst = [Box2(0,0,-1)];
        goal = [];
	end

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	methods
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    % Constructor
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    function q = Queue(goal)
	    	q.goal = goal;
            q.lst(1) = [];
        end
        
        %add a box to queue
        function push(obj, value)
            if length(obj.lst) < 1
                obj.lst(1)= value;
            
            elseif obj.comp(value, obj.lst(1))
                obj.lst = [value obj.lst];
            else
                for i=2:length(obj.lst)
                    if obj.comp(value, obj.lst(i)) > 0
                        obj.lst = [obj.lst(1:i-1) value obj.lst(i:end)];
                        return;
                    end
                end
                obj.lst = [obj.lst value];
            end
        end
        
        %pop the nearest box to the goal
        function pop(obj)
            if(length(obj.lst)<1)
                return;
            end
            obj.lst(1) = [];
        end
        
        %compare two boxes and return true if first box is closer to goal
        function flag = comp(obj,a,b)
            flag = Geom2d.sep([a.x a.y], obj.goal) <= Geom2d.sep([b.x b.y], obj.goal);
        end
        
        %display all the boxes as x y center cordinates values
        function disp(obj)
            for i=1:length(obj.lst)
                disp(['x: ', num2str(obj.lst(i).x),' y:', num2str(obj.lst(i).y)]);
            end
        end
    end
  
    
    

	    
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	methods (Static = true)
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    % test()
	    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	    function flag = test()
            q = Queue([0,0]);
            q.push(Box2(2,4,1));
            q.push(Box2(9,9,10));
            %q.disp();
            q.push(Box2(2,5,1));
            q.push(Box2(3,7,1));
            q.push(Box2(1,4,1));
            q.disp();
            q.pop();
            disp('poped one item');
           
            q.disp();
            flag =1;
            
	    end

	end


end % Queue class

