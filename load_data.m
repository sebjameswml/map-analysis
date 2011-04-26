function params = load_data(params)

    DATA = params.id;

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
        ss = 'ephrin hetero TKO 162 ';
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
    
    if DATA ~= 6 && DATA ~= 1001 && DATA ~= 1002
        Azim_phase = Azim_phase*50/180;
        Elev_phase = Elev_phase*50/180;
    end
    
    params.azim_amp = Azim_amp;
    params.elev_amp = Elev_amp;
    params.azim_phase = Azim_phase;
    params.elev_phase = Elev_phase;
    params.datalabel = ss;
    params.colormap = MapAnsColor;
