-module(experiments_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  % io:format("bp0~n"),
  % cpg:create(experiment, "test0"),
  % io:format("bp1~n"),
  % cpg:create(experiment, "test1"),
  io:format("bp2~n"),
	Procs = [
    {truog1, {truog_server,start_link,[zippo1]}, permanent, brutal_kill, worker, [truog_server]},
    {truog2, {truog_server,start_link,[zippo2]}, permanent, brutal_kill, worker, [truog_server]},
    {truog3, {truog_server1,start_link,["zippo", 1]}, permanent, brutal_kill, worker, [truog_server1]},
    {truog4, {truog_server1,start_link,["zippo", 2]}, permanent, brutal_kill, worker, [truog_server1]}
  ],
	{ok, {{one_for_one, 1, 5}, Procs}}.
