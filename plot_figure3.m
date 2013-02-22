function params = plot_figure3(params, ErrorType, axis_style)
% PLOT_FIGURE3 - Plot summarising complementary and superposed distributions
%       
%   For the FTOC direction, the distribution of pixels on the
%   colliculus associated with the points within each small circular
%   area of field of radius params.field_radius is the called the
%   complementary distribution.
%    
%   A view of the overall pattern of complementary distributions in a
%   given data set can be gained by superposing on the same plot the
%   individual complementary distributions from all the chosen
%   locations after transforming them to a common origin and then
%   modelling the superposed distribution as a 2D Gaussian. The
%   ellipse with subaxes of lengths equal to the standard deviations
%   in the directions of these axes encloses 68.5% of all the points
%   in the superposed distribution.
%
%   This function plots the complementary distributions for each node
%   in the lattice in the FTOC and CTOF directions and the superposed
%   distribution all nodes in the lattice in the FTOC and CTOF
%   directions. The following properties controll what is plotted
%   and the appearance of the plot:
%   
%   - ErrorType: If 'sd' (default), plot standard deviation of
%       complementary distributions (as in Figure 5 of Willshaw et
%       al. 2013). If 'sem', plot standard errors in the mean of
%       complementary distributions (as in Figure 7C of Willshaw et
%       al. 2013).
%
%   - AxisStyle: If 'crosshair' (default), plot crosshairs and
%       scalebars (as in all figures in Willshaw et al. 2013). If
%       'box', plot conventional axes.
%
%   INPUTS 
%   
%   The following fields are read from the params structure:
%   params.ellipse, params.FTOC.numpoints, params.CTOF.numpoints,
%   params.full_field, params.full_coll, params.field_radius,
%   params.coll_radius
%    
%   OUTPUTS
%    
%   Various fields are added to params:    
%       
%   - Properties of the superposed distribution (also referred to as
%     "overall complementary distribution"; see Table 5 in Willshaw et
%     al., 2013):
%
%     params.stats.FTOC.overall_dispersion_xrad - Length of major axis
%       ellipse fitted to superposed distribution
%
%     params.stats.FTOC.overall_dispersion_yrad - Length of minor axis
%       ellipse fitted to superposed distribution
%
%     params.stats.FTOC.overall_dispersion_angle - Angle of major axis
%       of ellipse. The zero degree line is defined on the colliculus
%       as rostral to caudal and in the visual field as temporal to
%       nasal. Clockwise rotations are positive.
% 
%   - If 'ErrorType' is 'sd', mean properties of the complementary
%     distributions: 
%    
%     params.stats.FTOC.dispersion_xrad - Mean length of major axes
%       of ellipses fitted to complementary distributions, referred
%       to as SDW1 in Willshaw et al. (2013), Table 3.
%
%     params.stats.FTOC.dispersion_yrad - Mean length of minor axes
%       of ellipses fitted to complementary distributions, referred
%       to as SDW2 in Willshaw et al. (2013), Table 3.
%
    
if (~exist('axis_style'))     
    axis_style = 'crosshair'; % Other option is 'box'
end
if (~exist('ErrorType'))     
    ErrorType = 'sem'; % Other option is 'sd'
