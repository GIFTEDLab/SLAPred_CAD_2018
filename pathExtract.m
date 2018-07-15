function [] = pathExtract(stlfile)

% Get filename without extension
[pathstr, stlname, ext] = fileparts(stlfile);

% Read stl file
[Face,Vertex] = stlread(stlfile);
Vertex=10*[Vertex(:,1),Vertex(:,3)];
[row_face, ~]=size(Face);

% % Find the centroid of the 2D shape
% Xc=(min(Vertex(:,1))+max(Vertex(:,1)))/2;
% Yc=(min(Vertex(:,2))+max(Vertex(:,2)))/2;
% 
% % Move the center of the coordinate system to the origin
% Vertex(:,1)=Vertex(:,1)-Xc;
% Vertex(:,2)=Vertex(:,2)-Yc;
% % Xc=(min(Vertex(:,1))+max(Vertex(:,1)))/2;
% % Yc=(min(Vertex(:,2))+max(Vertex(:,2)))/2;

% Bounding box
X_max=20;
X_min=-20;
Y_max=20;
Y_min=-20;

% 2D grid
N=100; % grid dimension
X_step=(X_max-X_min)/(N-1);
Y_step=(Y_min-Y_max)/(N-1);
[X,Y]=meshgrid(X_min:X_step:X_max, Y_max:Y_step:Y_min);

% Check if grid points are inside
% grid_point=zeros(N, N);

% Name the text file of path
txtname = [stlname '_path_100.txt'];

pathname = fileparts('C:\Users\Jun\Dropbox\SLA_database\abaqus_PATH\abaqus_PATH7_c\');

txtfile = fullfile(pathname, txtname);

fileID = fopen(txtfile, 'w');

for i=1:N
    for j=1:N
        for k=1:row_face
            b=isPointInTriangle([X(i,j),Y(i,j)],[Vertex(Face(k,1),:);Vertex(Face(k,2),:);Vertex(Face(k,3),:)]);
            if b==1
%             grid_point(i,j)=1;
%           fprintf(['X(',num2str(i),',',num2str(j),')=',num2str(X(i,j)),'\n']);
%           X(i,j)
%           fprintf(['Y(',num2str(i),',',num2str(j),')=',num2str(Y(i,j)),'\n']);
%           Y(i,j)
%             A = [X(i,j), Y(i,j), 2.0];
%             fprintf(fileID, '%20.15f %20.15f %d\r\n', A);
            fprintf(fileID, [num2str(X(i,j)),',','2.0',',',num2str(Y(i,j)),'\r\n']);
%           fprintf([num2str(i),',',num2str(j),'\n']);
            break;
            end
        end
    end
end

fclose(fileID);
