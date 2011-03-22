Filter documentation
===========================

For now, put a short description of what your filter can do here


bbcode
----------------------

% 
% {{ text|bbcode }}
%
% This is a very simple filter. It only implements tags described here:
% http://en.wikipedia.org/wiki/BBCode
%
% There's only one small addition:
%
% [table][thead][th]header[/th][/thead][tr][td]cell[/td][/tr][/table]
%
% will generate a table with <th>'s
%

See filter source for more info and BBCode PEG grammar

NOTE: The filter doesn't (yet?) sanitize output!