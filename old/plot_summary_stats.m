function [] = plot_summary_stats()
    
    summary_stats = load('summary_stats.csv','csv');
    num_datasets = size(summary_stats,1);
    new_column = zeros(num_datasets,1);
    summary_stats = [new_column,summary_stats];
    
    for i = 1:num_datasets
        id = summary_stats(i,2);
        
        if ismember(id, [6,10,15,73,80])
            summary_stats(i,1) = 1; %WT
        end
        
        if ismember(id, [155, 156, 163, 165, 262])
            summary_stats(i,1) = 2; %b2
        end
        
        if ismember(id, [82,84,94,161,162])
            summary_stats(i,1) = 3; %Het
        end
        
        if ismember(id, [4, 54, 55, 56, 58])
            summary_stats(i,1) = 4; %Hom
        end
    end
        
    wt = find(summary_stats(:,1) == 1);
    b2 = find(summary_stats(:,1) == 2);
    het = find(summary_stats(:,1) == 3);
    hom = find(summary_stats(:,1) == 4);
    
    num_wt = length(wt);
    num_b2 = length(b2);
    num_het = length(het);
    num_hom = length(hom);
    
 
%------------------------------------------------------------------
%             Dispersions
%------------------------------------------------------------------
figure(8)
clf

%CTOF field scatter
subplot(1,2,1)

% column in summary_stats table
disp_angle = 54+1;
disp_xrad = 55+1;
disp_yrad = 56+1;

wt_mean_disp_angle = mean(summary_stats(wt,disp_angle))*2*pi/360;
wt_mean_disp_xrad = mean(summary_stats(wt,disp_xrad));
wt_mean_disp_yrad = mean(summary_stats(wt,disp_yrad));

b2_mean_disp_angle = mean(summary_stats(b2,disp_angle))*2*pi/360;
b2_mean_disp_xrad = mean(summary_stats(b2,disp_xrad));
b2_mean_disp_yrad = mean(summary_stats(b2,disp_yrad));

het_mean_disp_angle = mean(summary_stats(het,disp_angle))*2*pi/360;
het_mean_disp_xrad = mean(summary_stats(het,disp_xrad));
het_mean_disp_yrad = mean(summary_stats(het,disp_yrad));

hom_mean_disp_angle = mean(summary_stats(hom,disp_angle))*2*pi/360;
hom_mean_disp_xrad = mean(summary_stats(hom,disp_xrad));
hom_mean_disp_yrad = mean(summary_stats(hom,disp_yrad));

[~, x_ell_wt, y_ell_wt] = ellipse(wt_mean_disp_xrad,wt_mean_disp_yrad,wt_mean_disp_angle,0,0);
[~, x_ell_b2, y_ell_b2] = ellipse(b2_mean_disp_xrad,b2_mean_disp_yrad,b2_mean_disp_angle,0,0);
[~, x_ell_het, y_ell_het] = ellipse(het_mean_disp_xrad,het_mean_disp_yrad,het_mean_disp_angle,0,0);
[~, x_ell_hom, y_ell_hom] = ellipse(hom_mean_disp_xrad,hom_mean_disp_yrad,hom_mean_disp_angle,0,0);

plot(x_ell_wt,y_ell_wt,'k','LineWidth',2)
hold on
plot(x_ell_b2,y_ell_b2,'b','LineWidth',2)
plot(x_ell_het,y_ell_het,'r','LineWidth',2)
plot(x_ell_hom,y_ell_hom,'g','LineWidth',2)
plot(-18:-14,ones(5,1).*-18,'k', 'LineWidth',3)%scale bar
axis([-20,20,-20,20])
set(gca,'PlotBoxAspectRatio',[1 1 1])
 axis off

%FTOC coll scatter
subplot(1,2,2)

disp_angle = 20+1;
disp_xrad = 21+1;
disp_yrad = 22+1;

wt_mean_disp_angle = mean(summary_stats(wt,disp_angle))*2*pi/360;
wt_mean_disp_xrad = mean(summary_stats(wt,disp_xrad));
wt_mean_disp_yrad = mean(summary_stats(wt,disp_yrad));

b2_mean_disp_angle = mean(summary_stats(b2,disp_angle))*2*pi/360;
b2_mean_disp_xrad = mean(summary_stats(b2,disp_xrad));
b2_mean_disp_yrad = mean(summary_stats(b2,disp_yrad));

het_mean_disp_angle = mean(summary_stats(het,disp_angle))*2*pi/360;
het_mean_disp_xrad = mean(summary_stats(het,disp_xrad));
het_mean_disp_yrad = mean(summary_stats(het,disp_yrad));

hom_mean_disp_angle = mean(summary_stats(hom,disp_angle))*2*pi/360;
hom_mean_disp_xrad = mean(summary_stats(hom,disp_xrad));
hom_mean_disp_yrad = mean(summary_stats(hom,disp_yrad));

