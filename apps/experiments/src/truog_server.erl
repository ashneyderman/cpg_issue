-module (truog_server).
-author('mjtruog [at] gmail (dot) com').

-behaviour(gen_server).

%% external interface
-export([start_link/2,
         start_link/1,
         put/2,
         get/1,
         pid/1]).

%% gen_server callbacks
-export([init/1,
         handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-record(state,
    {
        value
    }).

%%%------------------------------------------------------------------------
%%% External interface functions
%%%------------------------------------------------------------------------

%%-------------------------------------------------------------------------
%% @doc
%% ===Start the test server with a cpg via_name().===
%% @end
%%-------------------------------------------------------------------------

%-spec start_link(cpg:via_name()) -> {'ok', pid()} | {'error', any()}.

start_link(Name) ->
    gen_server:start_link({local, Name}, ?MODULE, [], []).

start_link(ViaName, Count) ->
    gen_server:start_link({via, cpg, {local, test_scope, ViaName, Count}}, ?MODULE, [], []).

put(ViaName, Value) ->
    gen_server:call(ViaName, {put, Value}).

get(ViaName) ->
    gen_server:call(ViaName, get).

pid(ViaName) ->
    gen_server:call(ViaName, pid).

%%%------------------------------------------------------------------------
%%% Callback functions from gen_server
%%%------------------------------------------------------------------------

init([]) ->
    {ok, #state{}}.

handle_call({put, Value}, _, State) ->
    {reply, ok, State#state{value = Value}};

handle_call(get, _, #state{value = Value} = State) ->
    {reply, Value, State};

handle_call(pid, _, State) ->
    {reply, self(), State};

handle_call(_, _, State) ->
    {stop, unknown_call, error, State}.

handle_cast(_, State) ->
    {stop, unknown_cast, State}.

handle_info(_, State) ->
    {stop, unknown_info, State}.

terminate(_, _) ->
    ok.

code_change(_, State, _) ->
    {ok, State}.
