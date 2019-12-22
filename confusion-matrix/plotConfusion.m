mat=[78.8	3.60	5.80	3.40	0.40	0.40	0.60	0.40	5.60	5.80	3.20
    8.20	75.2	0.00	0.00	0.00	0.20	0.00	0.00	11.6	10.6    2.20
    8.40	0.00	68.8	14.0	0.80	0.00	1.00	0.40	5.20	4.00	5.40
    0.40	1.60	7.40	70.8	5.40	2.40	2.40	2.20	3.40	3.00	9.00
    0.40	0.00	0.40	3.40	83.0	14.0	3.60	2.40	0.40	0.40	0.00
    0.00	0.60	0.00	4.60	14.4	81.6	5.60	0.80	0.20	0.00	0.20	
    0.60	0.40	1.80	2.80	7.60	2.00	70.6	20.6	1.00	0.40	0.20
    0.00	0.00	0.00	2.20	4.40	1.60	16.0	83.6	0.00    0.20	0.00
    5.40	17.6	5.00	4.80	0.20	0.20    0.00	0.00	57.6	14.4	2.80
    3.00	9.60	5.80	1.80	0.80	0.00	0.00	0.20	15.6	68.8	2.40	
    3.40	0.40	5.20	7.00	0.60	0.20	0.80	0.00	1.60	2.20	86.6];


%mat = rand(5);           %# A 5-by-5 matrix of random values from 0 to 1
mat(11,10) = 0;            %# To illustrate
mat(11,2) = 0;            %# To illustrate
imagesc(mat);            %# Create a colored plot of the matrix values
colormap(flipud(gray));  %# Change the colormap to gray (so higher values are
                         %#   black and lower values are white)

textStrings = num2str(mat(:),'%0.2f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding

idx = find(strcmp(textStrings(:), '0.00'));
textStrings(idx) = {'   '};

[x,y] = meshgrid(1:11);   %# Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...      %# Plot the strings
                'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));  %# Get the middle value of the color range
textColors = repmat(mat(:) > midValue,1,3);  %# Choose white or black for the
                                             %#   text color of the strings so
                                             %#   they can be easily seen over
                                             %#   the background color
set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors

set(gca,'XTick',1:11,...                         %# Change the axes tick marks
        'XTickLabel',{'C0','C1','C2','C3','C4','C5','C6','C7','C8','C9','C10'},...  %#   and tick labels
        'YTick',1:11,...
        'YTickLabel',{'C0','C1','C2','C3','C4','C5','C6','C7','C8','C9','C10'},...
        'TickLength',[0 0]);
