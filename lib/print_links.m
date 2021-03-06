function [] = print_links(list_of_points, coords, list_of_neighbours, ...
                          color, linewidth)
    if (~exist('linewidth'))
        linewidth = 0.5;
    end
        
    all_nodes = unique(list_of_neighbours);
    nodes_to_remove = setdiff(all_nodes,list_of_points);
    active_list_of_neighbours = remove_links_including_nodes(list_of_neighbours,nodes_to_remove);
    %[links_to_remove, ~ ] = find(ismember(list_of_neighbours,nodes_to_remove));
    %links_to_remove = unique(links_to_remove);
    %active_list_of_neighbours = list_of_neighbours;
    %active_list_of_neighbours(links_to_remove,:) = [];
    point1_x = coords(active_list_of_neighbours(:,1),1)';
    point2_x = coords(active_list_of_neighbours(:,2),1)';
    point1_y = coords(active_list_of_neighbours(:,1),2)';
    point2_y = coords(active_list_of_neighbours(:,2),2)';

    plot([point1_x;point2_x],[point1_y;point2_y],'Color',color, ...
         'LineWidth', linewidth)

% Local Variables:
% matlab-indent-level: 4
% End:
    