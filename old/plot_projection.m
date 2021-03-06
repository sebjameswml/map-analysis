function [] = plot_projection(params,direction)

    if strcmp(direction,'FTOC')
        field_coords = params.FTOC.field_points;
        coll_coords = params.FTOC.coll_points;
        list_of_neighbours = params.FTOC.list_of_neighbours;
        color = 'k';
        num_points = params.FTOC.numpoints;
        takeout = params.FTOC.takeout;
        list_of_points = setdiff(1:num_points,takeout);
        sets_of_intersections = params.FTOC.sets_of_intersections;
    end
    
    if strcmp(direction,'CTOF')
        coll_coords = params.CTOF.coll_points;
        field_coords = params.CTOF.field_points;
        list_of_neighbours = params.CTOF.list_of_neighbours;
        color = 'b';
        num_points = params.CTOF.numpoints;
        takeout = params.CTOF.takeout;
        list_of_points = setdiff(1:num_points,takeout);
        sets_of_intersections = params.CTOF.sets_of_intersections;
    end
         
   figure(1)
   
   subplot(1,2,1)
   print_links(list_of_points, field_coords, list_of_neighbours, color);
   hold on
   [cross_points,list_of_crossings] = make_cross_list(list_of_points,sets_of_intersections);
   print_links(cross_points, field_coords, list_of_crossings, 'r');
   anchors = plot_anchors(field_coords,params.anchors,[]);
   axis ij
   
   subplot(1,2,2)
   print_links(list_of_points, coll_coords, list_of_neighbours, color);
   hold on
   [cross_points,list_of_crossings] = make_cross_list(list_of_points,sets_of_intersections);
   print_links(cross_points, coll_coords, list_of_crossings, 'r');
   plot_anchors(coll_coords,params.anchors,anchors);
   axis ij