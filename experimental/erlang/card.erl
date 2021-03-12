% Special thanks to Paul Heckbert
%
% http://tproger.ru/translations/business-card-raytracer
%
% Erlang port
% 
% 07-May-2018 - (mayton) In beginning...
% 07-Sep-2019 - continue
% 12-Mar-2021 - Add recursive route


-module(card).

%-include_lib("stdlib/src/math.erl").
%-include_lib("eunit/include/eunit.hrl").
%-include_lib("stdlib/src/random.hrl").

-export([main/0]).
-export([newvec/3]).
-export([sprod/2]).
-export([sum/2]).
-export([pixelRoute/2]).

-define(WIDTH, 5).
-define(HEIGHT, 7).

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

%subPixelRoute(X, Y, R) ->
%  T = #vector {X = a * (random:uniform() - 0.5) * 99 + b * (Random() - .5) * 99}
  

pixelRoute(X, Y) when X < ?WIDTH , Y < ?HEIGHT -> 
  %Vector g = !Vector(-6, -16, 0);
  %Vector a = !(Vector(0, 0, 1) ^ g) * .002;
  %Vector b = !(g ^ a) * .002;
  %Vector c = (a + b) * -256 + g;

  G = norm(newvec(-6.0,-16.0,0.0)),
  A = prod(norm(newvec(0.0,0.0,1.0)),0.002),
  B = norm(prod(vprod(G,A),0.002)),
  C = sum((prod(sum(A,B),-256.0)),G),

  F = random:uniform(),
  io:fwrite("(~p,~p,~p);~n",[X,Y,F]),
  pixelRoute(X + 1, Y);

pixelRoute(X, Y) when X == ?WIDTH , Y < ?HEIGHT -> 
  pixelRoute(0, Y + 1);

pixelRoute(X, Y) -> ok.


main() -> 
   io:fwrite("P6 ~p ~p 255 ",[?WIDTH,?HEIGHT]),
   pixelRoute(0,0).
