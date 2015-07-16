-module(csrf_example_home_controller, [Req]).
-compile(export_all).

config(boss_csrf_filter, DefaultValue, RequestContext) ->
    proplists:delete(do_not_enforce_csrf_checks, DefaultValue);
config(_, DefaultValue, _) ->
    DefaultValue.

index('GET', []) ->
    { ok, [] }.

add('POST', []) ->
    Name = Req:post_param("name"),
    { output, io_lib:format("Inputed name : ~p~n", [Name]) }.
