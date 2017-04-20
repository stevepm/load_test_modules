-module(load_test_modules_prv).

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, load_test_modules).
-define(DEPS, [app_discovery]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 load_test_modules"}, % How to use the plugin
            {opts, []},                   % list of options understood by the plugin
            {short_desc, "Load all test modules when running tests"},
            {desc, "Load all test modules when running tests"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    lists:foreach(fun load_test_modules/1, rebar_state:project_apps(State)),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).

%% @private
load_test_modules(App) ->
    io:format("~p", [rebar_app_info:dir(App)]).