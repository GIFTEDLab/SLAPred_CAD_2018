function stress_vector = stressExtract(indexfile)
%% Resolution of grid

N = 100;

%% Read INDEX files
% Get filename without extension
[pathstr, indexname, ext] = fileparts(indexfile);

partname = indexname(1:end-10);

INDEX = load(indexfile);

len_INDEX = length(INDEX);

%% Read RPT files from Abaqus

numfiles = 11;

for i = 1 : numfiles   
    rptname = sprintf([partname '_stress%d.rpt'], i);   
    [TENSOR, IDs, nodalListing, elementListing] = getRPT(rptname);
    if length(elementListing) > len_INDEX
        u = unique(elementListing);
        h = histc(elementListing, u);
        iden_e = u(h > 1);
        for j = 1 : length(iden_e)
            index = find(elementListing == iden_e(j));
            nodalListing(index(2 : end)) = 0;
        end
        nodalListing = nodalListing(nodalListing ~= 0);   
        stress{i} = nodalListing;
    elseif length(elementListing) <= len_INDEX
        stress{i} = nodalListing;
    end
end

% stressname = [num2str(n) 'fold0' num2str(10000 * r / 100) 'type' num2str(d) 'stress_path.mat'];
% 
% pathname = fileparts('F:\desktop\Dropbox\SLA Research for Journal\Stress files\Stress files_modified_path\');
% 
% matfile = fullfile(pathname, stressname);
% 
% save(matfile, 'stress');

%% Match stresses to corresponding index
grid_stress=zeros(N, N);
for i = 1 : numfiles
    for j = 1 : length(stress{i})
        grid_stress(INDEX(j,1), INDEX(j,2))=stress{i}(j, 1);
    end
%     stress_vector(:, i) = reshape(grid_stress',N^2,1);
    stress_vector(:, :, i) = grid_stress;
end


stressname = [partname '_stress_100.mat'];

pathname = fileparts('C:\Users\Jun\Dropbox\SLA_database\abaqus_STRESS\abaqus_STRESS_slice6_matrix\');

matfile = fullfile(pathname, stressname);

save(matfile, 'stress_vector');