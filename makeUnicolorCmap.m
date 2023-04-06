function CMAP = makeUnicolorCmap(color)
%% 2021/01/19 Make single color colormap
% Input 'color' should be string 'red', 'blue', 'green', or 'purple'.
% Otherwise just gray scale.

switch color
    case 'blue'
        orimap = [255,255,255;...
            247,251,255;...
            222,235,247;...
            198,219,239;...
            158,202,225;...
            107,174,214;...
            66,146,198;...
            33,113,181;...
            8,81,156;...
            8,48,107];
    case 'red'
        orimap = [255,255,255;...
            255,245,240;...
            254,224,210;...
            252,187,161;...
            252,146,114;...
            251,106,74;...
            239,59,44;...
            203,24,29;...
            165,15,21;...
            103,0,13];
    case 'green'
        orimap = [255,255,255;...
            247,252,245;...
            229,245,224;...
            199,233,192;...
            161,217,155;...
            116,196,118;...
            65,171,93;...
            35,139,69;...
            0,109,44;...
            0,68,27];
    case 'purple'
        orimap = [255,255,255;...
            252,251,253;...
            239,237,245;...
            218,218,235;...
            188,189,220;...
            158,154,200;...
            128,125,186;...
            106,81,163;...
            84,39,143;...
            63,0,125];
    case 'orange'
        orimap = [255,255,255;...
            255,245,235;...
            254,230,206;...
            253,208,162;...
            253,174,107;...
            253,141,60;...
            241,105,19;...
            217,72,1;...
            166,54,3;...
            127,39,4];
    case 'rgb_red'
        orimap = [255,255,255;...
            200,0,0];
    case 'rgb_green'
        orimap = [255,255,255;...
            0,200,0];
    case 'rgb_blue'
        orimap = [255,255,255;...
            0,0,255];
        case 'rgb_magenta'
        orimap = [255,255,255;...
            200,0,200];
    case 'gray'
        invcmap = gray;
        CMAP = invcmap(size(invcmap,1):-1:1,:);
        return
    otherwise 
        invcmap = gray;% No white
        invcmap = invcmap(1:235,:);
        CMAP = invcmap(size(invcmap,1):-1:1,:);
        return        
end

num_oricol = size(orimap,1);

M1 = zeros(255,3);
for n = 1:3
    M1(:,n) = interp1(linspace(1,255,num_oricol),orimap(:,n),1:255);
end
CMAP = M1./255;
