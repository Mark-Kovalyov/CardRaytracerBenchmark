% Special thanks to Paul Heckbert
%
% http://tproger.ru/translations/business-card-raytracer
%
% Erlang port
% 
% 07-May-2018 - (mayton) In beginning...
% 07-Sep-2019 - continue

-module(card).

-export([main/0]).
-export([newvec/3]).
-export([sprod/2]).
-export([sum/2]).

-define(WIDTH, 512).
-define(HEIGHT, 512).

-record(vector, {x :: double,
                 y :: double,
                 z :: double}).

newvec(X,Y,Z) -> #vector{x=X,y=Y,z=Z}.

sum(A, B) -> newvec(A#vector.x + B#vector.x, A#vector.y + B#vector.y, A#vector.z + B#vector.z).

prod(A, K) -> newvec(A#vector.x * K, A#vector.y * K, A#vector.z * K).

sprod(A, B) -> A#vector.x * B#vector.x + A#vector.y * B#vector.y + A#vector.z * B#vector.z.

vprod(A, R) -> newvec(A#vector.y * R#vector.z - A#vector.z * R#vector.y,
                      A#vector.z * R#vector.x - A#vector.x * R#vector.z,
                      A#vector.x * R#vector.y - A#vector.y * R#vector.x).

norm(A) -> prod(A, 1.0 / math:sqrt(sprod(A,A))).

% TODO: Should be completed

sampler() -> 1.

tracer() -> 1.

pixelRoute(x, y) ->
	% TODO: Add pixel processing...
	if 
		x < ?WIDTH ->
			pixelRoute(x + 1, y);
		true ->
			pixelRoute(0, y + 1)
	end.



main() -> 
   io:fwrite("P6 ~p ~p 255 ",[?WIDTH,?HEIGHT]),
   pixelRoute(0,0).

   
%card.erl:28: Warning: function prod/2 is unused
%card.erl:32: Warning: function vprod/2 is unused
%card.erl:36: Warning: function norm/1 is unused
%card.erl:40: Warning: function sampler/0 is unused
%card.erl:42: Warning: function tracer/0 is unused
%card.erl:47: Warning: the guard for this clause evaluates to 'false'
%card.erl:48: Warning: this expression will fail with a 'badarith' exception
%card.erl:50: Warning: this expression will fail with a 'badarith' exception
%P6 512 512 255 {"init terminating in do_boot",{function_clause,[{card,pixelRoute,[0,0],[{file,"card.erl"},{line,44}]},{init,start_em,1,[]},{init,do_boot,3,[]}]}}
%init terminating in do_boot ({function_clause,[{card,pixelRoute,[0,0],[{_},{_}]},{init,start_em,1,[]},{init,do_boot,3,[]}]})

%Crash dump is being written to: erl_crash.dump...done