end
% minor changes from plot_figure3.m
% mainly moving the plotting option
    xmean_coll = params.ellipse.x0;
    ymean_coll = params.ellipse.y0;
    
    figure(3)
    clf

    %FTOC

    
    num_points = params.FTOC.numpoints;
    full_field_coords = params.full_field;
    full_coll_coords = params.full_coll;
    radius = params.field_radius;
    field_centred_points = [];
    coll_centred_points = [];

    for point = 1:num_points
        centre = params.FTOC.field_points(point,:);
        [from_points,projection_points] = find_projection(centre,radius,full_field_coords,full_coll_coords);
        num_projection = length(projection_points);
        % plot_error_ellipse determines parameters of ellipse to be
        % drawn. x_radius is the length of the major axis and
        % y_radius is the length of the minor axis.
        [angle_f,x_radius_f,y_radius_f] = plot_error_ellipse(from_points);
        [angle_c,x_radius_c,y_radius_c] = plot_error_ellipse(projection_points);
        
        if (strcmp(ErrorType, 'sem'))
            % compute standard errors of mean 
            x_radius_f = x_radius_f/sqrt(num_projection);
            y_radius_f = y_radius_f/sqrt(num_projection);
            x_radius_c = x_radius_c/sqrt(num_projection);
            y_radius_c = y_radius_c/sqrt(num_projection);
        else
            % ErrorType == 'sd'; store standard deviation 
            x_radius_cc(point) = x_radius_c;
            y_radius_cc(point) = y_radius_c;
        end
        centred_points = projection_points - repmat(mean(projection_points),num_projection,1);

        coll_centred_points = [coll_centred_points; centred_points];
	

        subplot(2,3,1)
        ellipse(x_radius_f,y_radius_f,-angle_f,mean(from_points(:,1)),mean(from_points(:,2)),'k');
        hold on
        subplot(2,3,2)
        ellipse(x_radius_c,y_radius_c,-angle_c,mean(projection_points(:,1)),mean(projection_points(:,2)),'k');
        hold on
    end

    % use plot_error_ellipse to calculate overall angle, i.e. the
    % angle of the superposed distribution
    [angle_c,x_radius_c,y_radius_c] = plot_error_ellipse(coll_centred_points);

    params.stats.FTOC.overall_dispersion_angle = -angle_c;
    params.stats.FTOC.overall_dispersion_xrad = x_radius_c;
    params.stats.FTOC.overall_dispersion_yrad = y_radius_c;

    if (strcmp(ErrorType, 'sd'))
        params.stats.FTOC.dispersion_xrad = mean(x_radius_cc);
        params.stats.FTOC.dispersion_yrad = mean(y_radius_cc);
    end

    subplot(2,3,1)
    if (strcmp(axis_style, 'box'))
        axis ij
        set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[-50,0,50] ,'XTickLabel',{'-50','0','50'}, 'YTick',[-50,0,50] ,'YTickLabel',{'-50','0','50'})
    else % axis_style == 'crosshair'
        plot(zeros(101,1),-50:50,'Color',[0.7 0.7 0.7], 'Linewidth',1)
        hold on
        plot(-50:50,zeros(101,1),'Color',[0.7 0.7 0.7], 'Linewidth',1)
        plot(-45:-26,ones(20,1).*45,'k', 'LineWidth',3)%scale bar
        axis ij
        set(gca,'PlotBoxAspectRatio',[1 1 1])
        axis off
    end
    axis([-50 50 -50 50]);
    title('Field');
   
    subplot(2,3,2)
    axis ij
    axis([xmean_coll-70 xmean_coll+70 ymean_coll-70 ymean_coll+ ...
          70]);
    set(gca,'PlotBoxAspectRatio',[1 1 1])
    if (strcmp(axis_style, 'box'))
        set(gca, 'FontSize', 16, ...
                 'XTick',[xmean_coll-70,xmean_coll-70+56,xmean_coll-70+112], ...
                 'XTickLabel',{'0','0.5','1'}, ...
                 'YTick',[ymean_coll-70,ymean_coll-70+56,ymean_coll-70+112] ,...
                 'YTickLabel',{'0','0.5','1'})
    else
        plot(xmean_coll-65:xmean_coll-38,ones(28,1).*ymean_coll+65,'k', ...
             'LineWidth',3) %scale bar
        axis off
    end
    title('Colliculus');
    
    subplot(2,3,3)
    N = hist3(coll_centred_points,'edges', {(-56.5:1:56.5)', (-56.5:1:56.5)'});
    imagesc(N')
    hold on
    [~,x_ell,y_ell] = ellipse(x_radius_c,y_radius_c,-angle_c,mean(coll_centred_points(:,1))+57,mean(coll_centred_points(:,2))+57);
    plot(x_ell,y_ell,'w','LineWidth', 2)
    axis ij
    axis([1,113,1,113])
    if (strcmp(axis_style, 'box'))
        set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[1,57,113] , 'XTickLabel', {'-0.5','0','0.5'}, 'YTick',[1,57,113],'YTickLabel', {'-0.5','0','0.5'} )
    else %axis_style == 'crosshair')
        plot(4:14,ones(11,1).*110,'w', 'LineWidth',3)%scale bar        
        set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[1,57,113] , 'XTickLabel', {'-0.5','0','0.5'}, 'YTick',[1,57,113],'YTickLabel', {'-0.5','0','0.5'} )
        axis off
    end

      
    %CTOF
    
    num_points = params.CTOF.numpoints;
    radius = params.coll_radius;

    for point = 1:num_points
        centre = params.CTOF.coll_points(point,:);
        [from_points,projection_points] = find_projection(centre,radius,full_coll_coords,full_field_coords);
        num_projection = length(projection_points);
        [angle_c,x_radius_c,y_radius_c] = plot_error_ellipse(from_points);
        [angle_f,x_radius_f,y_radius_f] = ...
            plot_error_ellipse(projection_points);
        if (strcmp(ErrorType, 'sem'))
            % compute standard errors of mean 
            x_radius_f = x_radius_f/sqrt(num_projection);
            y_radius_f = y_radius_f/sqrt(num_projection);
            x_radius_c = x_radius_c/sqrt(num_projection);
            y_radius_c = y_radius_c/sqrt(num_projection);
        else % ErrorType == 'sd'
            x_radius_ff(point) = x_radius_f;
            y_radius_ff(point) = y_radius_f;
        end
      
        centred_points = projection_points - repmat(mean(projection_points),num_projection,1);
        field_centred_points = [field_centred_points; centred_points];

        subplot(2,3,4)
        ellipse(x_radius_f,y_radius_f,-angle_f, ...
                mean(projection_points(:,1)),mean(projection_points(:,2)),'b');
        hold on
        subplot(2,3,5)
        ellipse(x_radius_c,y_radius_c,-angle_c, ...
                mean(from_points(:,1)),mean(from_points(:,2)),'b');
        hold on
    end
    
    % use plot_error_ellipse to calculate characteristics of the
    % superposed distribution
    [angle_f,x_radius_f,y_radius_f] = plot_error_ellipse(field_centred_points);

    params.stats.CTOF.overall_dispersion_xrad = x_radius_f;
    params.stats.CTOF.overall_dispersion_yrad = y_radius_f;
    params.stats.CTOF.overall_dispersion_angle =-angle_f;
    
    if (strcmp(ErrorType, 'sd'))
        params.stats.CTOF.dispersion_xrad = mean(x_radius_ff);
        params.stats.CTOF.dispersion_yrad = mean(y_radius_ff);
    end

    subplot(2,3,4)
    if (strcmp(axis_style, 'crosshair'))
        plot(zeros(101,1),-50:50,'Color',[0.7 0.7 0.7], 'Linewidth',1)
        hold on
        plot(-50:50,zeros(101,1),'Color',[0.7 0.7 0.7], ...
             'Linewidth',1)
        axis off   
    else
        set(gca, 'FontSize', 16, 'XTick',[-50,0,50] ,'XTickLabel',{'-50','0','50'}, 'YTick',[-50,0,50] ,'YTickLabel',{'-50','0','50'})
    end
    axis ij
    set(gca,'PlotBoxAspectRatio',[1 1 1])
    axis([-50 50 -50 50]);
    
    subplot(2,3,5)
    axis ij
    axis([xmean_coll-70 xmean_coll+70 ymean_coll-70 ymean_coll+ ...
          70]);
    set(gca,'PlotBoxAspectRatio',[1 1 1])
    if (strcmp(axis_style, 'box'))
        set(gca, 'FontSize', 16, ...
                 'XTick',[xmean_coll-70,xmean_coll-70+56,xmean_coll-70+112], ...
                 'XTickLabel',{'0','0.5','1'}, ...
                 'YTick',[ymean_coll-70,ymean_coll-70+56,ymean_coll-70+112] ,...
                 'YTickLabel',{'0','0.5','1'})
    else % axis_style == 'crosshair'
        axis off
    end
    
    subplot(2,3,6)
    N = hist3(field_centred_points,'edges', {(-20.5:1:20.5)', (-20.5:1:20.5)'});
    imagesc(N')
    %plot(field_centred_points(:,1),field_centred_points(:,2),'x','Color',[0.8,0.8,0.8])
    hold on
    [~,x_ell,y_ell] = ellipse(x_radius_f,y_radius_f,-angle_f,mean(field_centred_points(:,1))+21,mean(field_centred_points(:,2))+21);
    plot(x_ell,y_ell,'w','LineWidth',2)
    if (strcmp(axis_style, 'crosshair'))
        plot(3:7,ones(5,1).*38,'w', 'LineWidth',3) %scale bar
        axis off   
    end
    axis ij
    set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[1,21,41] ,'XTickLabel',{'-20','0','20'}, 'YTick',[1,21,41],'YTickLabel',{'-20','0','20'} )
    axis([1,41,1,41])
  
    
    
    figure(3)
    filename = [num2str(params.id),'_fig3.pdf'];
    print(3,'-dpdf',filename)
    
% Local Variables:
% matlab-indent-level: 4
% End:
