function [] = plot_summary_stats()
    
    summary_stats = load('summary_stats.cvs','cvs');
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
    
 
%------------------------------------------------------------------
%             Dispersions
%------------------------------------------------------------------
figure(8)
clf

%CTOF field scatter
subplot(1,2,1)

% column in summary_stats table
disp_angle = 37;
disp_xrad = 38;
disp_yrad = 39;

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

axis([-20,20,-20,20])
set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[-20,0,20], 'YTick',[-20,0,20],'LineWidth',2)


%FTOC coll scatter
subplot(1,2,2)

disp_angle = 12;
disp_xrad = 13;
disp_yrad = 14;

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

set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[-28,0,28], 'XTickLabel',{'-250','0','250'},'YTick',[-28,0,28],'YTickLabel',{'-250','0','250'},'LineWidth',2)
axis([-30,30,-30,30])

%------------------------------------------------------------------
% Number of Ectopics
%------------------------------------------------------------------

figure(9)
clf

subplot(1,2,1)

num_ect = 17;

wt_ect = summary_stats(wt,num_ect);
b2_ect = summary_stats(b2,num_ect);
het_ect = summary_stats(het,num_ect);
hom_ect = summary_stats(hom,num_ect);



plot(ones(5,1),wt_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
hold on
plot(2*ones(5,1),b2_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
plot(3*ones(5,1),het_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
plot(4*ones(5,1),hom_ect,'ok','MarkerSize',8, 'MarkerFaceColor','k')
set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[1,2,3,4], 'XTickLabel',{'WT','b2','Het','Hom'},'LineWidth',2)
axis([0.5,4.5,0,80])

ylabel('Number of Ectopics')

subplot(1,2,2)
%FTOC
nodes_in_subgraph = 9;
nodes_in_major = 20;
nodes_in_minor = 21;

wt_subgraph = mean(summary_stats(wt,nodes_in_subgraph));
b2_subgraph = mean(summary_stats(b2,nodes_in_subgraph));
het_subgraph = mean(summary_stats(het,nodes_in_subgraph));
hom_subgraph = mean(summary_stats(hom,nodes_in_subgraph));

wt_subgraph_std = std(summary_stats(wt,nodes_in_subgraph));
b2_subgraph_std = std(summary_stats(b2,nodes_in_subgraph));
het_subgraph_std = std(summary_stats(het,nodes_in_subgraph));
hom_subgraph_std = std(summary_stats(hom,nodes_in_subgraph));

%major
wt_subgraph_major = mean(summary_stats(wt(wt_ect>5),nodes_in_major));
b2_subgraph_major = mean(summary_stats(b2(b2_ect>5),nodes_in_major));
het_subgraph_major = mean(summary_stats(het(het_ect>5),nodes_in_major));
hom_subgraph_major = mean(summary_stats(hom(hom_ect>5),nodes_in_major));

wt_subgraph_major_std = std(summary_stats(wt(wt_ect>5),nodes_in_major));
b2_subgraph_major_std = std(summary_stats(b2(b2_ect>5),nodes_in_major));
het_subgraph_major_std = std(summary_stats(het(het_ect>5),nodes_in_major));
hom_subgraph_major_std = std(summary_stats(hom(hom_ect>5),nodes_in_major));

%minor
wt_subgraph_minor = mean(summary_stats(wt(wt_ect>5),nodes_in_minor));
b2_subgraph_minor = mean(summary_stats(b2(b2_ect>5),nodes_in_minor));
het_subgraph_minor = mean(summary_stats(het(het_ect>5),nodes_in_minor));
hom_subgraph_minor = mean(summary_stats(hom(hom_ect>5),nodes_in_minor));

wt_subgraph_minor_std = std(summary_stats(wt(wt_ect>5),nodes_in_minor));
b2_subgraph_minor_std = std(summary_stats(b2(b2_ect>5),nodes_in_minor));
het_subgraph_minor_std = std(summary_stats(het(het_ect>5),nodes_in_minor));
hom_subgraph_minor_std = std(summary_stats(hom(hom_ect>5),nodes_in_minor));

errorbar(1,wt_subgraph,wt_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
hold on
errorbar(2,b2_subgraph,b2_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(3,het_subgraph,het_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(4,hom_subgraph,hom_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)

errorbar(1,wt_subgraph_major,wt_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(2,b2_subgraph_major,b2_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(3,het_subgraph_major,het_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(4,hom_subgraph_major,hom_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)

errorbar(1,wt_subgraph_minor,wt_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(2,b2_subgraph_minor,b2_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(3,het_subgraph_minor,het_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(4,hom_subgraph_minor,hom_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(1,wt_subgraph,wt_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
hold on
errorbar(2,b2_subgraph,b2_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(3,het_subgraph,het_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(4,hom_subgraph,hom_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)

errorbar(1,wt_subgraph_major,wt_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(2,b2_subgraph_major,b2_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(3,het_subgraph_major,het_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(4,hom_subgraph_major,hom_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)

errorbar(1,wt_subgraph_minor,wt_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(2,b2_subgraph_minor,b2_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(3,het_subgraph_minor,het_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(4,hom_subgraph_minor,hom_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(1,wt_subgraph,wt_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
hold on
errorbar(2,b2_subgraph,b2_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(3,het_subgraph,het_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)
errorbar(4,hom_subgraph,hom_subgraph_std,'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10)

errorbar(1,wt_subgraph_major,wt_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(2,b2_subgraph_major,b2_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(3,het_subgraph_major,het_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)
errorbar(4,hom_subgraph_major,hom_subgraph_major_std,'ob', 'MarkerFaceColor', 'b', 'MarkerSize',10)

errorbar(1,wt_subgraph_minor,wt_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(2,b2_subgraph_minor,b2_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(3,het_subgraph_minor,het_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)
errorbar(4,hom_subgraph_minor,hom_subgraph_minor_std,'og', 'MarkerFaceColor', 'g', 'MarkerSize',6)

set(gca,'PlotBoxAspectRatio',[1 1 1], 'FontSize', 16, 'XTick',[1,2,3,4], 'XTickLabel',{'WT','b2','Het','Hom'},'YTick',[0,.25,.50,.75,1],'YTickLabel', {'0','.25','.50','.75','1'},'LineWidth',2)
ylabel('% nodes included in ordered submap');
axis([0.5,4.5,0,1])