% Special thanks to Paul Heckbert
%
% http://tproger.ru/translations/business-card-raytracer
%
% Erlang port
% 
% 07-May-2018 - (mayton) In beginning...
% 07-Sep-2019 - continue
% 12-Mar-2021 - Add recursive route
% 13-Mar-2021 - Add sampler, tracer


-module(card).

%-include_lib("stdlib/src/math.erl").
%-include_lib("eunit/include/eunit.hrl").
%-include_lib("stdlib/src/random.hrl").

-export([main/0]).

-define(WIDTH, 5).
-define(HEIGHT, 7).

-record(vector, {x :: double,
                 y :: double,
                 z :: double}).

g_data() ->
  [
            2#00111100011100010010,
            2#01000100100000010100,
            2#01000100100000011000,
            2#00111100111110010100,
            2#00000100100010010010,
            2#00000100100010010001,
            2#00111000011100010000,
            2#00000000000000010000,
            2#00000000000000010000
].


newvec(X,Y,Z) -> #vector{x=X,y=Y,z=Z}.

sum(A, B) -> newvec(A#vector.x + B#vector.x, A#vector.y + B#vector.y, A#vector.z + B#vector.z).

prod(A, K) -> newvec(A#vector.x * K, A#vector.y * K, A#vector.z * K).

sprod(A, B) -> A#vector.x * B#vector.x + A#vector.y * B#vector.y + A#vector.z * B#vector.z.

vprod(A, R) -> newvec(A#vector.y * R#vector.z - A#vector.z * R#vector.y,
                      A#vector.z * R#vector.x - A#vector.x * R#vector.z,
                      A#vector.x * R#vector.y - A#vector.y * R#vector.x).

norm(A) -> prod(A, 1.0 / math:sqrt(sprod(A,A))).

% TODO: Should be completed

tracer() -> 1.

%subPixelRoute(X, Y, R) ->
%  T = #vector {X = a * (random:uniform() - 0.5) * 99 + b * (Random() - .5) * 99}
  


sampler(Ovect, Dvect) -> 
  Mint = tracer(),
  ok.


rayJitter(Avec, Bvec, Rcount) when Rcount > 0 ->
  RandomVal = random:uniform(),
  % Vector t = 
  %       a * (random() - 0.5) * 99.0 + 
  %       b * (random() - 0.5) * 99.0
  Tvec = sum(99.0 * prod(Avec, random:uniform() - 0.5),
             99.0 * prod(Bvec, random:uniform() - 0.5)),
  % p = sampler(Vector(17, 16, 8) + t, 
  %             !(t * -1 + (a * (Random() + x) + b * (y + Random()) + c) * 16)) * 3.5 + p;
  Ovec = sum(newvec(17.0,16.0,8.0),Tvec)
  Dvec = newvec(0.0,0.0,0.0),
  Pvec = sampler(Ovec, Dvec),
  rayJitter(Avec, Bvec, Rcount - 1).


pixelRoute(X, Y) when X < ?WIDTH , Y < ?HEIGHT -> 
  Gvec = norm(newvec(-6.0,-16.0,0.0)),
  Avec = prod(norm(newvec(0.0,0.0,1.0)),0.002),
  Bvec = norm(prod(vprod(Gvec,Avec),0.002)),
  Cvec = sum((prod(sum(Avec,Bvec),-256.0)),Gvec),
  %io:fwrite("(~p,~p,~p);~n",[X,Y,F]),
  rayJitter(Avec,Bvec, 64),
  pixelRoute(X + 1, Y);

pixelRoute(X, Y) when X == ?WIDTH , Y < ?HEIGHT -> 
  pixelRoute(0, Y + 1);

pixelRoute(X, Y) -> ok.

main() -> 
   io:fwrite("P6 ~p ~p 255 ",[?WIDTH,?HEIGHT]),
   pixelRoute(0,0).
