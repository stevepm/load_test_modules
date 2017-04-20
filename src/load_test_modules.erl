-module(load_test_modules).

-export([init/1]).

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    {ok, State1} = load_test_modules_prv:init(State),
    {ok, State1}.
