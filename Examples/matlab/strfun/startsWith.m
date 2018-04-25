%STARTSWITH True if text starts with pattern.
%   TF = startsWith(STR,PATTERN) returns 1 (true) if STR starts with PATTERN,
%   and returns 0 (false) otherwise.
%
%   STR can be a string array, a character vector, or a cell array of
%   character vectors. So can PATTERN. PATTERN and STR need not be the same
%   size. If PATTERN is a string array or cell array, then startsWith returns
%   true if STR starts with any element of PATTERN. If STR is a string array
%   or cell array, then TF is a logical array that is the same size.
%
%   TF = startsWith(STR,PATTERN,'IgnoreCase',IGNORE) ignores case when searching 
%   for PATTERN at the start of STR if IGNORE is true. The default value of IGNORE 
%   is false.
%
%   Examples
%       STR = "data.tar.gz";
%       P = "data";
%       startsWith(STR,P)                     returns  1
%
%       STR = ["abstracts.docx","data.tar.gz"];
%       P = 'data';         
%       startsWith(STR,P)                     returns  [0 1]
%
%       STR = "data.tar.gz";
%       P = {'ab','data'};
%       startsWith(STR,P)                     returns  1
%
%       STR = {'DATA.TAR.GZ','SUMMARY.PPT'};
%       P = "data";
%       startsWith(STR,P,'IgnoreCase',true)   returns  [1 0]
%
%   See also endsWith, contains.

%   Copyright 2015-2017 The MathWorks, Inc.