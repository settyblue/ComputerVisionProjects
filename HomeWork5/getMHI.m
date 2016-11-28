function [ MHI ] = getMHI( foreground_binary_collection, number_of_frames )
%GETMHI Summary of this function goes here
%   Detailed explanation goes here
    MHI = cell(1,number_of_frames);
    MHI{1} = foreground_binary_collection{1}.*number_of_frames;

    for i=2:number_of_frames
        current_frame = foreground_binary_collection{i};
        for p=1:size(current_frame,1)
            for q=1:size(current_frame,2)
                if (current_frame(p,q) == 1)
                    MHI{i}(p,q) = number_of_frames;
                else
                    if(MHI{i-1}(p,q) > 1)
                        MHI{i}(p,q) = MHI{i-1}(p,q)-1;
                    else
                        MHI{i}(p,q) = 0;
                    end
                end
            end
        end
    end

end

