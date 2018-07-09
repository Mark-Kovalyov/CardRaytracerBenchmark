% Special thanks to Paul Heckbert
%
% http://tproger.ru/translations/business-card-raytracer
%
% Erlang port
% 
% 07-May-2018 - (mayton) In beginning...


-module(card).

-export([main/0]).
-export([newvec/3]).
-export([sprod/2]).
-export([sum/2]).
-export([printvec/1]).
-export([while/1,while/2]). 

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


%while(L) -> while(L,0). 
%while([], Acc) -> Acc;

%while([_|T], Acc) ->
%   io:fwrite("~w~n",[Acc]), 
%   while(T,Acc+1). 
   
%   start() -> 
%   X = [1,2,3,4], 
%   while(X).

%for(0,_) -> 
%   [];    
%   for(N,Term) when N > 0 -> 
%     io:fwrite("1"), 
%     [Term|for(N-1,Term)]. 

process() -> 1.
   %for(?WIDTH,0),
   %for(?HEIGHT,0).

main() -> 
   io:fwrite("P6 ~p ~p 255 ",[?WIDTH,?HEIGHT]),
   process().
   

