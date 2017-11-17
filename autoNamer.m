% This script uses a list of names (such as experiment.m generates) to
% automatically rename a group of files.

listFileName = 'filenames.txt';

listFile = fopen(listFileName,'r');

fgetl(listFile); % reads a line from the file, returns character array