function params = run_data(id)

    params = getparams(id);
    params = load_data(params);
    params = find_active_pixels(params);
    params = make_list_of_points(params);
    params = select_point_positions(params,'CTOF');
    params = select_point_positions(params,'FTOC');
    params = create_projection(params, 'CTOF');
    params = create_projection(params, 'FTOC');
    params = triangulation(params,'CTOF');
    params = triangulation(params,'FTOC');
    params = find_crossings(params, 'CTOF');
    params = find_crossings(params, 'FTOC');
    params = find_ectopics(params);
    params = find_largest_subgraph(params,'CTOF');
    params = find_largest_subgraph(params,'FTOC');
    params = find_link_angles(params,'FTOC');
    params = find_link_angles(params,'CTOF');
    
    plot_figure2(params)
    plot_figure3(params)
    plot_figure6(params, 'FTOC')
    figure
    plot_ectopics(params)