function params = load_data(params)

    DATA = params.id;

 
    if DATA == 999
       load Raw_data/EphA3Kimaps4Willshaw.mat

       pone_fig3 = imread('pone_figure3.tif');

       pic=pone_fig3(9:465,649:1105,:);
       [Azim_phase,map_phaseA] = rgb2ind(pic,256);

       pic=pone_fig3(9:465,1581:2037,:);
       [Azim_amp,map_ampA] = rgb2ind(pic,100);

       pic=pone_fig3(484:940,649:1105,:);
       [Elev_phase,map_phaseE] = rgb2ind(pic,256);

       pic=pone_fig3(484:940,1581:2037,:);
       [Elev_amp,map_ampE] = rgb2ind(pic,100);

       ss='zebrafinch_fig3';

       figure(9991);
       imagesc(Azim_phase);

      hold on
       ellipse(params.ellipse.ra,params.ellipse.rb,params.ellipse.ang,params.ellipse.x0,params.ellipse.y0,'k');
       hold off
       colormap(map_phaseA);

       figure(9992);
       imagesc(Azim_amp);
     
       hold on
       ellipse(params.ellipse.ra,params.ellipse.rb,params.ellipse.ang,params.ellipse.x0,params.ellipse.y0,'k');
       hold off
       colormap(map_ampA);

       figure(9993);
       imagesc(Elev_phase);
       hold on
       ellipse(params.ellipse.ra,params.ellipse.rb,params.ellipse.ang,params.ellipse.x0,params.ellipse.y0,'k');
       hold off
       colormap(map_phaseE);

       figure(9994);
       imagesc(Elev_amp);

       hold on
       ellipse(params.ellipse.ra,params.ellipse.rb,params.ellipse.ang,params.ellipse.x0,params.ellipse.y0,'k');
       hold off
       colormap(map_ampE);

%            scaling of amplitudes to between 0 and 1
%            and convert to double
       Elev_amp = double(Elev_amp);
       Azim_amp = double(Azim_amp);

       maxElev=max(max(Elev_amp));
       maxAzim=max(max(Azim_amp));

       Elev_amp = Elev_amp/maxElev;
       Azim_amp = Azim_amp/maxAzim;
   
%            scale field positions between =-50 and +50
%            and convert to double

       Azim_phase = double(Azim_phase);
       Elev_phase = double(Elev_phase);

       Emax = max(max(Elev_phase));
       Amax = max(max(Azim_phase));
       MaxMax = max(Emax,Amax);

       AA = 100/MaxMax;
       Azim_phase =AA*Azim_phase-50;
       Elev_phase =AA*Elev_phase-50;
    end
    

    
 if DATA == 115
        load Raw_data/EphA3Kimaps4Willshaw.mat
        Azim_amp = EphA3ki_e115_Azim_amp;
        Elev_amp = EphA3ki_e115_Elev_amp;
        Azim_phase = EphA3ki_e115_Azim_ph;
        Elev_phase = EphA3ki_e115_Elev_ph;
        ss = 'EphA3 knockin 115 ';
    end 

    if DATA == 4
        load Raw_data/Ephrinmaps4Willshaw11.mat 
        Azim_amp = ephrin_m004_Azim_amp;
        Elev_amp = ephrin_m004_Elev_amp;
        Azim_phase = ephrin_m004_Azim_phase;
        Elev_phase = ephrin_m004_Elev_phase;
        ss = 'Homo triple knockout 004 ';
    end 

    if DATA == 54
        load Raw_data/Ephrinmaps4Willshaw11.mat 
        Azim_amp = ephrin_m054_Azim_amp;
        Elev_amp = ephrin_m054_Elev_amp;
        Azim_phase = ephrin_m054_Azim_phase;
        Elev_phase = ephrin_m054_Elev_phase;
        ss = 'Homo triple knockout 054 ';
    end 

    if DATA == 55
        load Raw_data/Ephrinmaps4Willshaw11.mat 
        Azim_amp = ephrin_m055_Azim_amp;
        Elev_amp = ephrin_m055_Elev_amp;
        Azim_phase = ephrin_m055_Azim_phase;
        Elev_phase = ephrin_m055_Elev_phase;
        ss = 'Homo triple knockout 055 ';
    end 

    if DATA == 56
        load Raw_data/Ephrinmaps4Willshaw11.mat 
        Azim_amp = ephrin_m056_Azim_amp;
        Elev_amp = ephrin_m056_Elev_amp;
        Azim_phase = ephrin_m056_Azim_phase;
        Elev_phase = ephrin_m056_Elev_phase;
        ss = 'Homo triple knockout 056 ';
    end 

    if DATA == 58
    %  This was the first TKO I analysed

       load Raw_data/Ephrinmaps4Willshaw11.mat 
       Azim_amp = ephrin_m058_Azim_amp;
       Elev_amp = ephrin_m058_Elev_amp;
       Azim_phase = ephrin_m058_Azim_phase;
       Elev_phase = ephrin_m058_Elev_phase;
       ss = 'Homo triple knockout 058 ';
    end 

    if DATA == 82
        load Raw_data/EphrinHetmaps4Willshaw.mat 
        Azim_amp = eph082_Azimuth_amp;
        Elev_amp = eph082_Elevation_amp;
        Azim_phase = eph082_Azimuth_phase;
        Elev_phase = eph082_Elevation_phase;
        ss = 'ephrin het TKO 3+/- 82 ';
    end 

    if DATA == 84
        load Raw_data/EphrinHetmaps4Willshaw.mat 
        Azim_amp = eph084_Azimuth_amp;
        Elev_amp = eph084_Elevation_amp;
        Azim_phase = eph084_Azimuth_phase;
        Elev_phase = eph084_Elevation_phase;
        ss = 'ephrin het TKO 5+/-  84 ';
    end 

    if DATA == 94
        load Raw_data/EphrinHetmaps4Willshaw.mat 
        Azim_amp = eph094_Azimuth_amp;
        Elev_amp = eph094_Elevation_amp;
        Azim_phase = eph094_Azimuth_phase;
        Elev_phase = eph094_Elevation_phase;
        ss = 'ephrin het TKO 5+/- 94 ';
    end 

    if DATA == 161
        load Raw_data/EphrinHetmaps4Willshaw-2.mat 
        Azim_amp = m161_azim_amp;
        Elev_amp = m161_elev_amp;
        Azim_phase = m161_azim_phase;
        Elev_phase = m161_elev_phase;
        ss = 'ephrin het TKO 3+/- 161 ';
    end 

    if DATA == 162
        load Raw_data/EphrinHetmaps4Willshaw-2.mat 
        Azim_amp = m162_azim_amp;
        Elev_amp = m162_elev_amp;
        Azim_phase = m162_azim_phase;
        Elev_phase = m162_elev_phase;
        ss = 'ephrin het TKO 3 +/- 162 ';
    end 


    if DATA == 155
        load Raw_data/B2maps4Willshaw19May09.mat
        Azim_amp = A55_Azim_amp;
        Elev_amp = A55_Elev_amp;
        Azim_phase =  A55_Azim_phase;
        Elev_phase =  A55_Elev_phase;
        ss = '\beta 2 knockout 155 ';
    end


    if DATA == 156
        load Raw_data/B2maps4Willshaw19May09.mat
        Azim_amp = A56_Azim_amp;
        Elev_amp = A56_Elev_amp;
        Azim_phase =  A56_Azim_phase;
        Elev_phase =  A56_Elev_phase;
        ss = '\beta 2 knockout 156 ';
    end

