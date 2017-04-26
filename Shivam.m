children = obj.sdiv.split(box);
                for i = 1:4
                    child = children(i);
                    if child ~= box && (child.type == BoxType.MIXED || child.type == BoxType.UNKNOWN)
                        put into q
                    end
                end
                
                
                 function flag = has(array, elem)
            flag = false;
            for i = 1:length(array)
                if(array(i)==elem)
                    flag = true;
                    break;
                end
            end
        end