[~, x_ell_wt, y_ell_wt] = ellipse(wt_mean_disp_xrad,wt_mean_disp_yrad,wt_mean_disp_angle,0,0,'k');
[~, x_ell_b2, y_ell_b2] = ellipse(b2_mean_disp_xrad,b2_mean_disp_yrad,b2_mean_disp_angle,0,0,'b');
[~, x_ell_het, y_ell_het] = ellipse(het_mean_disp_xrad,het_mean_disp_yrad,het_mean_disp_angle,0,0,'r');
[~, x_ell_hom, y_ell_hom] = ellipse(hom_mean_disp_xrad,hom_mean_disp_yrad,hom_mean_disp_angle,0,0,'g');

plot(x_ell_wt,y_ell_wt,'k','LineWidth',2)
hold on
plot(x_ell_b2,y_ell_b2,'b','LineWidth',2)
plot(x_ell_het,y_ell_het,'r','LineWidth',2)
plot(x_ell_hom,y_ell_hom,'g','LineWidth',2)
plot(-28:-18,ones(11,1).*-28,'k', 'LineWidth',3)%scale bar
legend('WT','\beta2-/-', 'Het TKO', 'Hom TKO')

axis([-30,30,-30,30])
set(gca,'PlotBoxAspectRatio',[1 1 1])
 axis off
%------------------------------------------------------------------
% Number of Ectopics
%------------------------------------------------------------------

figure(9)
clf

subplot(1,2,1)

num_ect = 25+1;

wt_ect = summary_stats(wt,num_ect);
b2_ect = summary_stats(b2,num_ect);
het_ect = summary_stats(het,num_ect);
hom_ect = summary_stats(hom,num_ect);



plot(ones(num_wt,1),wt_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
hold on
plot(2*ones(num_b2,1),b2_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
plot(3*ones(num_het,1),het_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
plot(4*ones(num_hom,1),hom_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[1,2,3,4], 'XTickLabel',{'WT','b2','Het','Hom'},'LineWidth',2)
axis([0.5,4.5,0,80])

ylabel('Number of Ectopics')

subplot(1,2,2)
%FTOC
nodes_in_subgraph_FTOC = 16+1;
nodes_in_subgraph_baseline_FTOC = 17+1;
total_nodes = 2+1;
nodes_in_subgraph_CTOF = 50+1;
nodes_in_subgraph_baseline_CTOF = 51+1;

summary_subgraph_FTOC = (summary_stats(:,nodes_in_subgraph_FTOC) - summary_stats(:,nodes_in_subgraph_baseline_FTOC))./ ...
    (summary_stats(:,total_nodes) - summary_stats(:,nodes_in_subgraph_baseline_FTOC));
summary_subgraph_CTOF = (summary_stats(:,nodes_in_subgraph_CTOF) - summary_stats(:,nodes_in_subgraph_baseline_CTOF))./ ...
    (summary_stats(:,total_nodes) - summary_stats(:,nodes_in_subgraph_baseline_CTOF));


wt_subgraph_FTOC = mean(summary_subgraph_FTOC(wt));
b2_subgraph_FTOC = mean(summary_subgraph_FTOC(b2));
het_subgraph_FTOC = mean(summary_subgraph_FTOC(het));
hom_subgraph_FTOC = mean(summary_subgraph_FTOC(hom));

wt_subgraph_std_FTOC = std(summary_subgraph_FTOC(wt));
b2_subgraph_std_FTOC = std(summary_subgraph_FTOC(b2));
het_subgraph_std_FTOC = std(summary_subgraph_FTOC(het));
hom_subgraph_std_FTOC = std(summary_subgraph_FTOC(hom));

wt_subgraph_CTOF = mean(summary_subgraph_CTOF(wt));
b2_subgraph_CTOF = mean(summary_subgraph_CTOF(b2));
het_subgraph_CTOF = mean(summary_subgraph_CTOF(het));
hom_subgraph_CTOF = mean(summary_subgraph_CTOF(hom));

wt_subgraph_std_CTOF = std(summary_subgraph_CTOF(wt));
b2_subgraph_std_CTOF = std(summary_subgraph_CTOF(b2));
het_subgraph_std_CTOF = std(summary_subgraph_CTOF(het));
hom_subgraph_std_CTOF = std(summary_subgraph_CTOF(hom));

errorbar(1,wt_subgraph_FTOC,wt_subgraph_std_FTOC,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
hold on
errorbar(2,b2_subgraph_FTOC,b2_subgraph_std_FTOC,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(3,het_subgraph_FTOC,het_subgraph_std_FTOC,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(4,hom_subgraph_FTOC,hom_subgraph_std_FTOC,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)

errorbar(1,wt_subgraph_CTOF,wt_subgraph_std_CTOF,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
hold on
errorbar(2,b2_subgraph_CTOF,b2_subgraph_std_CTOF,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(3,het_subgraph_CTOF,het_subgraph_std_CTOF,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(4,hom_subgraph_CTOF,hom_subgraph_std_CTOF,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)


set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[1,2,3,4], 'XTickLabel',{'WT','b2','Het','Hom'},'YTick',[0,.25,.50,.75,1],'YTickLabel', {'0','.25','.50','.75','1'},'LineWidth',2)
ylabel('% nodes included in ordered submap');
axis([0.5,4.5,0,1])

    figure(8)
    filename = 'summary_stats_fig8.pdf';
    print(8,'-dpdf',filename)
    
    figure(9)
    filename = 'summary_stats_fig9.pdf';
    print(9,'-dpdf',filename)