%   this was originally numbered 162
    if DATA == 262
        load Raw_data/B2maps4Willshaw19May09.mat
        Azim_amp = A62_Azim_amp;
        Elev_amp = A62_Elev_amp;
        Azim_phase =  A62_Azim_phase;
        Elev_phase =  A62_Elev_phase;
        ss = '\beta 2 knockout 262 ';
    end

    if DATA == 163
        load Raw_data/B2maps4Willshaw19May09.mat
        Azim_amp = A63_Azim_amp;
        Elev_amp = A63_Elev_amp;
        Azim_phase =  A63_Azim_phase;
        Elev_phase =  A63_Elev_phase;
        ss = '\beta 2 knockout 163 ';
    end

    if DATA == 165
        load Raw_data/B2maps4Willshaw19May09.mat
        Azim_amp = A65_Azim_amp;
        Elev_amp = A65_Elev_amp;
        Azim_phase =  A65_Azim_phase;
        Elev_phase =  A65_Elev_phase;
        ss = '\beta 2 knockout 165 ';
    end


    if DATA == 6
        load Raw_data/WTmaps4Willshaw19May09.mat
        Azim_amp = m006_Azim_amp;
        Elev_amp = m006_Elev_amp;
        Azim_phase =  m006_Azim_phase;
        Elev_phase =  m006_Elev_phase;
        ss = 'Wild type 006 ';
    end

    if DATA == 10
        load Raw_data/WTmaps4Willshaw19May09.mat
        Azim_amp = m010_Azim_amp;
        Elev_amp = m010_Elev_amp;
        Azim_phase =  m010_Azim_phase;
        Elev_phase =  m010_Elev_phase;
        ss = 'Wild type 010 ';
    end


    if DATA == 15
        load Raw_data/WTmaps4Willshaw19May09.mat
        Azim_amp = m015_Azim_amp;
        Elev_amp = m015_Elev_amp;
        Azim_phase =  m015_Azim_phase;
        Elev_phase =  m015_Elev_phase;
        ss = 'Wild type 015 ';
    end


    if DATA == 73
        load Raw_data/WTmaps4Willshaw19May09.mat
        Azim_amp = m073_Azim_amp;
        Elev_amp = m073_Elev_amp;
        Azim_phase =  m073_Azim_phase;
        Elev_phase =  m073_Elev_phase;
        ss = 'Wild type 073 ';
    end


    if DATA == 80
        load Raw_data/WTmaps4Willshaw19May09.mat
        Azim_amp = m080_Azim_amp;
        Elev_amp = m080_Elev_amp;
        Azim_phase =  m080_Azim_phase;
        Elev_phase =  m080_Elev_phase;
        ss = 'Wild type 080 ';
    end


% Data extracted from Cang et al. 2008. These were processed with the
% image_from_paper.m program which crops and normalises the colours.

    if DATA ==1001
        load Raw_data/WT6FromPaper.mat
        ss = 'Wild type 6 from paper';
    end

    if DATA ==1002
        load Raw_data/ComboDataFromPaper.mat
        ss = 'combo TKO fig6 from paper';
    end

    if DATA ~= 6 && DATA ~= 1001 && DATA ~= 1002 && DATA ~=999
        Azim_phase = Azim_phase*50/180;
        Elev_phase = Elev_phase*50/180;
    end
    
    params.azim_amp = Azim_amp;
    params.elev_amp = Elev_amp;
    params.azim_phase = Azim_phase;
    params.elev_phase = Elev_phase;
    params.datalabel = ss;
    params.colormap = MapAnsColor;