%% @author Dmitrii Dimandt <dmitrii@dmitriid.com>
%% @copyright 2010 Marc Worrell
%% @doc 'slice' filter, get a range of elements from a list

%% Copyright 2010 Marc Worrell
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

%
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

-module(filter_slice).
-export([slice/3]).


slice(undefined, _, _Context) ->
    undefined;
slice(List, [M, N], _Context) when is_list(List) ->
    slice1(List, z_convert:to_integer(M), z_convert:to_integer(N));
slice(List, [N], _Context) when is_list(List) ->
    slice1(List, 1, z_convert:to_integer(N));
slice(List, N, _Context) when is_list(List) ->
    slice1(List, 1, z_convert:to_integer(N)).

slice1(List, M, N) when is_integer(M) andalso is_integer(N) ->
    M1 = if
            M < 0 -> length(List) + M;
            true -> M
    end,
    N1 = if
            N < 0 -> length(List) + N;
            true -> N
    end,
    slice2(List, M1, N1).

slice2(List, M, N) when N < M ->
    lists:sublist(List, M, length(List)) ++ lists:sublist(List, 1, N);

slice2(List, M, N) ->
    lists:sublist(List, M, N - M + 1).
