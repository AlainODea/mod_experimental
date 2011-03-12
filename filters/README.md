Filter documentation
===========================

For now, put a short description of what your filter can do here


slice
----------------------

Get a sublist from a list:

	% 
	% Given a list = [1,2,3,4,5,6,7,8,9,0]
	%
	% {{ list|slice:[3,7] }} -> [3,4,5,6,7]
	% {{ list|slice:[3,-3] }} -> [3,4,5,6,7]
	% {{ list|slice:[-7,-3] }} -> [3,4,5,6,7]
	% {{ list|slice:[-7,7] }} -> [3,4,5,6,7]
	%
	% {{ list|slice:[7] }} -> [1,2,3,4,5,6,7]
	% {{ list|slice:[-3] }} -> [1,2,3,4,5,6,7]
	%
	% {{ list|slice:[7,3] }} -> [7,8,9,0,1,2,3]
	% {{ list|slice:[7,-7] }} -> [7,8,9,0,1,2,3]
	% {{ list|slice:[-3,-7] }} -> [7,8,9,0,1,2,3]
	% {{ list|slice:[-3,3] }} -> [7,8,9,0,1,2,3]
	%

TODO: Discuss whether the last four use cases are really useful. If not, remove them. Also see https://github.com/arjan/zotonic/pull/7