:- use_module(['uri-parse.pl']).
:- style_check(-singleton).

:- begin_tests(uri_parse).

% TRUE (1char)

% SCHEME:
test(s) :- uri_parse("s:", uri('s', [], [], 80, [], [], [])).
test(s1) :- uri_parse("s:/", uri('s', [], [], 80, [], [], [])).

% SCHEME:AUTHORITY
test(a) :- uri_parse("s://h", uri('s', [], 'h', 80, [], [], [])).
test(a1) :- uri_parse("s://h.h", uri('s', [], 'h.h', 80, [], [], [])).
test(a2) :- uri_parse("s://123.123.123.123", uri('s', [], '123.123.123.123', 80, [], [], [])).
test(a3) :- uri_parse("s://u@h", uri('s', 'u', 'h', 80, [], [], [])).
test(a4) :- uri_parse("s://u@h.h", uri('s', 'u', 'h.h', 80, [], [], [])).
test(a5) :- uri_parse("s://u@123.123.123.123", uri('s', 'u', '123.123.123.123', 80, [], [], [])).
test(a6) :- uri_parse("s://h:123", uri('s', [], 'h', 123, [], [], [])).
test(a7) :- uri_parse("s://h.h:123", uri('s', [], 'h.h', 123, [], [], [])).
test(a8) :- uri_parse("s://123.123.123.123:123", uri('s', [], '123.123.123.123', 123, [], [], [])).
test(a9) :- uri_parse("s://u@h:123", uri('s', 'u', 'h', 123, [], [], [])).
test(a10) :- uri_parse("s://u@h.h:123", uri('s', 'u', 'h.h', 123, [], [], [])).
test(a11) :- uri_parse("s://u@123.123.123.123:123", uri('s', 'u', '123.123.123.123', 123, [], [], [])).

% SCHEME:/PATH
test(p) :- uri_parse("s:/p", uri('s', [], [], 80, 'p', [], [])).
test(p1) :- uri_parse("s:/p/p", uri('s', [], [], 80, 'p/p', [], [])).
test(p2) :- uri_parse("s:/p/p/p", uri('s', [], [], 80, 'p/p/p', [], [])).

% SCHEME:/?QUERY
test(q) :- uri_parse("s:/?q", uri('s', [], [], 80, [], 'q', [])).

% SCHEME:/#FRAGMENT
test(f) :- uri_parse("s:/#f", uri('s', [], [], 80, [], [], 'f')).

% SCHEME:/?QUERY#FRAGMENT
test(qf) :- uri_parse("s:/?q#f", uri('s', [], [], 80, [], 'q', 'f')).

% SCHEME:/PATH?QUERY
test(pq) :- uri_parse("s:/p?q", uri('s', [], [], 80, 'p', 'q', [])).
test(pq1) :- uri_parse("s:/p/p?q", uri('s', [], [], 80, 'p/p', 'q', [])).
test(pq2) :- uri_parse("s:/p/p/p?q", uri('s', [], [], 80, 'p/p/p', 'q', [])).

% SCHEME:/PATH#FRAGMENT
test(pf) :- uri_parse("s:/p#f", uri('s', [], [], 80, 'p', [], 'f')).
test(pf1) :- uri_parse("s:/p/p#f", uri('s', [], [], 80, 'p/p', [], 'f')).
test(pf2) :- uri_parse("s:/p/p/p#f", uri('s', [], [], 80, 'p/p/p', [], 'f')).

% SCHEME:/PATH?QUERY#FRAGMENT
test(pqf) :- uri_parse("s:/p?q#f", uri('s', [], [], 80, 'p', 'q', 'f')).
test(pqf1) :- uri_parse("s:/p/p?q#f", uri('s', [], [], 80, 'p/p', 'q', 'f')).
test(pqf2) :- uri_parse("s:/p/p/p?q#f", uri('s', [], [], 80, 'p/p/p', 'q', 'f')).

% SCHEME:AUTHORITY/PATH
test(ap) :- uri_parse("s://h/p", uri('s', [], 'h', 80, 'p', [], [])).
test(ap1) :- uri_parse("s://h/p/p", uri('s', [], 'h', 80, 'p/p', [], [])).
test(ap2) :- uri_parse("s://h/p/p/p", uri('s', [], 'h', 80, 'p/p/p', [], [])).
test(ap3) :- uri_parse("s://h.h/p", uri('s', [], 'h.h', 80, 'p', [], [])).
test(ap4) :- uri_parse("s://h.h/p/p", uri('s', [], 'h.h', 80, 'p/p', [], [])).
test(ap5) :- uri_parse("s://h.h/p/p/p", uri('s', [], 'h.h', 80, 'p/p/p', [], [])).
test(ap6) :- uri_parse("s://123.123.123.123/p", uri('s', [], '123.123.123.123', 80, 'p', [], [])).
test(ap7) :- uri_parse("s://123.123.123.123/p/p", uri('s', [], '123.123.123.123', 80, 'p/p', [], [])).
test(ap8) :- uri_parse("s://123.123.123.123/p/p/p", uri('s', [], '123.123.123.123', 80, 'p/p/p', [], [])).
test(ap9) :- uri_parse("s://u@h/p", uri('s', 'u', 'h', 80, 'p', [], [])).
test(ap10) :- uri_parse("s://u@h/p/p", uri('s', 'u', 'h', 80, 'p/p', [], [])).
test(ap11) :- uri_parse("s://u@h/p/p/p", uri('s', 'u', 'h', 80, 'p/p/p', [], [])).
test(ap12) :- uri_parse("s://u@h.h/p", uri('s', 'u', 'h.h', 80, 'p', [], [])).
test(ap13) :- uri_parse("s://u@h.h/p/p", uri('s', 'u', 'h.h', 80, 'p/p', [], [])).
test(ap14) :- uri_parse("s://u@h.h/p/p/p", uri('s', 'u', 'h.h', 80, 'p/p/p', [], [])).
test(ap15) :- uri_parse("s://u@123.123.123.123/p", uri('s', 'u', '123.123.123.123', 80, 'p', [], [])).
test(ap16) :- uri_parse("s://u@123.123.123.123/p/p", uri('s', 'u', '123.123.123.123', 80, 'p/p', [], [])).
test(ap17) :- uri_parse("s://u@123.123.123.123/p/p/p", uri('s', 'u', '123.123.123.123', 80, 'p/p/p', [], [])).
test(ap18) :- uri_parse("s://h:123/p", uri('s', [], 'h', 123, 'p', [], [])).
test(ap19) :- uri_parse("s://h:123/p/p", uri('s', [], 'h', 123, 'p/p', [], [])).
test(ap20) :- uri_parse("s://h:123/p/p/p", uri('s', [], 'h', 123, 'p/p/p', [], [])).
test(ap21) :- uri_parse("s://h.h:123/p", uri('s', [], 'h.h', 123, 'p', [], [])).
test(ap22) :- uri_parse("s://h.h:123/p/p", uri('s', [], 'h.h', 123, 'p/p', [], [])).
test(ap23) :- uri_parse("s://h.h:123/p/p/p", uri('s', [], 'h.h', 123, 'p/p/p', [], [])).
test(ap24) :- uri_parse("s://123.123.123.123:123/p", uri('s', [], '123.123.123.123', 123, 'p', [], [])).
test(ap25) :- uri_parse("s://123.123.123.123:123/p/p", uri('s', [], '123.123.123.123', 123, 'p/p', [], [])).
test(ap26) :- uri_parse("s://123.123.123.123:123/p/p/p", uri('s', [], '123.123.123.123', 123, 'p/p/p', [], [])).
test(ap27) :- uri_parse("s://u@h:123/p", uri('s', 'u', 'h', 123, 'p', [], [])).
test(ap28) :- uri_parse("s://u@h:123/p/p", uri('s', 'u', 'h', 123, 'p/p', [], [])).
test(ap29) :- uri_parse("s://u@h:123/p/p/p", uri('s', 'u', 'h', 123, 'p/p/p', [], [])).
test(ap30) :- uri_parse("s://u@h.h:123/p", uri('s', 'u', 'h.h', 123, 'p', [], [])).
test(ap31) :- uri_parse("s://u@h.h:123/p/p", uri('s', 'u', 'h.h', 123, 'p/p', [], [])).
test(ap32) :- uri_parse("s://u@h.h:123/p/p/p", uri('s', 'u', 'h.h', 123, 'p/p/p', [], [])).
test(ap33) :- uri_parse("s://u@123.123.123.123:123/p", uri('s', 'u', '123.123.123.123', 123, 'p', [], [])).
test(ap34) :- uri_parse("s://u@123.123.123.123:123/p/p", uri('s', 'u', '123.123.123.123', 123, 'p/p', [], [])).
test(ap35) :- uri_parse("s://u@123.123.123.123:123/p/p/p", uri('s', 'u', '123.123.123.123', 123, 'p/p/p', [], [])).

% SCHEME:AUTHORITY/?QUERY
test(aq) :- uri_parse("s://h/?q", uri('s', [], 'h', 80, [], 'q', [])).
test(aq1) :- uri_parse("s://h.h/?q", uri('s', [], 'h.h', 80, [], 'q', [])).
test(aq2) :- uri_parse("s://123.123.123.123/?q", uri('s', [], '123.123.123.123', 80, [], 'q', [])).
test(aq3) :- uri_parse("s://u@h/?q", uri('s', 'u', 'h', 80, [], 'q', [])).
test(aq4) :- uri_parse("s://u@h.h/?q", uri('s', 'u', 'h.h', 80, [], 'q', [])).
test(aq5) :- uri_parse("s://u@123.123.123.123/?q", uri('s', 'u', '123.123.123.123', 80, [], 'q', [])).
test(aq6) :- uri_parse("s://h:123/?q", uri('s', [], 'h', 123, [], 'q', [])).
test(aq7) :- uri_parse("s://h.h:123/?q", uri('s', [], 'h.h', 123, [], 'q', [])).
test(aq8) :- uri_parse("s://123.123.123.123:123/?q", uri('s', [], '123.123.123.123', 123, [], 'q', [])).
test(aq9) :- uri_parse("s://u@h:123/?q", uri('s', 'u', 'h', 123, [], 'q', [])).
test(aq10) :- uri_parse("s://u@h.h:123/?q", uri('s', 'u', 'h.h', 123, [], 'q', [])).
test(aq11) :- uri_parse("s://u@123.123.123.123:123/?q", uri('s', 'u', '123.123.123.123', 123, [], 'q', [])).


% SCHEME:AUTHORITY/#FRAGMENT
test(af1) :- uri_parse("s://h/#f", uri('s', [], 'h', 80, [], [], 'f')).
test(af2) :- uri_parse("s://h.h/#f", uri('s', [], 'h.h', 80, [], [], 'f')).
test(af3) :- uri_parse("s://123.123.123.123/#f", uri('s', [], '123.123.123.123', 80, [], [], 'f')).
test(af4) :- uri_parse("s://u@h/#f", uri('s', 'u', 'h', 80, [], [], 'f')).
test(af5) :- uri_parse("s://u@h.h/#f", uri('s', 'u', 'h.h', 80, [], [], 'f')).
test(af6) :- uri_parse("s://u@123.123.123.123/#f", uri('s', 'u', '123.123.123.123', 80, [], [], 'f')).
test(af7) :- uri_parse("s://h:123/#f", uri('s', [], 'h', 123, [], [], 'f')).
test(af8) :- uri_parse("s://h.h:123/#f", uri('s', [], 'h.h', 123, [], [], 'f')).
test(af9) :- uri_parse("s://123.123.123.123:123/#f", uri('s', [], '123.123.123.123', 123, [], [], 'f')).
test(af10) :- uri_parse("s://u@h:123/#f", uri('s', 'u', 'h', 123, [], [], 'f')).
test(af11) :- uri_parse("s://u@h.h:123/#f", uri('s', 'u', 'h.h', 123, [], [], 'f')).
test(af12) :- uri_parse("s://u@123.123.123.123:123/#f", uri('s', 'u', '123.123.123.123', 123, [], [], 'f')).


% SCHEME:AUTHORITY/?QUERY#FRAGMENT
test(aqf1) :- uri_parse("s://h/?q#f", uri('s', [], 'h', 80, [], 'q', 'f')).
test(aqf2) :- uri_parse("s://h.h/?q#f", uri('s', [], 'h.h', 80, [], 'q', 'f')).
test(aqf3) :- uri_parse("s://123.123.123.123/?q#f", uri('s', [], '123.123.123.123', 80, [], 'q', 'f')).
test(aqf4) :- uri_parse("s://u@h/?q#f", uri('s', 'u', 'h', 80, [], 'q', 'f')).
test(aqf5) :- uri_parse("s://u@h.h/?q#f", uri('s', 'u', 'h.h', 80, [], 'q', 'f')).
test(aqf6) :- uri_parse("s://u@123.123.123.123/?q#f", uri('s', 'u', '123.123.123.123', 80, [], 'q', 'f')).
test(aqf7) :- uri_parse("s://h:123/?q#f", uri('s', [], 'h', 123, [], 'q', 'f')).
test(aqf8) :- uri_parse("s://h.h:123/?q#f", uri('s', [], 'h.h', 123, [], 'q', 'f')).
test(aqf9) :- uri_parse("s://123.123.123.123:123/?q#f", uri('s', [], '123.123.123.123', 123, [], 'q', 'f')).
test(aqf10) :- uri_parse("s://u@h:123/?q#f", uri('s', 'u', 'h', 123, [], 'q', 'f')).
test(aqf11) :- uri_parse("s://u@h.h:123/?q#f", uri('s', 'u', 'h.h', 123, [], 'q', 'f')).
test(aqf12) :- uri_parse("s://u@123.123.123.123:123/?q#f", uri('s', 'u', '123.123.123.123', 123, [], 'q', 'f')).


% SCHEME:AUTHORITY/PATH?QUERY
test(apq1) :- uri_parse("s://h/p?q", uri('s', [], 'h', 80, 'p', 'q', [])).
test(apq2) :- uri_parse("s://h/p/p?q", uri('s', [], 'h', 80, 'p/p', 'q', [])).
test(apq3) :- uri_parse("s://h/p/p/p?q", uri('s', [], 'h', 80, 'p/p/p', 'q', [])).
test(apq4) :- uri_parse("s://h.h/p?q", uri('s', [], 'h.h', 80, 'p', 'q', [])).
test(apq5) :- uri_parse("s://h.h/p/p?q", uri('s', [], 'h.h', 80, 'p/p', 'q', [])).
test(apq6) :- uri_parse("s://h.h/p/p/p?q", uri('s', [], 'h.h', 80, 'p/p/p', 'q', [])).
test(apq7) :- uri_parse("s://123.123.123.123/p?q", uri('s', [], '123.123.123.123', 80, 'p', 'q', [])).
test(apq8) :- uri_parse("s://123.123.123.123/p/p?q", uri('s', [], '123.123.123.123', 80, 'p/p', 'q', [])).
test(apq9) :- uri_parse("s://123.123.123.123/p/p/p?q", uri('s', [], '123.123.123.123', 80, 'p/p/p', 'q', [])).
test(apq10) :- uri_parse("s://u@h/p?q", uri('s', 'u', 'h', 80, 'p', 'q', [])).
test(apq11) :- uri_parse("s://u@h/p/p?q", uri('s', 'u', 'h', 80, 'p/p', 'q', [])).
test(apq12) :- uri_parse("s://u@h/p/p/p?q", uri('s', 'u', 'h', 80, 'p/p/p', 'q', [])).
test(apq13) :- uri_parse("s://u@h.h/p?q", uri('s', 'u', 'h.h', 80, 'p', 'q', [])).
test(apq14) :- uri_parse("s://u@h.h/p/p?q", uri('s', 'u', 'h.h', 80, 'p/p', 'q', [])).
test(apq15) :- uri_parse("s://u@h.h/p/p/p?q", uri('s', 'u', 'h.h', 80, 'p/p/p', 'q', [])).
test(apq16) :- uri_parse("s://u@123.123.123.123/p?q", uri('s', 'u', '123.123.123.123', 80, 'p', 'q', [])).
test(apq17) :- uri_parse("s://u@123.123.123.123/p/p?q", uri('s', 'u', '123.123.123.123', 80, 'p/p', 'q', [])).
test(apq18) :- uri_parse("s://u@123.123.123.123/p/p/p?q", uri('s', 'u', '123.123.123.123', 80, 'p/p/p', 'q', [])).
test(apq19) :- uri_parse("s://h:123/p?q", uri('s', [], 'h', 123, 'p', 'q', [])).
test(apq20) :- uri_parse("s://h:123/p/p?q", uri('s', [], 'h', 123, 'p/p', 'q', [])).
test(apq21) :- uri_parse("s://h:123/p/p/p?q", uri('s', [], 'h', 123, 'p/p/p', 'q', [])).
test(apq22) :- uri_parse("s://h.h:123/p?q", uri('s', [], 'h.h', 123, 'p', 'q', [])).
test(apq23) :- uri_parse("s://h.h:123/p/p?q", uri('s', [], 'h.h', 123, 'p/p', 'q', [])).
test(apq24) :- uri_parse("s://h.h:123/p/p/p?q", uri('s', [], 'h.h', 123, 'p/p/p', 'q', [])).
test(apq25) :- uri_parse("s://123.123.123.123:123/p?q", uri('s', [], '123.123.123.123', 123, 'p', 'q', [])).
test(apq26) :- uri_parse("s://123.123.123.123:123/p/p?q", uri('s', [], '123.123.123.123', 123, 'p/p', 'q', [])).
test(apq27) :- uri_parse("s://123.123.123.123:123/p/p/p?q", uri('s', [], '123.123.123.123', 123, 'p/p/p', 'q', [])).
test(apq28) :- uri_parse("s://u@h:123/p?q", uri('s', 'u', 'h', 123, 'p', 'q', [])).
test(apq29) :- uri_parse("s://u@h:123/p/p?q", uri('s', 'u', 'h', 123, 'p/p', 'q', [])).
test(apq30) :- uri_parse("s://u@h:123/p/p/p?q", uri('s', 'u', 'h', 123, 'p/p/p', 'q', [])).
test(apq31) :- uri_parse("s://u@h.h:123/p?q", uri('s', 'u', 'h.h', 123, 'p', 'q', [])).
test(apq32) :- uri_parse("s://u@h.h:123/p/p?q", uri('s', 'u', 'h.h', 123, 'p/p', 'q', [])).
test(apq33) :- uri_parse("s://u@h.h:123/p/p/p?q", uri('s', 'u', 'h.h', 123, 'p/p/p', 'q', [])).
test(apq34) :- uri_parse("s://u@123.123.123.123:123/p?q", uri('s', 'u', '123.123.123.123', 123, 'p', 'q', [])).
test(apq35) :- uri_parse("s://u@123.123.123.123:123/p/p?q", uri('s', 'u', '123.123.123.123', 123, 'p/p', 'q', [])).
test(apq36) :- uri_parse("s://u@123.123.123.123:123/p/p/p?q", uri('s', 'u', '123.123.123.123', 123, 'p/p/p', 'q', [])).


% SCHEME:AUTHORITY/PATH#FRAGMENT
test(apf1) :- uri_parse("s://h/p#f", uri('s', [], 'h', 80, 'p', [], 'f')).
test(apf2) :- uri_parse("s://h/p/p#f", uri('s', [], 'h', 80, 'p/p', [], 'f')).
test(apf3) :- uri_parse("s://h/p/p/p#f", uri('s', [], 'h', 80, 'p/p/p', [], 'f')).
test(apf4) :- uri_parse("s://h.h/p#f", uri('s', [], 'h.h', 80, 'p', [], 'f')).
test(apf5) :- uri_parse("s://h.h/p/p#f", uri('s', [], 'h.h', 80, 'p/p', [], 'f')).
test(apf6) :- uri_parse("s://h.h/p/p/p#f", uri('s', [], 'h.h', 80, 'p/p/p', [], 'f')).
test(apf7) :- uri_parse("s://123.123.123.123/p#f", uri('s', [], '123.123.123.123', 80, 'p', [], 'f')).
test(apf8) :- uri_parse("s://123.123.123.123/p/p#f", uri('s', [], '123.123.123.123', 80, 'p/p', [], 'f')).
test(apf9) :- uri_parse("s://123.123.123.123/p/p/p#f", uri('s', [], '123.123.123.123', 80, 'p/p/p', [], 'f')).
test(apf10) :- uri_parse("s://u@h/p#f", uri('s', 'u', 'h', 80, 'p', [], 'f')).
test(apf11) :- uri_parse("s://u@h/p/p#f", uri('s', 'u', 'h', 80, 'p/p', [], 'f')).
test(apf12) :- uri_parse("s://u@h/p/p/p#f", uri('s', 'u', 'h', 80, 'p/p/p', [], 'f')).
test(apf13) :- uri_parse("s://u@h.h/p#f", uri('s', 'u', 'h.h', 80, 'p', [], 'f')).
test(apf14) :- uri_parse("s://u@h.h/p/p#f", uri('s', 'u', 'h.h', 80, 'p/p', [], 'f')).
test(apf15) :- uri_parse("s://u@h.h/p/p/p#f", uri('s', 'u', 'h.h', 80, 'p/p/p', [], 'f')).
test(apf16) :- uri_parse("s://u@123.123.123.123/p#f", uri('s', 'u', '123.123.123.123', 80, 'p', [], 'f')).
test(apf17) :- uri_parse("s://u@123.123.123.123/p/p#f", uri('s', 'u', '123.123.123.123', 80, 'p/p', [], 'f')).
test(apf18) :- uri_parse("s://u@123.123.123.123/p/p/p#f", uri('s', 'u', '123.123.123.123', 80, 'p/p/p', [], 'f')).
test(apf19) :- uri_parse("s://h:123/p#f", uri('s', [], 'h', 123, 'p', [], 'f')).
test(apf20) :- uri_parse("s://h:123/p/p#f", uri('s', [], 'h', 123, 'p/p', [], 'f')).
test(apf21) :- uri_parse("s://h:123/p/p/p#f", uri('s', [], 'h', 123, 'p/p/p', [], 'f')).
test(apf22) :- uri_parse("s://h.h:123/p#f", uri('s', [], 'h.h', 123, 'p', [], 'f')).
test(apf23) :- uri_parse("s://h.h:123/p/p#f", uri('s', [], 'h.h', 123, 'p/p', [], 'f')).
test(apf24) :- uri_parse("s://h.h:123/p/p/p#f", uri('s', [], 'h.h', 123, 'p/p/p', [], 'f')).
test(apf25) :- uri_parse("s://123.123.123.123:123/p#f", uri('s', [], '123.123.123.123', 123, 'p', [], 'f')).
test(apf26) :- uri_parse("s://123.123.123.123:123/p/p#f", uri('s', [], '123.123.123.123', 123, 'p/p', [], 'f')).
test(apf27) :- uri_parse("s://123.123.123.123:123/p/p/p#f", uri('s', [], '123.123.123.123', 123, 'p/p/p', [], 'f')).
test(apf28) :- uri_parse("s://u@h:123/p#f", uri('s', 'u', 'h', 123, 'p', [], 'f')).
test(apf29) :- uri_parse("s://u@h:123/p/p#f", uri('s', 'u', 'h', 123, 'p/p', [], 'f')).
test(apf30) :- uri_parse("s://u@h:123/p/p/p#f", uri('s', 'u', 'h', 123, 'p/p/p', [], 'f')).
test(apf31) :- uri_parse("s://u@h.h:123/p#f", uri('s', 'u', 'h.h', 123, 'p', [], 'f')).
test(apf32) :- uri_parse("s://u@h.h:123/p/p#f", uri('s', 'u', 'h.h', 123, 'p/p', [], 'f')).
test(apf33) :- uri_parse("s://u@h.h:123/p/p/p#f", uri('s', 'u', 'h.h', 123, 'p/p/p', [], 'f')).
test(apf34) :- uri_parse("s://u@123.123.123.123:123/p#f", uri('s', 'u', '123.123.123.123', 123, 'p', [], 'f')).
test(apf35) :- uri_parse("s://u@123.123.123.123:123/p/p#f", uri('s', 'u', '123.123.123.123', 123, 'p/p', [], 'f')).
test(apf36) :- uri_parse("s://u@123.123.123.123:123/p/p/p#f", uri('s', 'u', '123.123.123.123', 123, 'p/p/p', [], 'f')).


% SCHEME:AUTHORITY/PATH?QUERY#FRAGMENT
test(apqf1) :- uri_parse("s://h/p?q#f", uri('s', [], 'h', 80, 'p', 'q', 'f')).
test(apqf2) :- uri_parse("s://h/p/p?q#f", uri('s', [], 'h', 80, 'p/p', 'q', 'f')).
test(apqf3) :- uri_parse("s://h/p/p/p?q#f", uri('s', [], 'h', 80, 'p/p/p', 'q', 'f')).
test(apqf4) :- uri_parse("s://h.h/p?q#f", uri('s', [], 'h.h', 80, 'p', 'q', 'f')).
test(apqf5) :- uri_parse("s://h.h/p/p?q#f", uri('s', [], 'h.h', 80, 'p/p', 'q', 'f')).
test(apqf6) :- uri_parse("s://h.h/p/p/p?q#f", uri('s', [], 'h.h', 80, 'p/p/p', 'q', 'f')).
test(apqf7) :- uri_parse("s://123.123.123.123/p?q#f", uri('s', [], '123.123.123.123', 80, 'p', 'q', 'f')).
test(apqf8) :- uri_parse("s://123.123.123.123/p/p?q#f", uri('s', [], '123.123.123.123', 80, 'p/p', 'q', 'f')).
test(apqf9) :- uri_parse("s://123.123.123.123/p/p/p?q#f", uri('s', [], '123.123.123.123', 80, 'p/p/p', 'q', 'f')).
test(apqf10) :- uri_parse("s://u@h/p?q#f", uri('s', 'u', 'h', 80, 'p', 'q', 'f')).
test(apqf11) :- uri_parse("s://u@h/p/p?q#f", uri('s', 'u', 'h', 80, 'p/p', 'q', 'f')).
test(apqf12) :- uri_parse("s://u@h/p/p/p?q#f", uri('s', 'u', 'h', 80, 'p/p/p', 'q', 'f')).
test(apqf13) :- uri_parse("s://u@h.h/p?q#f", uri('s', 'u', 'h.h', 80, 'p', 'q', 'f')).
test(apqf14) :- uri_parse("s://u@h.h/p/p?q#f", uri('s', 'u', 'h.h', 80, 'p/p', 'q', 'f')).
test(apqf15) :- uri_parse("s://u@h.h/p/p/p?q#f", uri('s', 'u', 'h.h', 80, 'p/p/p', 'q', 'f')).
test(apqf16) :- uri_parse("s://u@123.123.123.123/p?q#f", uri('s', 'u', '123.123.123.123', 80, 'p', 'q', 'f')).
test(apqf17) :- uri_parse("s://u@123.123.123.123/p/p?q#f", uri('s', 'u', '123.123.123.123', 80, 'p/p', 'q', 'f')).
test(apqf18) :- uri_parse("s://u@123.123.123.123/p/p/p?q#f", uri('s', 'u', '123.123.123.123', 80, 'p/p/p', 'q', 'f')).
test(apqf19) :- uri_parse("s://h:123/p?q#f", uri('s', [], 'h', 123, 'p', 'q', 'f')).
test(apqf20) :- uri_parse("s://h:123/p/p?q#f", uri('s', [], 'h', 123, 'p/p', 'q', 'f')).
test(apqf21) :- uri_parse("s://h:123/p/p/p?q#f", uri('s', [], 'h', 123, 'p/p/p', 'q', 'f')).
test(apqf22) :- uri_parse("s://h.h:123/p?q#f", uri('s', [], 'h.h', 123, 'p', 'q', 'f')).
test(apqf23) :- uri_parse("s://h.h:123/p/p?q#f", uri('s', [], 'h.h', 123, 'p/p', 'q', 'f')).
test(apqf24) :- uri_parse("s://h.h:123/p/p/p?q#f", uri('s', [], 'h.h', 123, 'p/p/p', 'q', 'f')).
test(apqf25) :- uri_parse("s://123.123.123.123:123/p?q#f", uri('s', [], '123.123.123.123', 123, 'p', 'q', 'f')).
test(apqf26) :- uri_parse("s://123.123.123.123:123/p/p?q#f", uri('s', [], '123.123.123.123', 123, 'p/p', 'q', 'f')).
test(apqf27) :- uri_parse("s://123.123.123.123:123/p/p/p?q#f", uri('s', [], '123.123.123.123', 123, 'p/p/p', 'q', 'f')).
test(apqf28) :- uri_parse("s://u@h:123/p?q#f", uri('s', 'u', 'h', 123, 'p', 'q', 'f')).
test(apqf29) :- uri_parse("s://u@h:123/p/p?q#f", uri('s', 'u', 'h', 123, 'p/p', 'q', 'f')).
test(apqf30) :- uri_parse("s://u@h:123/p/p/p?q#f", uri('s', 'u', 'h', 123, 'p/p/p', 'q', 'f')).
test(apqf31) :- uri_parse("s://u@h.h:123/p?q#f", uri('s', 'u', 'h.h', 123, 'p', 'q', 'f')).
test(apqf32) :- uri_parse("s://u@h.h:123/p/p?q#f", uri('s', 'u', 'h.h', 123, 'p/p', 'q', 'f')).
test(apqf33) :- uri_parse("s://u@h.h:123/p/p/p?q#f", uri('s', 'u', 'h.h', 123, 'p/p/p', 'q', 'f')).
test(apqf34) :- uri_parse("s://u@123.123.123.123:123/p?q#f", uri('s', 'u', '123.123.123.123', 123, 'p', 'q', 'f')).
test(apqf35) :- uri_parse("s://u@123.123.123.123:123/p/p?q#f", uri('s', 'u', '123.123.123.123', 123, 'p/p', 'q', 'f')).
test(apqf36) :- uri_parse("s://u@123.123.123.123:123/p/p/p?q#f", uri('s', 'u', '123.123.123.123', 123, 'p/p/p', 'q', 'f')).


% SPECIAL SCHEME (scheme:scheme-syntax) - CASE INSENSITIVE

% MAILTO
test(m1) :- uri_parse("mailto:", uri('mailto', [], [], 80, [], [], [])).
test(m2) :- uri_parse("MAILTO:", uri('MAILTO', [], [], 80, [], [], [])).
test(m3) :- uri_parse("mAiLtO:", uri('mAiLtO', [], [], 80, [], [], [])).
test(m4) :- uri_parse("mailto:u", uri('mailto', 'u', [], 80, [], [], [])).
test(m5) :- uri_parse("MAILTO:u", uri('MAILTO', 'u', [], 80, [], [], [])).
test(m6) :- uri_parse("mAiLtO:u", uri('mAiLtO', 'u', [], 80, [], [], [])).
test(m7) :- uri_parse("mailto:u@h", uri('mailto', 'u', 'h', 80, [], [], [])).
test(m8) :- uri_parse("MAILTO:u@h", uri('MAILTO', 'u', 'h', 80, [], [], [])).
test(m9) :- uri_parse("mAiLtO:u@h", uri('mAiLtO', 'u', 'h', 80, [], [], [])).
test(m10) :- uri_parse("mailto:u@h.h", uri('mailto', 'u', 'h.h', 80, [], [], [])).
test(m11) :- uri_parse("MAILTO:u@h.h", uri('MAILTO', 'u', 'h.h', 80, [], [], [])).
test(m12) :- uri_parse("mAiLtO:u@h.h", uri('mAiLtO', 'u', 'h.h', 80, [], [], [])).
test(m13) :- uri_parse("mailto:u@123.123.123.123", uri('mailto', 'u', '123.123.123.123', 80, [], [], [])).
test(m14) :- uri_parse("MAILTO:u@123.123.123.123", uri('MAILTO', 'u', '123.123.123.123', 80, [], [], [])).
test(m15) :- uri_parse("mAiLtO:u@123.123.123.123", uri('mAiLtO', 'u', '123.123.123.123', 80, [], [], [])).

% NEWS
test(n1) :- uri_parse("news:", uri('news', [], [], 80, [], [], [])).
test(n2) :- uri_parse("NEWS:", uri('NEWS', [], [], 80, [], [], [])).
test(n3) :- uri_parse("nEwS:", uri('nEwS', [], [], 80, [], [], [])).
test(n4) :- uri_parse("news:h", uri('news', [], 'h', 80, [], [], [])).
test(n5) :- uri_parse("NEWS:h", uri('NEWS', [], 'h', 80, [], [], [])).
test(n6) :- uri_parse("nEwS:h", uri('nEwS', [], 'h', 80, [], [], [])).
test(n7) :- uri_parse("news:h.h", uri('news', [], 'h.h', 80, [], [], [])).
test(n8) :- uri_parse("NEWS:h.h", uri('NEWS', [], 'h.h', 80, [], [], [])).
test(n9) :- uri_parse("nEwS:h.h", uri('nEwS', [], 'h.h', 80, [], [], [])).
test(n10) :- uri_parse("news:123.123.123.123", uri('news', [], '123.123.123.123', 80, [], [], [])).
test(n11) :- uri_parse("NEWS:123.123.123.123", uri('NEWS', [], '123.123.123.123', 80, [], [], [])).
test(n12) :- uri_parse("nEwS:123.123.123.123", uri('nEwS', [], '123.123.123.123', 80, [], [], [])).

% TEL
test(t1) :- uri_parse("tel:", uri('tel', [], [], 80, [], [], [])).
test(t2) :- uri_parse("TEL:", uri('TEL', [], [], 80, [], [], [])).
test(t3) :- uri_parse("tEl:", uri('tEl', [], [], 80, [], [], [])).
test(t4) :- uri_parse("tel:u", uri('tel', 'u', [], 80, [], [], [])).
test(t5) :- uri_parse("TEL:u", uri('TEL', 'u', [], 80, [], [], [])).
test(t6) :- uri_parse("tEl:u", uri('tEl', 'u', [], 80, [], [], [])).

% FAX
test(f1) :- uri_parse("fax:", uri('fax', [], [], 80, [], [], [])).
test(f2) :- uri_parse("FAX:", uri('FAX', [], [], 80, [], [], [])).
test(f3) :- uri_parse("fAx:", uri('fAx', [], [], 80, [], [], [])).
test(f4) :- uri_parse("fax:u", uri('fax', 'u', [], 80, [], [], [])).
test(f5) :- uri_parse("FAX:u", uri('FAX', 'u', [], 80, [], [], [])).
test(f6) :- uri_parse("fAx:u", uri('fAx', 'u', [], 80, [], [], [])).

% ZOS

% SCHEME:
test(zs) :- uri_parse("zos:", uri('zos', [], [], 80, [], [], [])).
test(zs1) :- uri_parse("ZOS:", uri('ZOS', [], [], 80, [], [], [])).
test(zs2) :- uri_parse("zOs:", uri('zOs', [], [], 80, [], [], [])).

% SCHEME:AUTHORITY
test(za1) :- uri_parse("zos://h", uri('zos', [], 'h', 80, [], [], [])).
test(za2) :- uri_parse("zos://h.h", uri('zos', [], 'h.h', 80, [], [], [])).
test(za3) :- uri_parse("zos://123.123.123.123", uri('zos', [], '123.123.123.123', 80, [], [], [])).
test(za4) :- uri_parse("zos://u@h", uri('zos', 'u', 'h', 80, [], [], [])).
test(za5) :- uri_parse("zos://u@h.h", uri('zos', 'u', 'h.h', 80, [], [], [])).
test(za6) :- uri_parse("zos://u@123.123.123.123", uri('zos', 'u', '123.123.123.123', 80, [], [], [])).
test(za7) :- uri_parse("zos://h:123", uri('zos', [], 'h', 123, [], [], [])).
test(za8) :- uri_parse("zos://h.h:123", uri('zos', [], 'h.h', 123, [], [], [])).
test(za9) :- uri_parse("zos://123.123.123.123:123", uri('zos', [], '123.123.123.123', 123, [], [], [])).
test(za10) :- uri_parse("zos://u@h:123", uri('zos', 'u', 'h', 123, [], [], [])).
test(za11) :- uri_parse("zos://u@h.h:123", uri('zos', 'u', 'h.h', 123, [], [], [])).
test(za12) :- uri_parse("zos://u@123.123.123.123:123", uri('zos', 'u', '123.123.123.123', 123, [], [], [])).

% SCHEME:/ZOSPATH
test(zp) :- uri_parse("zos:/a", uri('zos', [], [], 80, 'a', [], [])).
test(zp1) :- uri_parse("zos:/a.1", uri('zos', [], [], 80, 'a.1', [], [])).
test(zp2) :- uri_parse("zos:/a(a1)", uri('zos', [], [], 80, 'a(a1)', [], [])).

% SCHEME:/ZOSPATH?QUERY
test(zpq) :- uri_parse("zos:/a?q", uri('zos', [], [], 80, 'a', 'q', [])).
test(zpq1) :- uri_parse("zos:/a.1?q", uri('zos', [], [], 80, 'a.1', 'q', [])).
test(zpq2) :- uri_parse("zos:/a(a1)?q", uri('zos', [], [], 80, 'a(a1)', 'q', [])).

% SCHEME:/ZOSPATH#FRAGMENT
test(zpf) :- uri_parse("zos:/a#f", uri('zos', [], [], 80, 'a', [], 'f')).
test(zpf1) :- uri_parse("zos:/a.1#f", uri('zos', [], [], 80, 'a.1', [], 'f')).
test(zpf2) :- uri_parse("zos:/a(a1)#f", uri('zos', [], [], 80, 'a(a1)', [], 'f')).

% SCHEME:/ZOSPATH?QUERY#FRAGMENT
test(zpqf) :- uri_parse("zos:/a?q#f", uri('zos', [], [], 80, 'a', 'q', 'f')).
test(zpqf1) :- uri_parse("zos:/a.1?q#f", uri('zos', [], [], 80, 'a.1', 'q', 'f')).
test(zpqf2) :- uri_parse("zos:/a(a1)?q#f", uri('zos', [], [], 80, 'a(a1)', 'q', 'f')).

% SCHEME:AUTHORITY/ZOSPATH
test(zap1) :- uri_parse("zos://h/a", uri('zos', [], 'h', 80, 'a', [], [])).
test(zap2) :- uri_parse("zos://h/a.1", uri('zos', [], 'h', 80, 'a.1', [], [])).
test(zap3) :- uri_parse("zos://h/a(a1)", uri('zos', [], 'h', 80, 'a(a1)', [], [])).
test(zap4) :- uri_parse("zos://h.h/a", uri('zos', [], 'h.h', 80, 'a', [], [])).
test(zap5) :- uri_parse("zos://h.h/a.1", uri('zos', [], 'h.h', 80, 'a.1', [], [])).
test(zap6) :- uri_parse("zos://h.h/a(a1)", uri('zos', [], 'h.h', 80, 'a(a1)', [], [])).
test(zap7) :- uri_parse("zos://123.123.123.123/a", uri('zos', [], '123.123.123.123', 80, 'a', [], [])).
test(zap8) :- uri_parse("zos://123.123.123.123/a.1", uri('zos', [], '123.123.123.123', 80, 'a.1', [], [])).
test(zap9) :- uri_parse("zos://123.123.123.123/a(a1)", uri('zos', [], '123.123.123.123', 80, 'a(a1)', [], [])).
test(zap10) :- uri_parse("zos://u@h/a", uri('zos', 'u', 'h', 80, 'a', [], [])).
test(zap11) :- uri_parse("zos://u@h/a.1", uri('zos', 'u', 'h', 80, 'a.1', [], [])).
test(zap12) :- uri_parse("zos://u@h/a(a1)", uri('zos', 'u', 'h', 80, 'a(a1)', [], [])).
test(zap13) :- uri_parse("zos://u@h.h/a", uri('zos', 'u', 'h.h', 80, 'a', [], [])).
test(zap14) :- uri_parse("zos://u@h.h/a.1", uri('zos', 'u', 'h.h', 80, 'a.1', [], [])).
test(zap15) :- uri_parse("zos://u@h.h/a(a1)", uri('zos', 'u', 'h.h', 80, 'a(a1)', [], [])).
test(zap16) :- uri_parse("zos://u@123.123.123.123/a", uri('zos', 'u', '123.123.123.123', 80, 'a', [], [])).
test(zap17) :- uri_parse("zos://u@123.123.123.123/a.1", uri('zos', 'u', '123.123.123.123', 80, 'a.1', [], [])).
test(zap18) :- uri_parse("zos://u@123.123.123.123/a(a1)", uri('zos', 'u', '123.123.123.123', 80, 'a(a1)', [], [])).
test(zap19) :- uri_parse("zos://h:123/a", uri('zos', [], 'h', 123, 'a', [], [])).
test(zap20) :- uri_parse("zos://h:123/a.1", uri('zos', [], 'h', 123, 'a.1', [], [])).
test(zap21) :- uri_parse("zos://h:123/a(a1)", uri('zos', [], 'h', 123, 'a(a1)', [], [])).
test(zap22) :- uri_parse("zos://h.h:123/a", uri('zos', [], 'h.h', 123, 'a', [], [])).
test(zap23) :- uri_parse("zos://h.h:123/a.1", uri('zos', [], 'h.h', 123, 'a.1', [], [])).
test(zap24) :- uri_parse("zos://h.h:123/a(a1)", uri('zos', [], 'h.h', 123, 'a(a1)', [], [])).
test(zap25) :- uri_parse("zos://123.123.123.123:123/a", uri('zos', [], '123.123.123.123', 123, 'a', [], [])).
test(zap26) :- uri_parse("zos://123.123.123.123:123/a.1", uri('zos', [], '123.123.123.123', 123, 'a.1', [], [])).
test(zap27) :- uri_parse("zos://123.123.123.123:123/a(a1)", uri('zos', [], '123.123.123.123', 123, 'a(a1)', [], [])).
test(zap28) :- uri_parse("zos://u@h:123/a", uri('zos', 'u', 'h', 123, 'a', [], [])).
test(zap29) :- uri_parse("zos://u@h:123/a.1", uri('zos', 'u', 'h', 123, 'a.1', [], [])).
test(zap30) :- uri_parse("zos://u@h:123/a(a1)", uri('zos', 'u', 'h', 123, 'a(a1)', [], [])).
test(zap31) :- uri_parse("zos://u@h.h:123/a", uri('zos', 'u', 'h.h', 123, 'a', [], [])).
test(zap32) :- uri_parse("zos://u@h.h:123/a.1", uri('zos', 'u', 'h.h', 123, 'a.1', [], [])).
test(zap33) :- uri_parse("zos://u@h.h:123/a(a1)", uri('zos', 'u', 'h.h', 123, 'a(a1)', [], [])).
test(zap34) :- uri_parse("zos://u@123.123.123.123:123/a", uri('zos', 'u', '123.123.123.123', 123, 'a', [], [])).
test(zap35) :- uri_parse("zos://u@123.123.123.123:123/a.1", uri('zos', 'u', '123.123.123.123', 123, 'a.1', [], [])).
test(zap36) :- uri_parse("zos://u@123.123.123.123:123/a(a1)", uri('zos', 'u', '123.123.123.123', 123, 'a(a1)', [], [])).

% SCHEME:AUTHORITY/ZOSPATH?QUERY
test(zapq1) :- uri_parse("zos://h/a?q", uri('zos', [], 'h', 80, 'a', 'q', [])).
test(zapq2) :- uri_parse("zos://h/a.1?q", uri('zos', [], 'h', 80, 'a.1', 'q', [])).
test(zapq3) :- uri_parse("zos://h/a(a1)?q", uri('zos', [], 'h', 80, 'a(a1)', 'q', [])).
test(zapq4) :- uri_parse("zos://h.h/a?q", uri('zos', [], 'h.h', 80, 'a', 'q', [])).
test(zapq5) :- uri_parse("zos://h.h/a.1?q", uri('zos', [], 'h.h', 80, 'a.1', 'q', [])).
test(zapq6) :- uri_parse("zos://h.h/a(a1)?q", uri('zos', [], 'h.h', 80, 'a(a1)', 'q', [])).
test(zapq7) :- uri_parse("zos://123.123.123.123/a?q", uri('zos', [], '123.123.123.123', 80, 'a', 'q', [])).
test(zapq8) :- uri_parse("zos://123.123.123.123/a.1?q", uri('zos', [], '123.123.123.123', 80, 'a.1', 'q', [])).
test(zapq9) :- uri_parse("zos://123.123.123.123/a(a1)?q", uri('zos', [], '123.123.123.123', 80, 'a(a1)', 'q', [])).
test(zapq10) :- uri_parse("zos://u@h/a?q", uri('zos', 'u', 'h', 80, 'a', 'q', [])).
test(zapq11) :- uri_parse("zos://u@h/a.1?q", uri('zos', 'u', 'h', 80, 'a.1', 'q', [])).
test(zapq12) :- uri_parse("zos://u@h/a(a1)?q", uri('zos', 'u', 'h', 80, 'a(a1)', 'q', [])).
test(zapq13) :- uri_parse("zos://u@h.h/a?q", uri('zos', 'u', 'h.h', 80, 'a', 'q', [])).
test(zapq14) :- uri_parse("zos://u@h.h/a.1?q", uri('zos', 'u', 'h.h', 80, 'a.1', 'q', [])).
test(zapq15) :- uri_parse("zos://u@h.h/a(a1)?q", uri('zos', 'u', 'h.h', 80, 'a(a1)', 'q', [])).
test(zapq16) :- uri_parse("zos://u@123.123.123.123/a?q", uri('zos', 'u', '123.123.123.123', 80, 'a', 'q', [])).
test(zapq17) :- uri_parse("zos://u@123.123.123.123/a.1?q", uri('zos', 'u', '123.123.123.123', 80, 'a.1', 'q', [])).
test(zapq18) :- uri_parse("zos://u@123.123.123.123/a(a1)?q", uri('zos', 'u', '123.123.123.123', 80, 'a(a1)', 'q', [])).
test(zapq19) :- uri_parse("zos://h:123/a?q", uri('zos', [], 'h', 123, 'a', 'q', [])).
test(zapq20) :- uri_parse("zos://h:123/a.1?q", uri('zos', [], 'h', 123, 'a.1', 'q', [])).
test(zapq21) :- uri_parse("zos://h:123/a(a1)?q", uri('zos', [], 'h', 123, 'a(a1)', 'q', [])).
test(zapq22) :- uri_parse("zos://h.h:123/a?q", uri('zos', [], 'h.h', 123, 'a', 'q', [])).
test(zapq23) :- uri_parse("zos://h.h:123/a.1?q", uri('zos', [], 'h.h', 123, 'a.1', 'q', [])).
test(zapq24) :- uri_parse("zos://h.h:123/a(a1)?q", uri('zos', [], 'h.h', 123, 'a(a1)', 'q', [])).
test(zapq25) :- uri_parse("zos://123.123.123.123:123/a?q", uri('zos', [], '123.123.123.123', 123, 'a', 'q', [])).
test(zapq26) :- uri_parse("zos://123.123.123.123:123/a.1?q", uri('zos', [], '123.123.123.123', 123, 'a.1', 'q', [])).
test(zapq27) :- uri_parse("zos://123.123.123.123:123/a(a1)?q", uri('zos', [], '123.123.123.123', 123, 'a(a1)', 'q', [])).
test(zapq28) :- uri_parse("zos://u@h:123/a?q", uri('zos', 'u', 'h', 123, 'a', 'q', [])).
test(zapq29) :- uri_parse("zos://u@h:123/a.1?q", uri('zos', 'u', 'h', 123, 'a.1', 'q', [])).
test(zapq30) :- uri_parse("zos://u@h:123/a(a1)?q", uri('zos', 'u', 'h', 123, 'a(a1)', 'q', [])).
test(zapq31) :- uri_parse("zos://u@h.h:123/a?q", uri('zos', 'u', 'h.h', 123, 'a', 'q', [])).
test(zapq32) :- uri_parse("zos://u@h.h:123/a.1?q", uri('zos', 'u', 'h.h', 123, 'a.1', 'q', [])).
test(zapq33) :- uri_parse("zos://u@h.h:123/a(a1)?q", uri('zos', 'u', 'h.h', 123, 'a(a1)', 'q', [])).
test(zapq34) :- uri_parse("zos://u@123.123.123.123:123/a?q", uri('zos', 'u', '123.123.123.123', 123, 'a', 'q', [])).
test(zapq35) :- uri_parse("zos://u@123.123.123.123:123/a.1?q", uri('zos', 'u', '123.123.123.123', 123, 'a.1', 'q', [])).
test(zapq36) :- uri_parse("zos://u@123.123.123.123:123/a(a1)?q", uri('zos', 'u', '123.123.123.123', 123, 'a(a1)', 'q', [])).

% SCHEME:AUTHORITY/ZOSPATH#FRAGMENT
test(zapf1) :- uri_parse("zos://h/a#f", uri('zos', [], 'h', 80, 'a', [], 'f')).
test(zapf2) :- uri_parse("zos://h/a.1#f", uri('zos', [], 'h', 80, 'a.1', [], 'f')).
test(zapf3) :- uri_parse("zos://h/a(a1)#f", uri('zos', [], 'h', 80, 'a(a1)', [], 'f')).
test(zapf4) :- uri_parse("zos://h.h/a#f", uri('zos', [], 'h.h', 80, 'a', [], 'f')).
test(zapf5) :- uri_parse("zos://h.h/a.1#f", uri('zos', [], 'h.h', 80, 'a.1', [], 'f')).
test(zapf6) :- uri_parse("zos://h.h/a(a1)#f", uri('zos', [], 'h.h', 80, 'a(a1)', [], 'f')).
test(zapf7) :- uri_parse("zos://123.123.123.123/a#f", uri('zos', [], '123.123.123.123', 80, 'a', [], 'f')).
test(zapf8) :- uri_parse("zos://123.123.123.123/a.1#f", uri('zos', [], '123.123.123.123', 80, 'a.1', [], 'f')).
test(zapf9) :- uri_parse("zos://123.123.123.123/a(a1)#f", uri('zos', [], '123.123.123.123', 80, 'a(a1)', [], 'f')).
test(zapf10) :- uri_parse("zos://u@h/a#f", uri('zos', 'u', 'h', 80, 'a', [], 'f')).
test(zapf11) :- uri_parse("zos://u@h/a.1#f", uri('zos', 'u', 'h', 80, 'a.1', [], 'f')).
test(zapf12) :- uri_parse("zos://u@h/a(a1)#f", uri('zos', 'u', 'h', 80, 'a(a1)', [], 'f')).
test(zapf13) :- uri_parse("zos://u@h.h/a#f", uri('zos', 'u', 'h.h', 80, 'a', [], 'f')).
test(zapf14) :- uri_parse("zos://u@h.h/a.1#f", uri('zos', 'u', 'h.h', 80, 'a.1', [], 'f')).
test(zapf15) :- uri_parse("zos://u@h.h/a(a1)#f", uri('zos', 'u', 'h.h', 80, 'a(a1)', [], 'f')).
test(zapf16) :- uri_parse("zos://u@123.123.123.123/a#f", uri('zos', 'u', '123.123.123.123', 80, 'a', [], 'f')).
test(zapf17) :- uri_parse("zos://u@123.123.123.123/a.1#f", uri('zos', 'u', '123.123.123.123', 80, 'a.1', [], 'f')).
test(zapf18) :- uri_parse("zos://u@123.123.123.123/a(a1)#f", uri('zos', 'u', '123.123.123.123', 80, 'a(a1)', [], 'f')).
test(zapf19) :- uri_parse("zos://h:123/a#f", uri('zos', [], 'h', 123, 'a', [], 'f')).
test(zapf20) :- uri_parse("zos://h:123/a.1#f", uri('zos', [], 'h', 123, 'a.1', [], 'f')).
test(zapf21) :- uri_parse("zos://h:123/a(a1)#f", uri('zos', [], 'h', 123, 'a(a1)', [], 'f')).
test(zapf22) :- uri_parse("zos://h.h:123/a#f", uri('zos', [], 'h.h', 123, 'a', [], 'f')).
test(zapf23) :- uri_parse("zos://h.h:123/a.1#f", uri('zos', [], 'h.h', 123, 'a.1', [], 'f')).
test(zapf24) :- uri_parse("zos://h.h:123/a(a1)#f", uri('zos', [], 'h.h', 123, 'a(a1)', [], 'f')).
test(zapf25) :- uri_parse("zos://123.123.123.123:123/a#f", uri('zos', [], '123.123.123.123', 123, 'a', [], 'f')).
test(zapf26) :- uri_parse("zos://123.123.123.123:123/a.1#f", uri('zos', [], '123.123.123.123', 123, 'a.1', [], 'f')).
test(zapf27) :- uri_parse("zos://123.123.123.123:123/a(a1)#f", uri('zos', [], '123.123.123.123', 123, 'a(a1)', [], 'f')).
test(zapf28) :- uri_parse("zos://u@h:123/a#f", uri('zos', 'u', 'h', 123, 'a', [], 'f')).
test(zapf29) :- uri_parse("zos://u@h:123/a.1#f", uri('zos', 'u', 'h', 123, 'a.1', [], 'f')).
test(zapf30) :- uri_parse("zos://u@h:123/a(a1)#f", uri('zos', 'u', 'h', 123, 'a(a1)', [], 'f')).
test(zapf31) :- uri_parse("zos://u@h.h:123/a#f", uri('zos', 'u', 'h.h', 123, 'a', [], 'f')).
test(zapf32) :- uri_parse("zos://u@h.h:123/a.1#f", uri('zos', 'u', 'h.h', 123, 'a.1', [], 'f')).
test(zapf33) :- uri_parse("zos://u@h.h:123/a(a1)#f", uri('zos', 'u', 'h.h', 123, 'a(a1)', [], 'f')).
test(zapf34) :- uri_parse("zos://u@123.123.123.123:123/a#f", uri('zos', 'u', '123.123.123.123', 123, 'a', [], 'f')).
test(zapf35) :- uri_parse("zos://u@123.123.123.123:123/a.1#f", uri('zos', 'u', '123.123.123.123', 123, 'a.1', [], 'f')).
test(zapf36) :- uri_parse("zos://u@123.123.123.123:123/a(a1)#f", uri('zos', 'u', '123.123.123.123', 123, 'a(a1)', [], 'f')).

% SCHEME:AUTHORITY/ZOSPATH?QUERY#FRAGMENT
test(zapqf1) :- uri_parse("zos://h/a?q#f", uri('zos', [], 'h', 80, 'a', 'q', 'f')).
test(zapqf2) :- uri_parse("zos://h/a.1?q#f", uri('zos', [], 'h', 80, 'a.1', 'q', 'f')).
test(zapqf3) :- uri_parse("zos://h/a(a1)?q#f", uri('zos', [], 'h', 80, 'a(a1)', 'q', 'f')).
test(zapqf4) :- uri_parse("zos://h.h/a?q#f", uri('zos', [], 'h.h', 80, 'a', 'q', 'f')).
test(zapqf5) :- uri_parse("zos://h.h/a.1?q#f", uri('zos', [], 'h.h', 80, 'a.1', 'q', 'f')).
test(zapqf6) :- uri_parse("zos://h.h/a(a1)?q#f", uri('zos', [], 'h.h', 80, 'a(a1)', 'q', 'f')).
test(zapqf7) :- uri_parse("zos://123.123.123.123/a?q#f", uri('zos', [], '123.123.123.123', 80, 'a', 'q', 'f')).
test(zapqf8) :- uri_parse("zos://123.123.123.123/a.1?q#f", uri('zos', [], '123.123.123.123', 80, 'a.1', 'q', 'f')).
test(zapqf9) :- uri_parse("zos://123.123.123.123/a(a1)?q#f", uri('zos', [], '123.123.123.123', 80, 'a(a1)', 'q', 'f')).
test(zapqf10) :- uri_parse("zos://u@h/a?q#f", uri('zos', 'u', 'h', 80, 'a', 'q', 'f')).
test(zapqf11) :- uri_parse("zos://u@h/a.1?q#f", uri('zos', 'u', 'h', 80, 'a.1', 'q', 'f')).
test(zapqf12) :- uri_parse("zos://u@h/a(a1)?q#f", uri('zos', 'u', 'h', 80, 'a(a1)', 'q', 'f')).
test(zapqf13) :- uri_parse("zos://u@h.h/a?q#f", uri('zos', 'u', 'h.h', 80, 'a', 'q', 'f')).
test(zapqf14) :- uri_parse("zos://u@h.h/a.1?q#f", uri('zos', 'u', 'h.h', 80, 'a.1', 'q', 'f')).
test(zapqf15) :- uri_parse("zos://u@h.h/a(a1)?q#f", uri('zos', 'u', 'h.h', 80, 'a(a1)', 'q', 'f')).
test(zapqf16) :- uri_parse("zos://u@123.123.123.123/a?q#f", uri('zos', 'u', '123.123.123.123', 80, 'a', 'q', 'f')).
test(zapqf17) :- uri_parse("zos://u@123.123.123.123/a.1?q#f", uri('zos', 'u', '123.123.123.123', 80, 'a.1', 'q', 'f')).
test(zapqf18) :- uri_parse("zos://u@123.123.123.123/a(a1)?q#f", uri('zos', 'u', '123.123.123.123', 80, 'a(a1)', 'q', 'f')).
test(zapqf19) :- uri_parse("zos://h:123/a?q#f", uri('zos', [], 'h', 123, 'a', 'q', 'f')).
test(zapqf20) :- uri_parse("zos://h:123/a.1?q#f", uri('zos', [], 'h', 123, 'a.1', 'q', 'f')).
test(zapqf21) :- uri_parse("zos://h:123/a(a1)?q#f", uri('zos', [], 'h', 123, 'a(a1)', 'q', 'f')).
test(zapqf22) :- uri_parse("zos://h.h:123/a?q#f", uri('zos', [], 'h.h', 123, 'a', 'q', 'f')).
test(zapqf23) :- uri_parse("zos://h.h:123/a.1?q#f", uri('zos', [], 'h.h', 123, 'a.1', 'q', 'f')).
test(zapqf24) :- uri_parse("zos://h.h:123/a(a1)?q#f", uri('zos', [], 'h.h', 123, 'a(a1)', 'q', 'f')).
test(zapqf25) :- uri_parse("zos://123.123.123.123:123/a?q#f", uri('zos', [], '123.123.123.123', 123, 'a', 'q', 'f')).
test(zapqf26) :- uri_parse("zos://123.123.123.123:123/a.1?q#f", uri('zos', [], '123.123.123.123', 123, 'a.1', 'q', 'f')).
test(zapqf27) :- uri_parse("zos://123.123.123.123:123/a(a1)?q#f", uri('zos', [], '123.123.123.123', 123, 'a(a1)', 'q', 'f')).
test(zapqf28) :- uri_parse("zos://u@h:123/a?q#f", uri('zos', 'u', 'h', 123, 'a', 'q', 'f')).
test(zapqf29) :- uri_parse("zos://u@h:123/a.1?q#f", uri('zos', 'u', 'h', 123, 'a.1', 'q', 'f')).
test(zapqf30) :- uri_parse("zos://u@h:123/a(a1)?q#f", uri('zos', 'u', 'h', 123, 'a(a1)', 'q', 'f')).
test(zapqf31) :- uri_parse("zos://u@h.h:123/a?q#f", uri('zos', 'u', 'h.h', 123, 'a', 'q', 'f')).
test(zapqf32) :- uri_parse("zos://u@h.h:123/a.1?q#f", uri('zos', 'u', 'h.h', 123, 'a.1', 'q', 'f')).
test(zapqf33) :- uri_parse("zos://u@h.h:123/a(a1)?q#f", uri('zos', 'u', 'h.h', 123, 'a(a1)', 'q', 'f')).
test(zapqf34) :- uri_parse("zos://u@123.123.123.123:123/a?q#f", uri('zos', 'u', '123.123.123.123', 123, 'a', 'q', 'f')).
test(zapqf35) :- uri_parse("zos://u@123.123.123.123:123/a.1?q#f", uri('zos', 'u', '123.123.123.123', 123, 'a.1', 'q', 'f')).
test(zapqf36) :- uri_parse("zos://u@123.123.123.123:123/a(a1)?q#f", uri('zos', 'u', '123.123.123.123', 123, 'a(a1)', 'q', 'f')).

% ---------------------------------------------------------------

% FALSE (1char)

test(f) :- \+uri_parse("s", _).
test(f1) :- \+uri_parse("s:?", _).
test(f2) :- \+uri_parse("s:s:", _).
test(f3) :- \+uri_parse("s:#", _).
test(f4) :- \+uri_parse("s:/?", _).
test(f5) :- \+uri_parse("s/", _).
test(f6) :- \+uri_parse("s://", _).
test(f7) :- \+uri_parse("s://h..h", _).
test(f8) :- \+uri_parse("s://123./123.123.123", _).
test(f9) :- \+uri_parse("s://u@h?", _).
test(f10) :- \+uri_parse("s://u@h.#h", _).
test(f11) :- \+uri_parse("s://u@123.12@3.123.123", _).
test(f12) :- \+uri_parse("s://h:12:3", _).
test(f13) :- \+uri_parse("s:/h.h:123", _).
test(f14) :- \+uri_parse("s://123.123.123.123:1a3", _).
test(f15) :- \+uri_parse("s://u/@h:123", _).
test(f16) :- \+uri_parse("s://u?@h.h:123", _).
test(f17) :- \+uri_parse("s://u#@123.123.123.123:123", _).
test(f18) :- \+uri_parse("s:/p/:p", _).
test(f19) :- \+uri_parse("s:/p/p/@p", _).
test(f20) :- \+uri_parse("s:/#", _).
test(f21) :- \+uri_parse("s:/p/p?q#", _).
test(f22) :- \+uri_parse("s:/p/#/p?q", _).
test(f23) :- \+uri_parse("s:/p/p?#f", _).
test(f24) :- \+uri_parse("s:/p/#/p#f", _).
test(f25) :- \+uri_parse("s:/p/p/p?#", _).
test(f26) :- \+uri_parse("s://u@u@h/p", _).
test(f27) :- \+uri_parse("s:/p//a", _).
test(f28) :- \+uri_parse("s://ah.h@u:p", _).
test(f29) :- \+uri_parse("s:/?q//h.h#", _).

% SPECIAL SCHEME (scheme:scheme-syntax) - CASE INSENSITIVE

% MAILTO
test(f_m1) :- \+uri_parse("mailto:#", _).
test(f_m2) :- \+uri_parse("mailto:u#", _).
test(f_m3) :- \+uri_parse("mailto:u/@h", _).
test(f_m4) :- \+uri_parse("mailto:u@", _).
test(f_m5) :- \+uri_parse("mailto:u?@123.123.123.123", _).

% NEWS
test(f_n1) :- \+uri_parse("news:/", _).
test(f_n2) :- \+uri_parse("news::", _).
test(f_n3) :- \+uri_parse("news:h./", _).
test(f_n4) :- \+uri_parse("news:123.123.123.?", _).

% TEL
test(f_t1) :- \+uri_parse("tel://", _).
test(f_t2) :- \+uri_parse("tel:u:", _).

% FAX
test(f_f1) :- \+uri_parse("fax:h.h?", _).
test(f_f2) :- \+uri_parse("fax:u/", _).

% ZOS

% SCHEME:
test(f_zs1) :- \+uri_parse("zos:/", _).
test(f_zs2) :- \+uri_parse("zos://h.h/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", _).
test(f_zs3) :- \+uri_parse("zos://h.h/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa(a)", _).
test(f_zs4) :- \+uri_parse("zos://h.h/1a", _).
test(f_zs5) :- \+uri_parse("zos://h.h/1a(a)", _).
test(f_zs6) :- \+uri_parse("zos://h.h/1a(aaaaaaaaa)", _).
test(f_zs7) :- \+uri_parse("zos://h.h/a(1a)", _).
test(f_zs8) :- \+uri_parse("zos://h.h/1a()", _).
test(f_zs9) :- \+uri_parse("zos://h.h/(a1)", _).
test(f_zs10) :- \+uri_parse("zos://h.h/.a(a)", _).
test(f_zs11) :- \+uri_parse("zos://h.h/a(a#)", _).
test(f_zs12) :- \+uri_parse("zos://h.h/a.a.#(a)", _).
test(f_zs13) :- \+uri_parse("zos://h.h/a.(a)", _).

% ---------------------------------------------------------------

% TRUE (multichar)

% SCHEME:
test(m_s) :- uri_parse("scheme:", uri('scheme', [], [], 80, [], [], [])).
test(m_s1) :- uri_parse("scheme:/", uri('scheme', [], [], 80, [], [], [])).

% SCHEME:AUTHORITY
test(m_a) :- uri_parse("scheme://host", uri('scheme', [], 'host', 80, [], [], [])).
test(m_a1) :- uri_parse("scheme://host.host", uri('scheme', [], 'host.host', 80, [], [], [])).
test(m_a2) :- uri_parse("scheme://123.123.123.123", uri('scheme', [], '123.123.123.123', 80, [], [], [])).
test(m_a3) :- uri_parse("scheme://userinfo@host", uri('scheme', 'userinfo', 'host', 80, [], [], [])).
test(m_a4) :- uri_parse("scheme://userinfo@host.host", uri('scheme', 'userinfo', 'host.host', 80, [], [], [])).
test(m_a5) :- uri_parse("scheme://userinfo@123.123.123.123", uri('scheme', 'userinfo', '123.123.123.123', 80, [], [], [])).
test(m_a6) :- uri_parse("scheme://host:123", uri('scheme', [], 'host', 123, [], [], [])).
test(m_a7) :- uri_parse("scheme://host.host:123", uri('scheme', [], 'host.host', 123, [], [], [])).
test(m_a8) :- uri_parse("scheme://123.123.123.123:123", uri('scheme', [], '123.123.123.123', 123, [], [], [])).
test(m_a9) :- uri_parse("scheme://userinfo@host:123", uri('scheme', 'userinfo', 'host', 123, [], [], [])).
test(m_a10) :- uri_parse("scheme://userinfo@host.host:123", uri('scheme', 'userinfo', 'host.host', 123, [], [], [])).
test(m_a11) :- uri_parse("scheme://userinfo@123.123.123.123:123", uri('scheme', 'userinfo', '123.123.123.123', 123, [], [], [])).

% SCHEME:/PATH
test(m_p) :- uri_parse("scheme:/path", uri('scheme', [], [], 80, 'path', [], [])).
test(m_p1) :- uri_parse("scheme:/path/path", uri('scheme', [], [], 80, 'path/path', [], [])).
test(m_p2) :- uri_parse("scheme:/path/path/path", uri('scheme', [], [], 80, 'path/path/path', [], [])).

% SCHEME:/?QUERY
test(m_q) :- uri_parse("scheme:/?query", uri('scheme', [], [], 80, [], 'query', [])).

% SCHEME:/#FRAGMENT
test(m_f) :- uri_parse("scheme:/#fragment", uri('scheme', [], [], 80, [], [], 'fragment')).

% SCHEME:/?QUERY#FRAGMENT
test(m_qf) :- uri_parse("scheme:/?query#fragment", uri('scheme', [], [], 80, [], 'query', 'fragment')).

% SCHEME:/PATH?QUERY
test(m_pq) :- uri_parse("scheme:/path?query", uri('scheme', [], [], 80, 'path', 'query', [])).
test(m_pq1) :- uri_parse("scheme:/path/path?query", uri('scheme', [], [], 80, 'path/path', 'query', [])).
test(m_pq2) :- uri_parse("scheme:/path/path/path?query", uri('scheme', [], [], 80, 'path/path/path', 'query', [])).

% SCHEME:/PATH#FRAGMENT
test(m_pf) :- uri_parse("scheme:/path#fragment", uri('scheme', [], [], 80, 'path', [], 'fragment')).
test(m_pf1) :- uri_parse("scheme:/path/path#fragment", uri('scheme', [], [], 80, 'path/path', [], 'fragment')).
test(m_pf2) :- uri_parse("scheme:/path/path/path#fragment", uri('scheme', [], [], 80, 'path/path/path', [], 'fragment')).

% SCHEME:/PATH?QUERY#FRAGMENT
test(m_pqf) :- uri_parse("scheme:/path?query#fragment", uri('scheme', [], [], 80, 'path', 'query', 'fragment')).
test(m_pqf1) :- uri_parse("scheme:/path/path?query#fragment", uri('scheme', [], [], 80, 'path/path', 'query', 'fragment')).
test(m_pqf2) :- uri_parse("scheme:/path/path/path?query#fragment", uri('scheme', [], [], 80, 'path/path/path', 'query', 'fragment')).

% SCHEME:AUTHORITY/PATH
test(m_ap) :- uri_parse("scheme://host/path", uri('scheme', [], 'host', 80, 'path', [], [])).
test(m_ap1) :- uri_parse("scheme://host/path/path", uri('scheme', [], 'host', 80, 'path/path', [], [])).
test(m_ap2) :- uri_parse("scheme://host/path/path/path", uri('scheme', [], 'host', 80, 'path/path/path', [], [])).
test(m_ap3) :- uri_parse("scheme://host.host/path", uri('scheme', [], 'host.host', 80, 'path', [], [])).
test(m_ap4) :- uri_parse("scheme://host.host/path/path", uri('scheme', [], 'host.host', 80, 'path/path', [], [])).
test(m_ap5) :- uri_parse("scheme://host.host/path/path/path", uri('scheme', [], 'host.host', 80, 'path/path/path', [], [])).
test(m_ap6) :- uri_parse("scheme://123.123.123.123/path", uri('scheme', [], '123.123.123.123', 80, 'path', [], [])).
test(m_ap7) :- uri_parse("scheme://123.123.123.123/path/path", uri('scheme', [], '123.123.123.123', 80, 'path/path', [], [])).
test(m_ap8) :- uri_parse("scheme://123.123.123.123/path/path/path", uri('scheme', [], '123.123.123.123', 80, 'path/path/path', [], [])).
test(m_ap9) :- uri_parse("scheme://userinfo@host/path", uri('scheme', 'userinfo', 'host', 80, 'path', [], [])).
test(m_ap10) :- uri_parse("scheme://userinfo@host/path/path", uri('scheme', 'userinfo', 'host', 80, 'path/path', [], [])).
test(m_ap11) :- uri_parse("scheme://userinfo@host/path/path/path", uri('scheme', 'userinfo', 'host', 80, 'path/path/path', [], [])).
test(m_ap12) :- uri_parse("scheme://userinfo@host.host/path", uri('scheme', 'userinfo', 'host.host', 80, 'path', [], [])).
test(m_ap13) :- uri_parse("scheme://userinfo@host.host/path/path", uri('scheme', 'userinfo', 'host.host', 80, 'path/path', [], [])).
test(m_ap14) :- uri_parse("scheme://userinfo@host.host/path/path/path", uri('scheme', 'userinfo', 'host.host', 80, 'path/path/path', [], [])).
test(m_ap15) :- uri_parse("scheme://userinfo@123.123.123.123/path", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path', [], [])).
test(m_ap16) :- uri_parse("scheme://userinfo@123.123.123.123/path/path", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path', [], [])).
test(m_ap17) :- uri_parse("scheme://userinfo@123.123.123.123/path/path/path", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path/path', [], [])).
test(m_ap18) :- uri_parse("scheme://host:123/path", uri('scheme', [], 'host', 123, 'path', [], [])).
test(m_ap19) :- uri_parse("scheme://host:123/path/path", uri('scheme', [], 'host', 123, 'path/path', [], [])).
test(m_ap20) :- uri_parse("scheme://host:123/path/path/path", uri('scheme', [], 'host', 123, 'path/path/path', [], [])).
test(m_ap21) :- uri_parse("scheme://host.host:123/path", uri('scheme', [], 'host.host', 123, 'path', [], [])).
test(m_ap22) :- uri_parse("scheme://host.host:123/path/path", uri('scheme', [], 'host.host', 123, 'path/path', [], [])).
test(m_ap23) :- uri_parse("scheme://host.host:123/path/path/path", uri('scheme', [], 'host.host', 123, 'path/path/path', [], [])).
test(m_ap24) :- uri_parse("scheme://123.123.123.123:123/path", uri('scheme', [], '123.123.123.123', 123, 'path', [], [])).
test(m_ap25) :- uri_parse("scheme://123.123.123.123:123/path/path", uri('scheme', [], '123.123.123.123', 123, 'path/path', [], [])).
test(m_ap26) :- uri_parse("scheme://123.123.123.123:123/path/path/path", uri('scheme', [], '123.123.123.123', 123, 'path/path/path', [], [])).
test(m_ap27) :- uri_parse("scheme://userinfo@host:123/path", uri('scheme', 'userinfo', 'host', 123, 'path', [], [])).
test(m_ap28) :- uri_parse("scheme://userinfo@host:123/path/path", uri('scheme', 'userinfo', 'host', 123, 'path/path', [], [])).
test(m_ap29) :- uri_parse("scheme://userinfo@host:123/path/path/path", uri('scheme', 'userinfo', 'host', 123, 'path/path/path', [], [])).
test(m_ap30) :- uri_parse("scheme://userinfo@host.host:123/path", uri('scheme', 'userinfo', 'host.host', 123, 'path', [], [])).
test(m_ap31) :- uri_parse("scheme://userinfo@host.host:123/path/path", uri('scheme', 'userinfo', 'host.host', 123, 'path/path', [], [])).
test(m_ap32) :- uri_parse("scheme://userinfo@host.host:123/path/path/path", uri('scheme', 'userinfo', 'host.host', 123, 'path/path/path', [], [])).
test(m_ap33) :- uri_parse("scheme://userinfo@123.123.123.123:123/path", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path', [], [])).
test(m_ap34) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path', [], [])).
test(m_ap35) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path/path", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path/path', [], [])).

% SCHEME:AUTHORITY/?QUERY
test(m_aq) :- uri_parse("scheme://host/?query", uri('scheme', [], 'host', 80, [], 'query', [])).
test(m_aq1) :- uri_parse("scheme://host.host/?query", uri('scheme', [], 'host.host', 80, [], 'query', [])).
test(m_aq2) :- uri_parse("scheme://123.123.123.123/?query", uri('scheme', [], '123.123.123.123', 80, [], 'query', [])).
test(m_aq3) :- uri_parse("scheme://userinfo@host/?query", uri('scheme', 'userinfo', 'host', 80, [], 'query', [])).
test(m_aq4) :- uri_parse("scheme://userinfo@host.host/?query", uri('scheme', 'userinfo', 'host.host', 80, [], 'query', [])).
test(m_aq5) :- uri_parse("scheme://userinfo@123.123.123.123/?query", uri('scheme', 'userinfo', '123.123.123.123', 80, [], 'query', [])).
test(m_aq6) :- uri_parse("scheme://host:123/?query", uri('scheme', [], 'host', 123, [], 'query', [])).
test(m_aq7) :- uri_parse("scheme://host.host:123/?query", uri('scheme', [], 'host.host', 123, [], 'query', [])).
test(m_aq8) :- uri_parse("scheme://123.123.123.123:123/?query", uri('scheme', [], '123.123.123.123', 123, [], 'query', [])).
test(m_aq9) :- uri_parse("scheme://userinfo@host:123/?query", uri('scheme', 'userinfo', 'host', 123, [], 'query', [])).
test(m_aq10) :- uri_parse("scheme://userinfo@host.host:123/?query", uri('scheme', 'userinfo', 'host.host', 123, [], 'query', [])).
test(m_aq11) :- uri_parse("scheme://userinfo@123.123.123.123:123/?query", uri('scheme', 'userinfo', '123.123.123.123', 123, [], 'query', [])).


% SCHEME:AUTHORITY/#FRAGMENT
test(m_af1) :- uri_parse("scheme://host/#fragment", uri('scheme', [], 'host', 80, [], [], 'fragment')).
test(m_af2) :- uri_parse("scheme://host.host/#fragment", uri('scheme', [], 'host.host', 80, [], [], 'fragment')).
test(m_af3) :- uri_parse("scheme://123.123.123.123/#fragment", uri('scheme', [], '123.123.123.123', 80, [], [], 'fragment')).
test(m_af4) :- uri_parse("scheme://userinfo@host/#fragment", uri('scheme', 'userinfo', 'host', 80, [], [], 'fragment')).
test(m_af5) :- uri_parse("scheme://userinfo@host.host/#fragment", uri('scheme', 'userinfo', 'host.host', 80, [], [], 'fragment')).
test(m_af6) :- uri_parse("scheme://userinfo@123.123.123.123/#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, [], [], 'fragment')).
test(m_af7) :- uri_parse("scheme://host:123/#fragment", uri('scheme', [], 'host', 123, [], [], 'fragment')).
test(m_af8) :- uri_parse("scheme://host.host:123/#fragment", uri('scheme', [], 'host.host', 123, [], [], 'fragment')).
test(m_af9) :- uri_parse("scheme://123.123.123.123:123/#fragment", uri('scheme', [], '123.123.123.123', 123, [], [], 'fragment')).
test(m_af10) :- uri_parse("scheme://userinfo@host:123/#fragment", uri('scheme', 'userinfo', 'host', 123, [], [], 'fragment')).
test(m_af11) :- uri_parse("scheme://userinfo@host.host:123/#fragment", uri('scheme', 'userinfo', 'host.host', 123, [], [], 'fragment')).
test(m_af12) :- uri_parse("scheme://userinfo@123.123.123.123:123/#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, [], [], 'fragment')).


% SCHEME:AUTHORITY/?QUERY#FRAGMENT
test(m_aqf1) :- uri_parse("scheme://host/?query#fragment", uri('scheme', [], 'host', 80, [], 'query', 'fragment')).
test(m_aqf2) :- uri_parse("scheme://host.host/?query#fragment", uri('scheme', [], 'host.host', 80, [], 'query', 'fragment')).
test(m_aqf3) :- uri_parse("scheme://123.123.123.123/?query#fragment", uri('scheme', [], '123.123.123.123', 80, [], 'query', 'fragment')).
test(m_aqf4) :- uri_parse("scheme://userinfo@host/?query#fragment", uri('scheme', 'userinfo', 'host', 80, [], 'query', 'fragment')).
test(m_aqf5) :- uri_parse("scheme://userinfo@host.host/?query#fragment", uri('scheme', 'userinfo', 'host.host', 80, [], 'query', 'fragment')).
test(m_aqf6) :- uri_parse("scheme://userinfo@123.123.123.123/?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, [], 'query', 'fragment')).
test(m_aqf7) :- uri_parse("scheme://host:123/?query#fragment", uri('scheme', [], 'host', 123, [], 'query', 'fragment')).
test(m_aqf8) :- uri_parse("scheme://host.host:123/?query#fragment", uri('scheme', [], 'host.host', 123, [], 'query', 'fragment')).
test(m_aqf9) :- uri_parse("scheme://123.123.123.123:123/?query#fragment", uri('scheme', [], '123.123.123.123', 123, [], 'query', 'fragment')).
test(m_aqf10) :- uri_parse("scheme://userinfo@host:123/?query#fragment", uri('scheme', 'userinfo', 'host', 123, [], 'query', 'fragment')).
test(m_aqf11) :- uri_parse("scheme://userinfo@host.host:123/?query#fragment", uri('scheme', 'userinfo', 'host.host', 123, [], 'query', 'fragment')).
test(m_aqf12) :- uri_parse("scheme://userinfo@123.123.123.123:123/?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, [], 'query', 'fragment')).


% SCHEME:AUTHORITY/PATH?QUERY
test(m_apq1) :- uri_parse("scheme://host/path?query", uri('scheme', [], 'host', 80, 'path', 'query', [])).
test(m_apq2) :- uri_parse("scheme://host/path/path?query", uri('scheme', [], 'host', 80, 'path/path', 'query', [])).
test(m_apq3) :- uri_parse("scheme://host/path/path/path?query", uri('scheme', [], 'host', 80, 'path/path/path', 'query', [])).
test(m_apq4) :- uri_parse("scheme://host.host/path?query", uri('scheme', [], 'host.host', 80, 'path', 'query', [])).
test(m_apq5) :- uri_parse("scheme://host.host/path/path?query", uri('scheme', [], 'host.host', 80, 'path/path', 'query', [])).
test(m_apq6) :- uri_parse("scheme://host.host/path/path/path?query", uri('scheme', [], 'host.host', 80, 'path/path/path', 'query', [])).
test(m_apq7) :- uri_parse("scheme://123.123.123.123/path?query", uri('scheme', [], '123.123.123.123', 80, 'path', 'query', [])).
test(m_apq8) :- uri_parse("scheme://123.123.123.123/path/path?query", uri('scheme', [], '123.123.123.123', 80, 'path/path', 'query', [])).
test(m_apq9) :- uri_parse("scheme://123.123.123.123/path/path/path?query", uri('scheme', [], '123.123.123.123', 80, 'path/path/path', 'query', [])).
test(m_apq10) :- uri_parse("scheme://userinfo@host/path?query", uri('scheme', 'userinfo', 'host', 80, 'path', 'query', [])).
test(m_apq11) :- uri_parse("scheme://userinfo@host/path/path?query", uri('scheme', 'userinfo', 'host', 80, 'path/path', 'query', [])).
test(m_apq12) :- uri_parse("scheme://userinfo@host/path/path/path?query", uri('scheme', 'userinfo', 'host', 80, 'path/path/path', 'query', [])).
test(m_apq13) :- uri_parse("scheme://userinfo@host.host/path?query", uri('scheme', 'userinfo', 'host.host', 80, 'path', 'query', [])).
test(m_apq14) :- uri_parse("scheme://userinfo@host.host/path/path?query", uri('scheme', 'userinfo', 'host.host', 80, 'path/path', 'query', [])).
test(m_apq15) :- uri_parse("scheme://userinfo@host.host/path/path/path?query", uri('scheme', 'userinfo', 'host.host', 80, 'path/path/path', 'query', [])).
test(m_apq16) :- uri_parse("scheme://userinfo@123.123.123.123/path?query", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path', 'query', [])).
test(m_apq17) :- uri_parse("scheme://userinfo@123.123.123.123/path/path?query", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path', 'query', [])).
test(m_apq18) :- uri_parse("scheme://userinfo@123.123.123.123/path/path/path?query", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path/path', 'query', [])).
test(m_apq19) :- uri_parse("scheme://host:123/path?query", uri('scheme', [], 'host', 123, 'path', 'query', [])).
test(m_apq20) :- uri_parse("scheme://host:123/path/path?query", uri('scheme', [], 'host', 123, 'path/path', 'query', [])).
test(m_apq21) :- uri_parse("scheme://host:123/path/path/path?query", uri('scheme', [], 'host', 123, 'path/path/path', 'query', [])).
test(m_apq22) :- uri_parse("scheme://host.host:123/path?query", uri('scheme', [], 'host.host', 123, 'path', 'query', [])).
test(m_apq23) :- uri_parse("scheme://host.host:123/path/path?query", uri('scheme', [], 'host.host', 123, 'path/path', 'query', [])).
test(m_apq24) :- uri_parse("scheme://host.host:123/path/path/path?query", uri('scheme', [], 'host.host', 123, 'path/path/path', 'query', [])).
test(m_apq25) :- uri_parse("scheme://123.123.123.123:123/path?query", uri('scheme', [], '123.123.123.123', 123, 'path', 'query', [])).
test(m_apq26) :- uri_parse("scheme://123.123.123.123:123/path/path?query", uri('scheme', [], '123.123.123.123', 123, 'path/path', 'query', [])).
test(m_apq27) :- uri_parse("scheme://123.123.123.123:123/path/path/path?query", uri('scheme', [], '123.123.123.123', 123, 'path/path/path', 'query', [])).
test(m_apq28) :- uri_parse("scheme://userinfo@host:123/path?query", uri('scheme', 'userinfo', 'host', 123, 'path', 'query', [])).
test(m_apq29) :- uri_parse("scheme://userinfo@host:123/path/path?query", uri('scheme', 'userinfo', 'host', 123, 'path/path', 'query', [])).
test(m_apq30) :- uri_parse("scheme://userinfo@host:123/path/path/path?query", uri('scheme', 'userinfo', 'host', 123, 'path/path/path', 'query', [])).
test(m_apq31) :- uri_parse("scheme://userinfo@host.host:123/path?query", uri('scheme', 'userinfo', 'host.host', 123, 'path', 'query', [])).
test(m_apq32) :- uri_parse("scheme://userinfo@host.host:123/path/path?query", uri('scheme', 'userinfo', 'host.host', 123, 'path/path', 'query', [])).
test(m_apq33) :- uri_parse("scheme://userinfo@host.host:123/path/path/path?query", uri('scheme', 'userinfo', 'host.host', 123, 'path/path/path', 'query', [])).
test(m_apq34) :- uri_parse("scheme://userinfo@123.123.123.123:123/path?query", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path', 'query', [])).
test(m_apq35) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path?query", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path', 'query', [])).
test(m_apq36) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path/path?query", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path/path', 'query', [])).


% SCHEME:AUTHORITY/PATH#FRAGMENT
test(m_apf1) :- uri_parse("scheme://host/path#fragment", uri('scheme', [], 'host', 80, 'path', [], 'fragment')).
test(m_apf2) :- uri_parse("scheme://host/path/path#fragment", uri('scheme', [], 'host', 80, 'path/path', [], 'fragment')).
test(m_apf3) :- uri_parse("scheme://host/path/path/path#fragment", uri('scheme', [], 'host', 80, 'path/path/path', [], 'fragment')).
test(m_apf4) :- uri_parse("scheme://host.host/path#fragment", uri('scheme', [], 'host.host', 80, 'path', [], 'fragment')).
test(m_apf5) :- uri_parse("scheme://host.host/path/path#fragment", uri('scheme', [], 'host.host', 80, 'path/path', [], 'fragment')).
test(m_apf6) :- uri_parse("scheme://host.host/path/path/path#fragment", uri('scheme', [], 'host.host', 80, 'path/path/path', [], 'fragment')).
test(m_apf7) :- uri_parse("scheme://123.123.123.123/path#fragment", uri('scheme', [], '123.123.123.123', 80, 'path', [], 'fragment')).
test(m_apf8) :- uri_parse("scheme://123.123.123.123/path/path#fragment", uri('scheme', [], '123.123.123.123', 80, 'path/path', [], 'fragment')).
test(m_apf9) :- uri_parse("scheme://123.123.123.123/path/path/path#fragment", uri('scheme', [], '123.123.123.123', 80, 'path/path/path', [], 'fragment')).
test(m_apf10) :- uri_parse("scheme://userinfo@host/path#fragment", uri('scheme', 'userinfo', 'host', 80, 'path', [], 'fragment')).
test(m_apf11) :- uri_parse("scheme://userinfo@host/path/path#fragment", uri('scheme', 'userinfo', 'host', 80, 'path/path', [], 'fragment')).
test(m_apf12) :- uri_parse("scheme://userinfo@host/path/path/path#fragment", uri('scheme', 'userinfo', 'host', 80, 'path/path/path', [], 'fragment')).
test(m_apf13) :- uri_parse("scheme://userinfo@host.host/path#fragment", uri('scheme', 'userinfo', 'host.host', 80, 'path', [], 'fragment')).
test(m_apf14) :- uri_parse("scheme://userinfo@host.host/path/path#fragment", uri('scheme', 'userinfo', 'host.host', 80, 'path/path', [], 'fragment')).
test(m_apf15) :- uri_parse("scheme://userinfo@host.host/path/path/path#fragment", uri('scheme', 'userinfo', 'host.host', 80, 'path/path/path', [], 'fragment')).
test(m_apf16) :- uri_parse("scheme://userinfo@123.123.123.123/path#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path', [], 'fragment')).
test(m_apf17) :- uri_parse("scheme://userinfo@123.123.123.123/path/path#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path', [], 'fragment')).
test(m_apf18) :- uri_parse("scheme://userinfo@123.123.123.123/path/path/path#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path/path', [], 'fragment')).
test(m_apf19) :- uri_parse("scheme://host:123/path#fragment", uri('scheme', [], 'host', 123, 'path', [], 'fragment')).
test(m_apf20) :- uri_parse("scheme://host:123/path/path#fragment", uri('scheme', [], 'host', 123, 'path/path', [], 'fragment')).
test(m_apf21) :- uri_parse("scheme://host:123/path/path/path#fragment", uri('scheme', [], 'host', 123, 'path/path/path', [], 'fragment')).
test(m_apf22) :- uri_parse("scheme://host.host:123/path#fragment", uri('scheme', [], 'host.host', 123, 'path', [], 'fragment')).
test(m_apf23) :- uri_parse("scheme://host.host:123/path/path#fragment", uri('scheme', [], 'host.host', 123, 'path/path', [], 'fragment')).
test(m_apf24) :- uri_parse("scheme://host.host:123/path/path/path#fragment", uri('scheme', [], 'host.host', 123, 'path/path/path', [], 'fragment')).
test(m_apf25) :- uri_parse("scheme://123.123.123.123:123/path#fragment", uri('scheme', [], '123.123.123.123', 123, 'path', [], 'fragment')).
test(m_apf26) :- uri_parse("scheme://123.123.123.123:123/path/path#fragment", uri('scheme', [], '123.123.123.123', 123, 'path/path', [], 'fragment')).
test(m_apf27) :- uri_parse("scheme://123.123.123.123:123/path/path/path#fragment", uri('scheme', [], '123.123.123.123', 123, 'path/path/path', [], 'fragment')).
test(m_apf28) :- uri_parse("scheme://userinfo@host:123/path#fragment", uri('scheme', 'userinfo', 'host', 123, 'path', [], 'fragment')).
test(m_apf29) :- uri_parse("scheme://userinfo@host:123/path/path#fragment", uri('scheme', 'userinfo', 'host', 123, 'path/path', [], 'fragment')).
test(m_apf30) :- uri_parse("scheme://userinfo@host:123/path/path/path#fragment", uri('scheme', 'userinfo', 'host', 123, 'path/path/path', [], 'fragment')).
test(m_apf31) :- uri_parse("scheme://userinfo@host.host:123/path#fragment", uri('scheme', 'userinfo', 'host.host', 123, 'path', [], 'fragment')).
test(m_apf32) :- uri_parse("scheme://userinfo@host.host:123/path/path#fragment", uri('scheme', 'userinfo', 'host.host', 123, 'path/path', [], 'fragment')).
test(m_apf33) :- uri_parse("scheme://userinfo@host.host:123/path/path/path#fragment", uri('scheme', 'userinfo', 'host.host', 123, 'path/path/path', [], 'fragment')).
test(m_apf34) :- uri_parse("scheme://userinfo@123.123.123.123:123/path#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path', [], 'fragment')).
test(m_apf35) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path', [], 'fragment')).
test(m_apf36) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path/path#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path/path', [], 'fragment')).


% SCHEME:AUTHORITY/PATH?QUERY#FRAGMENT
test(m_apqf1) :- uri_parse("scheme://host/path?query#fragment", uri('scheme', [], 'host', 80, 'path', 'query', 'fragment')).
test(m_apqf2) :- uri_parse("scheme://host/path/path?query#fragment", uri('scheme', [], 'host', 80, 'path/path', 'query', 'fragment')).
test(m_apqf3) :- uri_parse("scheme://host/path/path/path?query#fragment", uri('scheme', [], 'host', 80, 'path/path/path', 'query', 'fragment')).
test(m_apqf4) :- uri_parse("scheme://host.host/path?query#fragment", uri('scheme', [], 'host.host', 80, 'path', 'query', 'fragment')).
test(m_apqf5) :- uri_parse("scheme://host.host/path/path?query#fragment", uri('scheme', [], 'host.host', 80, 'path/path', 'query', 'fragment')).
test(m_apqf6) :- uri_parse("scheme://host.host/path/path/path?query#fragment", uri('scheme', [], 'host.host', 80, 'path/path/path', 'query', 'fragment')).
test(m_apqf7) :- uri_parse("scheme://123.123.123.123/path?query#fragment", uri('scheme', [], '123.123.123.123', 80, 'path', 'query', 'fragment')).
test(m_apqf8) :- uri_parse("scheme://123.123.123.123/path/path?query#fragment", uri('scheme', [], '123.123.123.123', 80, 'path/path', 'query', 'fragment')).
test(m_apqf9) :- uri_parse("scheme://123.123.123.123/path/path/path?query#fragment", uri('scheme', [], '123.123.123.123', 80, 'path/path/path', 'query', 'fragment')).
test(m_apqf10) :- uri_parse("scheme://userinfo@host/path?query#fragment", uri('scheme', 'userinfo', 'host', 80, 'path', 'query', 'fragment')).
test(m_apqf11) :- uri_parse("scheme://userinfo@host/path/path?query#fragment", uri('scheme', 'userinfo', 'host', 80, 'path/path', 'query', 'fragment')).
test(m_apqf12) :- uri_parse("scheme://userinfo@host/path/path/path?query#fragment", uri('scheme', 'userinfo', 'host', 80, 'path/path/path', 'query', 'fragment')).
test(m_apqf13) :- uri_parse("scheme://userinfo@host.host/path?query#fragment", uri('scheme', 'userinfo', 'host.host', 80, 'path', 'query', 'fragment')).
test(m_apqf14) :- uri_parse("scheme://userinfo@host.host/path/path?query#fragment", uri('scheme', 'userinfo', 'host.host', 80, 'path/path', 'query', 'fragment')).
test(m_apqf15) :- uri_parse("scheme://userinfo@host.host/path/path/path?query#fragment", uri('scheme', 'userinfo', 'host.host', 80, 'path/path/path', 'query', 'fragment')).
test(m_apqf16) :- uri_parse("scheme://userinfo@123.123.123.123/path?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path', 'query', 'fragment')).
test(m_apqf17) :- uri_parse("scheme://userinfo@123.123.123.123/path/path?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path', 'query', 'fragment')).
test(m_apqf18) :- uri_parse("scheme://userinfo@123.123.123.123/path/path/path?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 80, 'path/path/path', 'query', 'fragment')).
test(m_apqf19) :- uri_parse("scheme://host:123/path?query#fragment", uri('scheme', [], 'host', 123, 'path', 'query', 'fragment')).
test(m_apqf20) :- uri_parse("scheme://host:123/path/path?query#fragment", uri('scheme', [], 'host', 123, 'path/path', 'query', 'fragment')).
test(m_apqf21) :- uri_parse("scheme://host:123/path/path/path?query#fragment", uri('scheme', [], 'host', 123, 'path/path/path', 'query', 'fragment')).
test(m_apqf22) :- uri_parse("scheme://host.host:123/path?query#fragment", uri('scheme', [], 'host.host', 123, 'path', 'query', 'fragment')).
test(m_apqf23) :- uri_parse("scheme://host.host:123/path/path?query#fragment", uri('scheme', [], 'host.host', 123, 'path/path', 'query', 'fragment')).
test(m_apqf24) :- uri_parse("scheme://host.host:123/path/path/path?query#fragment", uri('scheme', [], 'host.host', 123, 'path/path/path', 'query', 'fragment')).
test(m_apqf25) :- uri_parse("scheme://123.123.123.123:123/path?query#fragment", uri('scheme', [], '123.123.123.123', 123, 'path', 'query', 'fragment')).
test(m_apqf26) :- uri_parse("scheme://123.123.123.123:123/path/path?query#fragment", uri('scheme', [], '123.123.123.123', 123, 'path/path', 'query', 'fragment')).
test(m_apqf27) :- uri_parse("scheme://123.123.123.123:123/path/path/path?query#fragment", uri('scheme', [], '123.123.123.123', 123, 'path/path/path', 'query', 'fragment')).
test(m_apqf28) :- uri_parse("scheme://userinfo@host:123/path?query#fragment", uri('scheme', 'userinfo', 'host', 123, 'path', 'query', 'fragment')).
test(m_apqf29) :- uri_parse("scheme://userinfo@host:123/path/path?query#fragment", uri('scheme', 'userinfo', 'host', 123, 'path/path', 'query', 'fragment')).
test(m_apqf30) :- uri_parse("scheme://userinfo@host:123/path/path/path?query#fragment", uri('scheme', 'userinfo', 'host', 123, 'path/path/path', 'query', 'fragment')).
test(m_apqf31) :- uri_parse("scheme://userinfo@host.host:123/path?query#fragment", uri('scheme', 'userinfo', 'host.host', 123, 'path', 'query', 'fragment')).
test(m_apqf32) :- uri_parse("scheme://userinfo@host.host:123/path/path?query#fragment", uri('scheme', 'userinfo', 'host.host', 123, 'path/path', 'query', 'fragment')).
test(m_apqf33) :- uri_parse("scheme://userinfo@host.host:123/path/path/path?query#fragment", uri('scheme', 'userinfo', 'host.host', 123, 'path/path/path', 'query', 'fragment')).
test(m_apqf34) :- uri_parse("scheme://userinfo@123.123.123.123:123/path?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path', 'query', 'fragment')).
test(m_apqf35) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path', 'query', 'fragment')).
test(m_apqf36) :- uri_parse("scheme://userinfo@123.123.123.123:123/path/path/path?query#fragment", uri('scheme', 'userinfo', '123.123.123.123', 123, 'path/path/path', 'query', 'fragment')).


% SPECIAL SCHEME (scheme:scheme-syntax) - CASE INSENSITIVE

% MAILTO
test(m_m1) :- uri_parse("mailto:", uri('mailto', [], [], 80, [], [], [])).
test(m_m2) :- uri_parse("MAILTO:", uri('MAILTO', [], [], 80, [], [], [])).
test(m_m3) :- uri_parse("mAiLtO:", uri('mAiLtO', [], [], 80, [], [], [])).
test(m_m4) :- uri_parse("mailto:userinfo", uri('mailto', 'userinfo', [], 80, [], [], [])).
test(m_m5) :- uri_parse("MAILTO:userinfo", uri('MAILTO', 'userinfo', [], 80, [], [], [])).
test(m_m6) :- uri_parse("mAiLtO:userinfo", uri('mAiLtO', 'userinfo', [], 80, [], [], [])).
test(m_m7) :- uri_parse("mailto:userinfo@host", uri('mailto', 'userinfo', 'host', 80, [], [], [])).
test(m_m8) :- uri_parse("MAILTO:userinfo@host", uri('MAILTO', 'userinfo', 'host', 80, [], [], [])).
test(m_m9) :- uri_parse("mAiLtO:userinfo@host", uri('mAiLtO', 'userinfo', 'host', 80, [], [], [])).
test(m_m10) :- uri_parse("mailto:userinfo@host.host", uri('mailto', 'userinfo', 'host.host', 80, [], [], [])).
test(m_m11) :- uri_parse("MAILTO:userinfo@host.host", uri('MAILTO', 'userinfo', 'host.host', 80, [], [], [])).
test(m_m12) :- uri_parse("mAiLtO:userinfo@host.host", uri('mAiLtO', 'userinfo', 'host.host', 80, [], [], [])).
test(m_m13) :- uri_parse("mailto:userinfo@123.123.123.123", uri('mailto', 'userinfo', '123.123.123.123', 80, [], [], [])).
test(m_m14) :- uri_parse("MAILTO:userinfo@123.123.123.123", uri('MAILTO', 'userinfo', '123.123.123.123', 80, [], [], [])).
test(m_m15) :- uri_parse("mAiLtO:userinfo@123.123.123.123", uri('mAiLtO', 'userinfo', '123.123.123.123', 80, [], [], [])).

% NEWS
test(m_n1) :- uri_parse("news:", uri('news', [], [], 80, [], [], [])).
test(m_n2) :- uri_parse("NEWS:", uri('NEWS', [], [], 80, [], [], [])).
test(m_n3) :- uri_parse("nEwS:", uri('nEwS', [], [], 80, [], [], [])).
test(m_n4) :- uri_parse("news:host", uri('news', [], 'host', 80, [], [], [])).
test(m_n5) :- uri_parse("NEWS:host", uri('NEWS', [], 'host', 80, [], [], [])).
test(m_n6) :- uri_parse("nEwS:host", uri('nEwS', [], 'host', 80, [], [], [])).
test(m_n7) :- uri_parse("news:host.host", uri('news', [], 'host.host', 80, [], [], [])).
test(m_n8) :- uri_parse("NEWS:host.host", uri('NEWS', [], 'host.host', 80, [], [], [])).
test(m_n9) :- uri_parse("nEwS:host.host", uri('nEwS', [], 'host.host', 80, [], [], [])).
test(m_n10) :- uri_parse("news:123.123.123.123", uri('news', [], '123.123.123.123', 80, [], [], [])).
test(m_n11) :- uri_parse("NEWS:123.123.123.123", uri('NEWS', [], '123.123.123.123', 80, [], [], [])).
test(m_n12) :- uri_parse("nEwS:123.123.123.123", uri('nEwS', [], '123.123.123.123', 80, [], [], [])).

% TEL
test(m_t1) :- uri_parse("tel:", uri('tel', [], [], 80, [], [], [])).
test(m_t2) :- uri_parse("TEL:", uri('TEL', [], [], 80, [], [], [])).
test(m_t3) :- uri_parse("tEl:", uri('tEl', [], [], 80, [], [], [])).
test(m_t4) :- uri_parse("tel:userinfo", uri('tel', 'userinfo', [], 80, [], [], [])).
test(m_t5) :- uri_parse("TEL:userinfo", uri('TEL', 'userinfo', [], 80, [], [], [])).
test(m_t6) :- uri_parse("tEl:userinfo", uri('tEl', 'userinfo', [], 80, [], [], [])).

% FAX
test(m_f1) :- uri_parse("fax:", uri('fax', [], [], 80, [], [], [])).
test(m_f2) :- uri_parse("FAX:", uri('FAX', [], [], 80, [], [], [])).
test(m_f3) :- uri_parse("fAx:", uri('fAx', [], [], 80, [], [], [])).
test(m_f4) :- uri_parse("fax:userinfo", uri('fax', 'userinfo', [], 80, [], [], [])).
test(m_f5) :- uri_parse("FAX:userinfo", uri('FAX', 'userinfo', [], 80, [], [], [])).
test(m_f6) :- uri_parse("fAx:userinfo", uri('fAx', 'userinfo', [], 80, [], [], [])).

% ZOS

% SCHEME:
test(m_zs) :- uri_parse("zos:", uri('zos', [], [], 80, [], [], [])).
test(m_zs1) :- uri_parse("ZOS:", uri('ZOS', [], [], 80, [], [], [])).
test(m_zs2) :- uri_parse("zOs:", uri('zOs', [], [], 80, [], [], [])).

% SCHEME:AUTHORITY
test(m_za1) :- uri_parse("zos://host", uri('zos', [], 'host', 80, [], [], [])).
test(m_za2) :- uri_parse("zos://host.host", uri('zos', [], 'host.host', 80, [], [], [])).
test(m_za3) :- uri_parse("zos://123.123.123.123", uri('zos', [], '123.123.123.123', 80, [], [], [])).
test(m_za4) :- uri_parse("zos://userinfo@host", uri('zos', 'userinfo', 'host', 80, [], [], [])).
test(m_za5) :- uri_parse("zos://userinfo@host.host", uri('zos', 'userinfo', 'host.host', 80, [], [], [])).
test(m_za6) :- uri_parse("zos://userinfo@123.123.123.123", uri('zos', 'userinfo', '123.123.123.123', 80, [], [], [])).
test(m_za7) :- uri_parse("zos://host:123", uri('zos', [], 'host', 123, [], [], [])).
test(m_za8) :- uri_parse("zos://host.host:123", uri('zos', [], 'host.host', 123, [], [], [])).
test(m_za9) :- uri_parse("zos://123.123.123.123:123", uri('zos', [], '123.123.123.123', 123, [], [], [])).
test(m_za10) :- uri_parse("zos://userinfo@host:123", uri('zos', 'userinfo', 'host', 123, [], [], [])).
test(m_za11) :- uri_parse("zos://userinfo@host.host:123", uri('zos', 'userinfo', 'host.host', 123, [], [], [])).
test(m_za12) :- uri_parse("zos://userinfo@123.123.123.123:123", uri('zos', 'userinfo', '123.123.123.123', 123, [], [], [])).

% SCHEME:/ZOSPATH
test(m_zp) :- uri_parse("zos:/id44", uri('zos', [], [], 80, 'id44', [], [])).
test(m_zp1) :- uri_parse("zos:/id44.1", uri('zos', [], [], 80, 'id44.1', [], [])).
test(m_zp2) :- uri_parse("zos:/id44(id81)", uri('zos', [], [], 80, 'id44(id81)', [], [])).

% SCHEME:/ZOSPATH?QUERY
test(m_zpq) :- uri_parse("zos:/id44?query", uri('zos', [], [], 80, 'id44', 'query', [])).
test(m_zpq1) :- uri_parse("zos:/id44.1?query", uri('zos', [], [], 80, 'id44.1', 'query', [])).
test(m_zpq2) :- uri_parse("zos:/id44(id81)?query", uri('zos', [], [], 80, 'id44(id81)', 'query', [])).

% SCHEME:/ZOSPATH#FRAGMENT
test(m_zpf) :- uri_parse("zos:/id44#fragment", uri('zos', [], [], 80, 'id44', [], 'fragment')).
test(m_zpf1) :- uri_parse("zos:/id44.1#fragment", uri('zos', [], [], 80, 'id44.1', [], 'fragment')).
test(m_zpf2) :- uri_parse("zos:/id44(id81)#fragment", uri('zos', [], [], 80, 'id44(id81)', [], 'fragment')).

% SCHEME:/ZOSPATH?QUERY#FRAGMENT
test(m_zpqf) :- uri_parse("zos:/id44?query#fragment", uri('zos', [], [], 80, 'id44', 'query', 'fragment')).
test(m_zpqf1) :- uri_parse("zos:/id44.1?query#fragment", uri('zos', [], [], 80, 'id44.1', 'query', 'fragment')).
test(m_zpqf2) :- uri_parse("zos:/id44(id81)?query#fragment", uri('zos', [], [], 80, 'id44(id81)', 'query', 'fragment')).

% SCHEME:AUTHORITY/ZOSPATH
test(m_zap1) :- uri_parse("zos://host/id44", uri('zos', [], 'host', 80, 'id44', [], [])).
test(m_zap2) :- uri_parse("zos://host/id44.1", uri('zos', [], 'host', 80, 'id44.1', [], [])).
test(m_zap3) :- uri_parse("zos://host/id44(id81)", uri('zos', [], 'host', 80, 'id44(id81)', [], [])).
test(m_zap4) :- uri_parse("zos://host.host/id44", uri('zos', [], 'host.host', 80, 'id44', [], [])).
test(m_zap5) :- uri_parse("zos://host.host/id44.1", uri('zos', [], 'host.host', 80, 'id44.1', [], [])).
test(m_zap6) :- uri_parse("zos://host.host/id44(id81)", uri('zos', [], 'host.host', 80, 'id44(id81)', [], [])).
test(m_zap7) :- uri_parse("zos://123.123.123.123/id44", uri('zos', [], '123.123.123.123', 80, 'id44', [], [])).
test(m_zap8) :- uri_parse("zos://123.123.123.123/id44.1", uri('zos', [], '123.123.123.123', 80, 'id44.1', [], [])).
test(m_zap9) :- uri_parse("zos://123.123.123.123/id44(id81)", uri('zos', [], '123.123.123.123', 80, 'id44(id81)', [], [])).
test(m_zap10) :- uri_parse("zos://userinfo@host/id44", uri('zos', 'userinfo', 'host', 80, 'id44', [], [])).
test(m_zap11) :- uri_parse("zos://userinfo@host/id44.1", uri('zos', 'userinfo', 'host', 80, 'id44.1', [], [])).
test(m_zap12) :- uri_parse("zos://userinfo@host/id44(id81)", uri('zos', 'userinfo', 'host', 80, 'id44(id81)', [], [])).
test(m_zap13) :- uri_parse("zos://userinfo@host.host/id44", uri('zos', 'userinfo', 'host.host', 80, 'id44', [], [])).
test(m_zap14) :- uri_parse("zos://userinfo@host.host/id44.1", uri('zos', 'userinfo', 'host.host', 80, 'id44.1', [], [])).
test(m_zap15) :- uri_parse("zos://userinfo@host.host/id44(id81)", uri('zos', 'userinfo', 'host.host', 80, 'id44(id81)', [], [])).
test(m_zap16) :- uri_parse("zos://userinfo@123.123.123.123/id44", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44', [], [])).
test(m_zap17) :- uri_parse("zos://userinfo@123.123.123.123/id44.1", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44.1', [], [])).
test(m_zap18) :- uri_parse("zos://userinfo@123.123.123.123/id44(id81)", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44(id81)', [], [])).
test(m_zap19) :- uri_parse("zos://host:123/id44", uri('zos', [], 'host', 123, 'id44', [], [])).
test(m_zap20) :- uri_parse("zos://host:123/id44.1", uri('zos', [], 'host', 123, 'id44.1', [], [])).
test(m_zap21) :- uri_parse("zos://host:123/id44(id81)", uri('zos', [], 'host', 123, 'id44(id81)', [], [])).
test(m_zap22) :- uri_parse("zos://host.host:123/id44", uri('zos', [], 'host.host', 123, 'id44', [], [])).
test(m_zap23) :- uri_parse("zos://host.host:123/id44.1", uri('zos', [], 'host.host', 123, 'id44.1', [], [])).
test(m_zap24) :- uri_parse("zos://host.host:123/id44(id81)", uri('zos', [], 'host.host', 123, 'id44(id81)', [], [])).
test(m_zap25) :- uri_parse("zos://123.123.123.123:123/id44", uri('zos', [], '123.123.123.123', 123, 'id44', [], [])).
test(m_zap26) :- uri_parse("zos://123.123.123.123:123/id44.1", uri('zos', [], '123.123.123.123', 123, 'id44.1', [], [])).
test(m_zap27) :- uri_parse("zos://123.123.123.123:123/id44(id81)", uri('zos', [], '123.123.123.123', 123, 'id44(id81)', [], [])).
test(m_zap28) :- uri_parse("zos://userinfo@host:123/id44", uri('zos', 'userinfo', 'host', 123, 'id44', [], [])).
test(m_zap29) :- uri_parse("zos://userinfo@host:123/id44.1", uri('zos', 'userinfo', 'host', 123, 'id44.1', [], [])).
test(m_zap30) :- uri_parse("zos://userinfo@host:123/id44(id81)", uri('zos', 'userinfo', 'host', 123, 'id44(id81)', [], [])).
test(m_zap31) :- uri_parse("zos://userinfo@host.host:123/id44", uri('zos', 'userinfo', 'host.host', 123, 'id44', [], [])).
test(m_zap32) :- uri_parse("zos://userinfo@host.host:123/id44.1", uri('zos', 'userinfo', 'host.host', 123, 'id44.1', [], [])).
test(m_zap33) :- uri_parse("zos://userinfo@host.host:123/id44(id81)", uri('zos', 'userinfo', 'host.host', 123, 'id44(id81)', [], [])).
test(m_zap34) :- uri_parse("zos://userinfo@123.123.123.123:123/id44", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44', [], [])).
test(m_zap35) :- uri_parse("zos://userinfo@123.123.123.123:123/id44.1", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44.1', [], [])).
test(m_zap36) :- uri_parse("zos://userinfo@123.123.123.123:123/id44(id81)", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44(id81)', [], [])).

% SCHEME:AUTHORITY/ZOSPATH?QUERY
test(m_zapq1) :- uri_parse("zos://host/id44?query", uri('zos', [], 'host', 80, 'id44', 'query', [])).
test(m_zapq2) :- uri_parse("zos://host/id44.1?query", uri('zos', [], 'host', 80, 'id44.1', 'query', [])).
test(m_zapq3) :- uri_parse("zos://host/id44(id81)?query", uri('zos', [], 'host', 80, 'id44(id81)', 'query', [])).
test(m_zapq4) :- uri_parse("zos://host.host/id44?query", uri('zos', [], 'host.host', 80, 'id44', 'query', [])).
test(m_zapq5) :- uri_parse("zos://host.host/id44.1?query", uri('zos', [], 'host.host', 80, 'id44.1', 'query', [])).
test(m_zapq6) :- uri_parse("zos://host.host/id44(id81)?query", uri('zos', [], 'host.host', 80, 'id44(id81)', 'query', [])).
test(m_zapq7) :- uri_parse("zos://123.123.123.123/id44?query", uri('zos', [], '123.123.123.123', 80, 'id44', 'query', [])).
test(m_zapq8) :- uri_parse("zos://123.123.123.123/id44.1?query", uri('zos', [], '123.123.123.123', 80, 'id44.1', 'query', [])).
test(m_zapq9) :- uri_parse("zos://123.123.123.123/id44(id81)?query", uri('zos', [], '123.123.123.123', 80, 'id44(id81)', 'query', [])).
test(m_zapq10) :- uri_parse("zos://userinfo@host/id44?query", uri('zos', 'userinfo', 'host', 80, 'id44', 'query', [])).
test(m_zapq11) :- uri_parse("zos://userinfo@host/id44.1?query", uri('zos', 'userinfo', 'host', 80, 'id44.1', 'query', [])).
test(m_zapq12) :- uri_parse("zos://userinfo@host/id44(id81)?query", uri('zos', 'userinfo', 'host', 80, 'id44(id81)', 'query', [])).
test(m_zapq13) :- uri_parse("zos://userinfo@host.host/id44?query", uri('zos', 'userinfo', 'host.host', 80, 'id44', 'query', [])).
test(m_zapq14) :- uri_parse("zos://userinfo@host.host/id44.1?query", uri('zos', 'userinfo', 'host.host', 80, 'id44.1', 'query', [])).
test(m_zapq15) :- uri_parse("zos://userinfo@host.host/id44(id81)?query", uri('zos', 'userinfo', 'host.host', 80, 'id44(id81)', 'query', [])).
test(m_zapq16) :- uri_parse("zos://userinfo@123.123.123.123/id44?query", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44', 'query', [])).
test(m_zapq17) :- uri_parse("zos://userinfo@123.123.123.123/id44.1?query", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44.1', 'query', [])).
test(m_zapq18) :- uri_parse("zos://userinfo@123.123.123.123/id44(id81)?query", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44(id81)', 'query', [])).
test(m_zapq19) :- uri_parse("zos://host:123/id44?query", uri('zos', [], 'host', 123, 'id44', 'query', [])).
test(m_zapq20) :- uri_parse("zos://host:123/id44.1?query", uri('zos', [], 'host', 123, 'id44.1', 'query', [])).
test(m_zapq21) :- uri_parse("zos://host:123/id44(id81)?query", uri('zos', [], 'host', 123, 'id44(id81)', 'query', [])).
test(m_zapq22) :- uri_parse("zos://host.host:123/id44?query", uri('zos', [], 'host.host', 123, 'id44', 'query', [])).
test(m_zapq23) :- uri_parse("zos://host.host:123/id44.1?query", uri('zos', [], 'host.host', 123, 'id44.1', 'query', [])).
test(m_zapq24) :- uri_parse("zos://host.host:123/id44(id81)?query", uri('zos', [], 'host.host', 123, 'id44(id81)', 'query', [])).
test(m_zapq25) :- uri_parse("zos://123.123.123.123:123/id44?query", uri('zos', [], '123.123.123.123', 123, 'id44', 'query', [])).
test(m_zapq26) :- uri_parse("zos://123.123.123.123:123/id44.1?query", uri('zos', [], '123.123.123.123', 123, 'id44.1', 'query', [])).
test(m_zapq27) :- uri_parse("zos://123.123.123.123:123/id44(id81)?query", uri('zos', [], '123.123.123.123', 123, 'id44(id81)', 'query', [])).
test(m_zapq28) :- uri_parse("zos://userinfo@host:123/id44?query", uri('zos', 'userinfo', 'host', 123, 'id44', 'query', [])).
test(m_zapq29) :- uri_parse("zos://userinfo@host:123/id44.1?query", uri('zos', 'userinfo', 'host', 123, 'id44.1', 'query', [])).
test(m_zapq30) :- uri_parse("zos://userinfo@host:123/id44(id81)?query", uri('zos', 'userinfo', 'host', 123, 'id44(id81)', 'query', [])).
test(m_zapq31) :- uri_parse("zos://userinfo@host.host:123/id44?query", uri('zos', 'userinfo', 'host.host', 123, 'id44', 'query', [])).
test(m_zapq32) :- uri_parse("zos://userinfo@host.host:123/id44.1?query", uri('zos', 'userinfo', 'host.host', 123, 'id44.1', 'query', [])).
test(m_zapq33) :- uri_parse("zos://userinfo@host.host:123/id44(id81)?query", uri('zos', 'userinfo', 'host.host', 123, 'id44(id81)', 'query', [])).
test(m_zapq34) :- uri_parse("zos://userinfo@123.123.123.123:123/id44?query", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44', 'query', [])).
test(m_zapq35) :- uri_parse("zos://userinfo@123.123.123.123:123/id44.1?query", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44.1', 'query', [])).
test(m_zapq36) :- uri_parse("zos://userinfo@123.123.123.123:123/id44(id81)?query", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44(id81)', 'query', [])).

% SCHEME:AUTHORITY/ZOSPATH#FRAGMENT
test(m_zapf1) :- uri_parse("zos://host/id44#fragment", uri('zos', [], 'host', 80, 'id44', [], 'fragment')).
test(m_zapf2) :- uri_parse("zos://host/id44.1#fragment", uri('zos', [], 'host', 80, 'id44.1', [], 'fragment')).
test(m_zapf3) :- uri_parse("zos://host/id44(id81)#fragment", uri('zos', [], 'host', 80, 'id44(id81)', [], 'fragment')).
test(m_zapf4) :- uri_parse("zos://host.host/id44#fragment", uri('zos', [], 'host.host', 80, 'id44', [], 'fragment')).
test(m_zapf5) :- uri_parse("zos://host.host/id44.1#fragment", uri('zos', [], 'host.host', 80, 'id44.1', [], 'fragment')).
test(m_zapf6) :- uri_parse("zos://host.host/id44(id81)#fragment", uri('zos', [], 'host.host', 80, 'id44(id81)', [], 'fragment')).
test(m_zapf7) :- uri_parse("zos://123.123.123.123/id44#fragment", uri('zos', [], '123.123.123.123', 80, 'id44', [], 'fragment')).
test(m_zapf8) :- uri_parse("zos://123.123.123.123/id44.1#fragment", uri('zos', [], '123.123.123.123', 80, 'id44.1', [], 'fragment')).
test(m_zapf9) :- uri_parse("zos://123.123.123.123/id44(id81)#fragment", uri('zos', [], '123.123.123.123', 80, 'id44(id81)', [], 'fragment')).
test(m_zapf10) :- uri_parse("zos://userinfo@host/id44#fragment", uri('zos', 'userinfo', 'host', 80, 'id44', [], 'fragment')).
test(m_zapf11) :- uri_parse("zos://userinfo@host/id44.1#fragment", uri('zos', 'userinfo', 'host', 80, 'id44.1', [], 'fragment')).
test(m_zapf12) :- uri_parse("zos://userinfo@host/id44(id81)#fragment", uri('zos', 'userinfo', 'host', 80, 'id44(id81)', [], 'fragment')).
test(m_zapf13) :- uri_parse("zos://userinfo@host.host/id44#fragment", uri('zos', 'userinfo', 'host.host', 80, 'id44', [], 'fragment')).
test(m_zapf14) :- uri_parse("zos://userinfo@host.host/id44.1#fragment", uri('zos', 'userinfo', 'host.host', 80, 'id44.1', [], 'fragment')).
test(m_zapf15) :- uri_parse("zos://userinfo@host.host/id44(id81)#fragment", uri('zos', 'userinfo', 'host.host', 80, 'id44(id81)', [], 'fragment')).
test(m_zapf16) :- uri_parse("zos://userinfo@123.123.123.123/id44#fragment", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44', [], 'fragment')).
test(m_zapf17) :- uri_parse("zos://userinfo@123.123.123.123/id44.1#fragment", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44.1', [], 'fragment')).
test(m_zapf18) :- uri_parse("zos://userinfo@123.123.123.123/id44(id81)#fragment", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44(id81)', [], 'fragment')).
test(m_zapf19) :- uri_parse("zos://host:123/id44#fragment", uri('zos', [], 'host', 123, 'id44', [], 'fragment')).
test(m_zapf20) :- uri_parse("zos://host:123/id44.1#fragment", uri('zos', [], 'host', 123, 'id44.1', [], 'fragment')).
test(m_zapf21) :- uri_parse("zos://host:123/id44(id81)#fragment", uri('zos', [], 'host', 123, 'id44(id81)', [], 'fragment')).
test(m_zapf22) :- uri_parse("zos://host.host:123/id44#fragment", uri('zos', [], 'host.host', 123, 'id44', [], 'fragment')).
test(m_zapf23) :- uri_parse("zos://host.host:123/id44.1#fragment", uri('zos', [], 'host.host', 123, 'id44.1', [], 'fragment')).
test(m_zapf24) :- uri_parse("zos://host.host:123/id44(id81)#fragment", uri('zos', [], 'host.host', 123, 'id44(id81)', [], 'fragment')).
test(m_zapf25) :- uri_parse("zos://123.123.123.123:123/id44#fragment", uri('zos', [], '123.123.123.123', 123, 'id44', [], 'fragment')).
test(m_zapf26) :- uri_parse("zos://123.123.123.123:123/id44.1#fragment", uri('zos', [], '123.123.123.123', 123, 'id44.1', [], 'fragment')).
test(m_zapf27) :- uri_parse("zos://123.123.123.123:123/id44(id81)#fragment", uri('zos', [], '123.123.123.123', 123, 'id44(id81)', [], 'fragment')).
test(m_zapf28) :- uri_parse("zos://userinfo@host:123/id44#fragment", uri('zos', 'userinfo', 'host', 123, 'id44', [], 'fragment')).
test(m_zapf29) :- uri_parse("zos://userinfo@host:123/id44.1#fragment", uri('zos', 'userinfo', 'host', 123, 'id44.1', [], 'fragment')).
test(m_zapf30) :- uri_parse("zos://userinfo@host:123/id44(id81)#fragment", uri('zos', 'userinfo', 'host', 123, 'id44(id81)', [], 'fragment')).
test(m_zapf31) :- uri_parse("zos://userinfo@host.host:123/id44#fragment", uri('zos', 'userinfo', 'host.host', 123, 'id44', [], 'fragment')).
test(m_zapf32) :- uri_parse("zos://userinfo@host.host:123/id44.1#fragment", uri('zos', 'userinfo', 'host.host', 123, 'id44.1', [], 'fragment')).
test(m_zapf33) :- uri_parse("zos://userinfo@host.host:123/id44(id81)#fragment", uri('zos', 'userinfo', 'host.host', 123, 'id44(id81)', [], 'fragment')).
test(m_zapf34) :- uri_parse("zos://userinfo@123.123.123.123:123/id44#fragment", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44', [], 'fragment')).
test(m_zapf35) :- uri_parse("zos://userinfo@123.123.123.123:123/id44.1#fragment", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44.1', [], 'fragment')).
test(m_zapf36) :- uri_parse("zos://userinfo@123.123.123.123:123/id44(id81)#fragment", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44(id81)', [], 'fragment')).

% SCHEME:AUTHORITY/ZOSPATH?QUERY#FRAGMENT
test(m_zapqf1) :- uri_parse("zos://host/id44?query#fragment", uri('zos', [], 'host', 80, 'id44', 'query', 'fragment')).
test(m_zapqf2) :- uri_parse("zos://host/id44.1?query#fragment", uri('zos', [], 'host', 80, 'id44.1', 'query', 'fragment')).
test(m_zapqf3) :- uri_parse("zos://host/id44(id81)?query#fragment", uri('zos', [], 'host', 80, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf4) :- uri_parse("zos://host.host/id44?query#fragment", uri('zos', [], 'host.host', 80, 'id44', 'query', 'fragment')).
test(m_zapqf5) :- uri_parse("zos://host.host/id44.1?query#fragment", uri('zos', [], 'host.host', 80, 'id44.1', 'query', 'fragment')).
test(m_zapqf6) :- uri_parse("zos://host.host/id44(id81)?query#fragment", uri('zos', [], 'host.host', 80, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf7) :- uri_parse("zos://123.123.123.123/id44?query#fragment", uri('zos', [], '123.123.123.123', 80, 'id44', 'query', 'fragment')).
test(m_zapqf8) :- uri_parse("zos://123.123.123.123/id44.1?query#fragment", uri('zos', [], '123.123.123.123', 80, 'id44.1', 'query', 'fragment')).
test(m_zapqf9) :- uri_parse("zos://123.123.123.123/id44(id81)?query#fragment", uri('zos', [], '123.123.123.123', 80, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf10) :- uri_parse("zos://userinfo@host/id44?query#fragment", uri('zos', 'userinfo', 'host', 80, 'id44', 'query', 'fragment')).
test(m_zapqf11) :- uri_parse("zos://userinfo@host/id44.1?query#fragment", uri('zos', 'userinfo', 'host', 80, 'id44.1', 'query', 'fragment')).
test(m_zapqf12) :- uri_parse("zos://userinfo@host/id44(id81)?query#fragment", uri('zos', 'userinfo', 'host', 80, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf13) :- uri_parse("zos://userinfo@host.host/id44?query#fragment", uri('zos', 'userinfo', 'host.host', 80, 'id44', 'query', 'fragment')).
test(m_zapqf14) :- uri_parse("zos://userinfo@host.host/id44.1?query#fragment", uri('zos', 'userinfo', 'host.host', 80, 'id44.1', 'query', 'fragment')).
test(m_zapqf15) :- uri_parse("zos://userinfo@host.host/id44(id81)?query#fragment", uri('zos', 'userinfo', 'host.host', 80, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf16) :- uri_parse("zos://userinfo@123.123.123.123/id44?query#fragment", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44', 'query', 'fragment')).
test(m_zapqf17) :- uri_parse("zos://userinfo@123.123.123.123/id44.1?query#fragment", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44.1', 'query', 'fragment')).
test(m_zapqf18) :- uri_parse("zos://userinfo@123.123.123.123/id44(id81)?query#fragment", uri('zos', 'userinfo', '123.123.123.123', 80, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf19) :- uri_parse("zos://host:123/id44?query#fragment", uri('zos', [], 'host', 123, 'id44', 'query', 'fragment')).
test(m_zapqf20) :- uri_parse("zos://host:123/id44.1?query#fragment", uri('zos', [], 'host', 123, 'id44.1', 'query', 'fragment')).
test(m_zapqf21) :- uri_parse("zos://host:123/id44(id81)?query#fragment", uri('zos', [], 'host', 123, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf22) :- uri_parse("zos://host.host:123/id44?query#fragment", uri('zos', [], 'host.host', 123, 'id44', 'query', 'fragment')).
test(m_zapqf23) :- uri_parse("zos://host.host:123/id44.1?query#fragment", uri('zos', [], 'host.host', 123, 'id44.1', 'query', 'fragment')).
test(m_zapqf24) :- uri_parse("zos://host.host:123/id44(id81)?query#fragment", uri('zos', [], 'host.host', 123, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf25) :- uri_parse("zos://123.123.123.123:123/id44?query#fragment", uri('zos', [], '123.123.123.123', 123, 'id44', 'query', 'fragment')).
test(m_zapqf26) :- uri_parse("zos://123.123.123.123:123/id44.1?query#fragment", uri('zos', [], '123.123.123.123', 123, 'id44.1', 'query', 'fragment')).
test(m_zapqf27) :- uri_parse("zos://123.123.123.123:123/id44(id81)?query#fragment", uri('zos', [], '123.123.123.123', 123, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf28) :- uri_parse("zos://userinfo@host:123/id44?query#fragment", uri('zos', 'userinfo', 'host', 123, 'id44', 'query', 'fragment')).
test(m_zapqf29) :- uri_parse("zos://userinfo@host:123/id44.1?query#fragment", uri('zos', 'userinfo', 'host', 123, 'id44.1', 'query', 'fragment')).
test(m_zapqf30) :- uri_parse("zos://userinfo@host:123/id44(id81)?query#fragment", uri('zos', 'userinfo', 'host', 123, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf31) :- uri_parse("zos://userinfo@host.host:123/id44?query#fragment", uri('zos', 'userinfo', 'host.host', 123, 'id44', 'query', 'fragment')).
test(m_zapqf32) :- uri_parse("zos://userinfo@host.host:123/id44.1?query#fragment", uri('zos', 'userinfo', 'host.host', 123, 'id44.1', 'query', 'fragment')).
test(m_zapqf33) :- uri_parse("zos://userinfo@host.host:123/id44(id81)?query#fragment", uri('zos', 'userinfo', 'host.host', 123, 'id44(id81)', 'query', 'fragment')).
test(m_zapqf34) :- uri_parse("zos://userinfo@123.123.123.123:123/id44?query#fragment", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44', 'query', 'fragment')).
test(m_zapqf35) :- uri_parse("zos://userinfo@123.123.123.123:123/id44.1?query#fragment", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44.1', 'query', 'fragment')).
test(m_zapqf36) :- uri_parse("zos://userinfo@123.123.123.123:123/id44(id81)?query#fragment", uri('zos', 'userinfo', '123.123.123.123', 123, 'id44(id81)', 'query', 'fragment')).

% ---------------------------------------------------------------

% FALSE (multichar)

test(m_f) :- \+uri_parse("scheme", _).
test(m_f1) :- \+uri_parse("scheme:?", _).
test(m_f2) :- \+uri_parse("scheme:s:", _).
test(m_f3) :- \+uri_parse("scheme:#", _).
test(m_f4) :- \+uri_parse("scheme:/?", _).
test(m_f5) :- \+uri_parse("scheme/", _).
test(m_f6) :- \+uri_parse("scheme://", _).
test(m_f7) :- \+uri_parse("scheme://host..host", _).
test(m_f8) :- \+uri_parse("scheme://123./123.123.123", _).
test(m_f9) :- \+uri_parse("scheme://userinfo@host?", _).
test(m_f10) :- \+uri_parse("scheme://userinfo@host.#host", _).
test(m_f11) :- \+uri_parse("scheme://userinfo@123.12@3.123.123", _).
test(m_f12) :- \+uri_parse("scheme://host:12:3", _).
test(m_f13) :- \+uri_parse("scheme:/host.host:123", _).
test(m_f14) :- \+uri_parse("scheme://123.123.123.123:1a3", _).
test(m_f15) :- \+uri_parse("scheme://userinfo/@host:123", _).
test(m_f16) :- \+uri_parse("scheme://userinfo?@host.host:123", _).
test(m_f17) :- \+uri_parse("scheme://userinfo#@123.123.123.123:123", _).
test(m_f18) :- \+uri_parse("scheme:/path/:p", _).
test(m_f19) :- \+uri_parse("scheme:/path/path/@p", _).
test(m_f20) :- \+uri_parse("scheme:/#", _).
test(m_f21) :- \+uri_parse("scheme:/path/path?query#", _).
test(m_f22) :- \+uri_parse("scheme:/path/#/path?query", _).
test(m_f23) :- \+uri_parse("scheme:/path/path?#fragment", _).
test(m_f24) :- \+uri_parse("scheme:/path/#/path#fragment", _).
test(m_f25) :- \+uri_parse("scheme:/path/path/path?#", _).
test(m_f26) :- \+uri_parse("scheme://userinfo@u@host/path", _).
test(m_f27) :- \+uri_parse("scheme:/path//id44", _).
test(m_f28) :- \+uri_parse("scheme://id44host.host@u:p", _).
test(m_f29) :- \+uri_parse("scheme:/?query//host.host#", _).

% SPECIAL SCHEME (scheme:scheme-syntax) - CASE INSENSITIVE

% MAILTO
test(m_f_m1) :- \+uri_parse("mailto:#", _).
test(m_f_m2) :- \+uri_parse("mailto:userinfo#", _).
test(m_f_m3) :- \+uri_parse("mailto:userinfo/@host", _).
test(m_f_m4) :- \+uri_parse("mailto:userinfo@", _).
test(m_f_m5) :- \+uri_parse("mailto:userinfo?@123.123.123.123", _).

% NEWS
test(m_f_n1) :- \+uri_parse("news:/", _).
test(m_f_n2) :- \+uri_parse("news::", _).
test(m_f_n3) :- \+uri_parse("news:host./", _).
test(m_f_n4) :- \+uri_parse("news:123.123.123.?", _).

% TEL
test(m_f_t1) :- \+uri_parse("tel://", _).
test(m_f_t2) :- \+uri_parse("tel:userinfo:", _).

% FAX
test(m_f_f1) :- \+uri_parse("fax:host.host?", _).
test(m_f_f2) :- \+uri_parse("fax:userinfo/", _).

% ZOS

% SCHEME:
test(m_f_zs1) :- \+uri_parse("zos:/", _).
test(m_f_zs2) :- \+uri_parse("zos://host.host/id44aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", _).
test(m_f_zs3) :- \+uri_parse("zos://host.host/id44aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa(id8)", _).
test(m_f_zs4) :- \+uri_parse("zos://host.host/1a", _).
test(m_f_zs5) :- \+uri_parse("zos://host.host/1a(id8)", _).
test(m_f_zs6) :- \+uri_parse("zos://host.host/1a(id8aaaaaaaa)", _).
test(m_f_zs7) :- \+uri_parse("zos://host.host/id44(1a)", _).
test(m_f_zs8) :- \+uri_parse("zos://host.host/1a()", _).
test(m_f_zs9) :- \+uri_parse("zos://host.host/(id81)", _).
test(m_f_zs10) :- \+uri_parse("zos://host.host/.a(id8)", _).
test(m_f_zs11) :- \+uri_parse("zos://host.host/id44(id8#)", _).
test(m_f_zs12) :- \+uri_parse("zos://host.host/id44.a.#(id8)", _).
test(m_f_zs13) :- \+uri_parse("zos://host.host/id44.(id8)", _).

% ---------------------------------------------------------------

% OTHER TESTS

% TEST SCHEMA
test(schema1) :- uri_parse("http://google.com", uri('http', [], 'google.com', 80, [], [], [])).
test(schema2) :- uri_parse("h11ps://google.com", uri('h11ps', [], 'google.com', 80, [], [], [])).
test(schema3) :- uri_parse("_http_://google.com", uri('_http_', [], 'google.com', 80, [], [], [])).
test(schema_1) :- \+(uri_parse("://google.com", _)).
test(schema_2) :- \+(uri_parse("@://google.com", _)).
test(schema_3) :- \+(uri_parse("h:h://google.com", _)).
test(schema_4) :- \+(uri_parse("/hh://google.com", _)).
test(schema_5) :- \+(uri_parse("h#h://google.com", _)).
test(schema_6) :- \+(uri_parse("h?h://google.com", _)).
test(schema_7) :- \+(uri_parse(":://google.com", _)).

% TEST SCHEMA MAILTO
test(mailto1) :- uri_parse("mailto:userinfo", uri('mailto', 'userinfo', [], 80, [], [], [])).
test(mailto2) :- uri_parse("mailto:userinfo@host", uri('mailto', 'userinfo', 'host', 80, [], [], [])).
test(mailto_1) :- uri_parse("mailto:", uri('mailto', [], [], 80, [], [], [])).
test(mailto_2) :- \+(uri_parse("mailto:userinfo@", _)).
test(mailto_3) :- \+(uri_parse("mailto:userinfo@host?query", _)).
test(mailto_4) :- \+(uri_parse("mailto:userinfo@host/path", _)).

% TEST SCHEMA FAX
test(fax1) :- uri_parse("fax:userinfo", uri('fax', 'userinfo', [], 80, [], [], [])).
test(fax2) :- uri_parse("fax:user123info", uri('fax', 'user123info', [], 80, [], [], [])).
test(fax_1) :- uri_parse("fax:", uri('fax', [], [], 80, [], [], [])).
test(fax_2) :- \+(uri_parse("fax:userinfo@host", _)).
test(fax_3) :- \+(uri_parse("fax:userinfo/path", _)).

% TEST SCHEMA TEL
test(tel1) :- uri_parse("tel:userinfo", uri('tel', 'userinfo', [], 80, [], [], [])).
test(tel2) :- uri_parse("tel:user123info", uri('tel', 'user123info', [], 80, [], [], [])).
test(tel3) :- uri_parse("tel:0293564242", uri('tel', '0293564242', [], 80, [], [], [])).
test(tel_1) :- uri_parse("tel:", uri('tel', [], [], 80, [], [], [])).
test(tel_2) :- \+(uri_parse("tel:userinfo@host", _)).
test(tel_3) :- \+(uri_parse("tel:userinfo/path", _)).

% TEST SCHEMA NEWS
test(news1) :- uri_parse("news:host", uri('news', [], 'host', 80, [], [], [])).
test(news2) :- uri_parse("news:host.subhost", uri('news', [], 'host.subhost', 80, [], [], [])).
test(news3) :- uri_parse("news:ho123st", uri('news', [], 'ho123st', 80, [], [], [])).
test(news_1) :- \+(uri_parse("news:ho/st", _)).
test(news_2) :- \+(uri_parse("news:host/path", _)).
test(news_3) :- \+(uri_parse("news:host/path?query", _)).
test(news_4) :- \+(uri_parse("news:host/path?query#fragment", _)).
test(news_5) :- \+(uri_parse("news:host:80", _)).
test(news_6) :- \+(uri_parse("news:userinfo@host", _)).

% TEST SCHEMA ZOS
test(zos1) :- uri_parse("zos://host/id44(id8)", uri('zos', [], 'host', 80, 'id44(id8)', [], [])).
test(zos2) :- uri_parse("zos://userinfo@host/id44(id8)", uri('zos', 'userinfo', 'host', 80, 'id44(id8)', [], [])).
test(zos3) :- uri_parse("zos://userinfo@host:4832/id44(id8)", uri('zos', 'userinfo', 'host', 4832, 'id44(id8)', [], [])).
test(zos4) :- uri_parse("zos://userinfo@host:4832/id44(id8)?query", uri('zos', 'userinfo', 'host', 4832, 'id44(id8)', 'query', [])).
test(zos5) :- uri_parse("zos://userinfo@host:4832/id44(id8)?query#fragment", uri('zos', 'userinfo', 'host', 4832, 'id44(id8)', 'query', 'fragment')).
test(zos6) :- uri_parse("zos://host/id.44(id8)", uri('zos', [], 'host', 80, 'id.44(id8)', [], [])).
test(zos7) :- uri_parse("zos://host/i.d.4.4(id8)", uri('zos', [], 'host', 80, 'i.d.4.4(id8)', [], [])).
test(zos8) :- uri_parse("zos://host/i.d.4.4", uri('zos', [], 'host', 80, 'i.d.4.4', [], [])).
test(zos_1) :- uri_parse("zos://host", uri('zos', [], 'host', 80, [], [], [])).
test(zos_2) :- \+(uri_parse("zos://host/.i.d", _)).
test(zos_3) :- \+(uri_parse("zos://host/.", _)).
test(zos_4) :- \+(uri_parse("zos://host/", _)).
test(zos_5) :- \+(uri_parse("zos://host/a012345678901234567890123456789012345678901234(id)", _)).
test(zos_6) :- \+(uri_parse("zos://host/path(a012345678)", _)).
test(zos_7) :- \+(uri_parse("zos://host/a012345678901234567890123456789012345678901234(a012345678)", _)).
test(zos_8) :- \+(uri_parse("zos://host/(id44)", _)).
test(zos_9) :- \+(uri_parse("zos://host/pi@ppo(id44)", _)).
test(zos_10) :- \+(uri_parse("zos://host/pip po(id44)", _)).
test(zos_11) :- \+(uri_parse("zos://host/pippo.mar co(id44)", _)).
test(zos_12) :- \+(uri_parse("zos://host/pippo(id.44)", _)).
test(zos_13) :- \+(uri_parse("zos://host/pippo(id .44)", _)).
test(zos_14) :- \+(uri_parse("zos://host/pippo()", _)).
test(zos_15) :- \+(uri_parse("zos://host/pippo( )", _)).
test(zos_16) :- \+(uri_parse("zos://host/pippo(", _)).
test(zos_17) :- \+(uri_parse("zos://host/pippo)", _)).
test(zos_18) :- \+(uri_parse("zos://host/id.", _)).
test(zos_19) :- \+(uri_parse("zos://host/id(1)", _)).
test(zos_20) :- \+(uri_parse("zos://host/id(1id8)", _)).


% TEST USERINFO
test(userinfo1) :- uri_parse("http://userinfo@host", uri('http', 'userinfo', 'host', 80, [], [], [])).
test(userinfo2) :- uri_parse("http://user_info@host", uri('http', 'user_info', 'host', 80, [], [], [])).
test(userinfo3) :- uri_parse("http://user123info@host", uri('http', 'user123info', 'host', 80, [], [], [])).
test(userinfo_1) :- \+(uri_parse("http://user@info@host", _)).
test(userinfo_2) :- \+(uri_parse("http://userin:fo@host", _)).
test(userinfo_3) :- \+(uri_parse("http://userin/fo@host", _)).
test(userinfo_4) :- \+(uri_parse("http://userin?fo@host", _)).
test(userinfo_5) :- \+(uri_parse("http://userin#fo@host", _)).
test(userinfo_6) :- \+(uri_parse("http://userinfo@", _)).
test(userinfo_7) :- \+(uri_parse("http://@", _)).

% TEST HOST
test(host1) :- uri_parse("scheme://host", uri('scheme', [], 'host', 80, [], [], [])).
test(host2) :- uri_parse("scheme://userinfo@host", uri('scheme', 'userinfo', 'host', 80, [], [], [])).
test(host3) :- uri_parse("scheme://host:123", uri('scheme', [], 'host', 123, [], [], [])).
test(host4) :- uri_parse("scheme://userinfo@host:123", uri('scheme', 'userinfo', 'host', 123, [], [], [])).
test(host5) :- uri_parse("scheme://host/path", uri('scheme', [], 'host', 80, 'path', [], [])).
test(host6) :- uri_parse("scheme://userinfo@host.com:123", uri('scheme', 'userinfo', 'host.com', 123, [], [], [])).
test(host_1) :- \+(uri_parse("scheme://userinfo@ho?st:123", _)).
test(host_2) :- \+(uri_parse("scheme://userinfo@ho@st:123", _)).
test(host_3) :- \+(uri_parse("scheme://userinfo@ho:st:123", _)).
test(host_4) :- \+(uri_parse("scheme://userinfo@ho/st:123", _)).
test(host_5) :- \+(uri_parse("scheme://userinfo@ho#st:123", _)).
test(host_6) :- \+(uri_parse("scheme://host..com", _)).
test(host_7) :- \+(uri_parse("scheme://host.", _)).
test(host_8) :- \+(uri_parse("scheme://host:", _)).
test(host_9) :- \+(uri_parse("scheme://host@", _)).
test(host_10) :- \+(uri_parse("scheme://host?", _)).
test(host_11) :- \+(uri_parse("scheme://host#", _)).
test(host_12) :- \+(uri_parse("scheme://.host", _)).
test(host_13) :- \+(uri_parse("scheme:///host", _)).
test(host_14) :- \+(uri_parse("scheme://@host", _)).
test(host_15) :- \+(uri_parse("scheme://:host", _)).
test(host_16) :- \+(uri_parse("scheme://?host", _)).
test(host_17) :- \+(uri_parse("scheme://#host", _)).

% TEST PORT
test(port1) :- uri_parse("scheme://host:123", uri('scheme', [], 'host', 123, [], [], [])).
test(port2) :- uri_parse("scheme://host:123/path", uri('scheme', [], 'host', 123, 'path', [], [])).
test(port3) :- uri_parse("http://host:123", uri('http', [], 'host', 123, [], [], [])).
test(port4) :- uri_parse("http://host", uri('http', [], 'host', 80, [], [], [])).
test(port5) :- uri_parse("https://host:123", uri('https', [], 'host', 123, [], [], [])).
test(port6) :- uri_parse("https://host", uri('https', [], 'host', 80, [], [], [])).
test(port_1) :- \+(uri_parse("scheme://host:1_23", _)).
test(port_2) :- \+(uri_parse("scheme://host:1a23", _)).
test(port_3) :- \+(uri_parse("scheme://host:", _)).
test(port_4) :- \+(uri_parse("scheme://host: ", _)).

% TEST PATH
test(path1) :- uri_parse("scheme://host/path", uri('scheme', [], 'host', 80, 'path', [], [])).
test(path2) :- uri_parse("scheme://host/path/prova", uri('scheme', [], 'host', 80, 'path/prova', [], [])).
test(path3) :- uri_parse("scheme://host/", uri('scheme', [], 'host', 80, [], [], [])).
test(path4) :- uri_parse("scheme://host", uri('scheme', [], 'host', 80, [], [], [])).
test(path5) :- uri_parse("scheme://host/path?query", uri('scheme', [], 'host', 80, 'path', 'query', [])).
test(path6) :- uri_parse("scheme://host/pro.va", uri('scheme', [], 'host', 80, 'pro.va', [], [])).
test(path_1) :- \+(uri_parse("scheme://host/path/", _)).
test(path_2) :- \+(uri_parse("scheme://host/p:ath", _)).
test(path_3) :- \+(uri_parse("scheme://host/p@ath", _)).
test(path_4) :- \+(uri_parse("scheme://host//path", _)).
test(path_5) :- \+(uri_parse("scheme://host/@path", _)).
test(path_6) :- \+(uri_parse("scheme://host/:path", _)).
test(path_7) :- \+(uri_parse("scheme://host/path@", _)).
test(path_8) :- \+(uri_parse("scheme://host/path:", _)).
test(path_9) :- \+(uri_parse("scheme://host/path//com", _)).

% TEST QUERY
test(query1) :- uri_parse("scheme://host/?query", uri('scheme', [], 'host', 80, [], 'query', [])).
test(query2) :- uri_parse("scheme://host/?qu.ery", uri('scheme', [], 'host', 80, [], 'qu.ery', [])).
test(query3) :- uri_parse("scheme://host/?qu:ery", uri('scheme', [], 'host', 80, [], 'qu:ery', [])).
test(query4) :- uri_parse("scheme://host/?qu@ery", uri('scheme', [], 'host', 80, [], 'qu@ery', [])).
test(query5) :- uri_parse("scheme://host/?qu/ery", uri('scheme', [], 'host', 80, [], 'qu/ery', [])).
test(query6) :- uri_parse("scheme://host/?qu?ery", uri('scheme', [], 'host', 80, [], 'qu?ery', [])).
test(query7) :- uri_parse("scheme://host", uri('scheme', [], 'host', 80, [], [], [])).
test(query8) :- uri_parse("scheme://host/", uri('scheme', [], 'host', 80, [], [], [])).
test(query9) :- uri_parse("scheme://host/path?query#fragment", uri('scheme', [], 'host', 80, 'path', 'query', 'fragment')).
test(query_1) :- \+(uri_parse("scheme://host/?", _)).
test(query_2) :- \+(uri_parse("scheme://host/?#", _)).
test(query_3) :- \+(uri_parse("scheme://host?query", _)).

% TEST FRAGMENT
test(fragment1) :- uri_parse("scheme://host/#frag", uri('scheme', [], 'host', 80, [], [], 'frag')).
test(fragment2) :- uri_parse("scheme://host/path?query#frag", uri('scheme', [], 'host', 80, 'path', 'query', 'frag')).
test(fragment3) :- uri_parse("scheme://host/?query#frag", uri('scheme', [], 'host', 80, [], 'query', 'frag')).
test(fragment4) :- uri_parse("scheme://host", uri('scheme', [], 'host', 80, [], [], [])).
test(fragment_1) :- \+(uri_parse("scheme://host/#", _)).
test(fragment_2) :- \+(uri_parse("scheme://host#", _)).

% TEST INTEGRATION ---- PRIMO TIPO DI URI (CON AUTHORITY)
test(primoTipo1) :- uri_parse("http://userinfo@host.subhost:123/path/subpath?query#fragment", uri('http', 'userinfo', 'host.subhost', 123, 'path/subpath', 'query', 'fragment')).
test(primoTipo2) :- uri_parse("http://userinfo@host.subhost:123/path/subpath?query", uri('http', 'userinfo', 'host.subhost', 123, 'path/subpath', 'query', [])).
test(primoTipo3) :- uri_parse("http://userinfo@host.subhost:123/path/subpath#fragment", uri('http', 'userinfo', 'host.subhost', 123, 'path/subpath', [], 'fragment')).
test(primoTIpo4) :- uri_parse("http://userinfo@host.subhost:123/path/subpath", uri('http', 'userinfo', 'host.subhost', 123, 'path/subpath', [], [])).
test(primoTipo5) :- uri_parse("http://userinfo@host.subhost:123/path?query#fragment", uri('http', 'userinfo', 'host.subhost', 123, 'path', 'query', 'fragment')).
test(primoTipo6) :- uri_parse("http://userinfo@host.subhost:123/path?query", uri('http', 'userinfo', 'host.subhost', 123, 'path', 'query', [])).
test(primoTipo7) :- uri_parse("http://userinfo@host.subhost:123/path#fragment", uri('http', 'userinfo', 'host.subhost', 123, 'path', [], 'fragment')).
test(primoTipo8) :- uri_parse("http://userinfo@host.subhost:123/path", uri('http', 'userinfo', 'host.subhost', 123, 'path', [], [])).
test(primoTipo9) :- uri_parse("http://userinfo@host.subhost:123/?query#fragment", uri('http', 'userinfo', 'host.subhost', 123, [], 'query', 'fragment')).
test(primoTipo10) :- uri_parse("http://userinfo@host.subhost:123/?query", uri('http', 'userinfo', 'host.subhost', 123, [], 'query', [])).
test(primoTipo11) :- uri_parse("http://userinfo@host.subhost:123/#fragment", uri('http', 'userinfo', 'host.subhost', 123, [], [], 'fragment')).
test(primoTipo12) :- uri_parse("http://userinfo@host.subhost:123/", uri('http', 'userinfo', 'host.subhost', 123, [], [], [])).
test(primoTipo13) :- uri_parse("http://userinfo@host.subhost:123", uri('http', 'userinfo', 'host.subhost', 123, [], [], [])).

test(primoTipo14) :- uri_parse("http://userinfo@host.subhost/path/subpath?query#fragment", uri('http', 'userinfo', 'host.subhost', 80, 'path/subpath', 'query', 'fragment')).
test(primoTipo15) :- uri_parse("http://userinfo@host.subhost/path/subpath?query", uri('http', 'userinfo', 'host.subhost', 80, 'path/subpath', 'query', [])).
test(primoTipo16) :- uri_parse("http://userinfo@host.subhost/path/subpath#fragment", uri('http', 'userinfo', 'host.subhost', 80, 'path/subpath', [], 'fragment')).
test(primoTIpo17) :- uri_parse("http://userinfo@host.subhost/path/subpath", uri('http', 'userinfo', 'host.subhost', 80, 'path/subpath', [], [])).
test(primoTipo18) :- uri_parse("http://userinfo@host.subhost/path?query#fragment", uri('http', 'userinfo', 'host.subhost', 80, 'path', 'query', 'fragment')).
test(primoTipo19) :- uri_parse("http://userinfo@host.subhost/path?query", uri('http', 'userinfo', 'host.subhost', 80, 'path', 'query', [])).
test(primoTipo20) :- uri_parse("http://userinfo@host.subhost/path#fragment", uri('http', 'userinfo', 'host.subhost', 80, 'path', [], 'fragment')).
test(primoTipo21) :- uri_parse("http://userinfo@host.subhost/path", uri('http', 'userinfo', 'host.subhost', 80, 'path', [], [])).
test(primoTipo22) :- uri_parse("http://userinfo@host.subhost/?query#fragment", uri('http', 'userinfo', 'host.subhost', 80, [], 'query', 'fragment')).
test(primoTipo23) :- uri_parse("http://userinfo@host.subhost/?query", uri('http', 'userinfo', 'host.subhost', 80, [], 'query', [])).
test(primoTipo24) :- uri_parse("http://userinfo@host.subhost/#fragment", uri('http', 'userinfo', 'host.subhost', 80, [], [], 'fragment')).
test(primoTipo25) :- uri_parse("http://userinfo@host.subhost/", uri('http', 'userinfo', 'host.subhost', 80, [], [], [])).
test(primoTipo26) :- uri_parse("http://userinfo@host.subhost", uri('http', 'userinfo', 'host.subhost', 80, [], [], [])).

test(primoTipo27) :- uri_parse("http://host.subhost:123/path/subpath?query#fragment", uri('http', [], 'host.subhost', 123, 'path/subpath', 'query', 'fragment')).
test(primoTipo28) :- uri_parse("http://host.subhost:123/path/subpath?query", uri('http', [], 'host.subhost', 123, 'path/subpath', 'query', [])).
test(primoTipo29) :- uri_parse("http://host.subhost:123/path/subpath#fragment", uri('http', [], 'host.subhost', 123, 'path/subpath', [], 'fragment')).
test(primoTIpo30) :- uri_parse("http://host.subhost:123/path/subpath", uri('http', [], 'host.subhost', 123, 'path/subpath', [], [])).
test(primoTipo31) :- uri_parse("http://host.subhost:123/path?query#fragment", uri('http', [], 'host.subhost', 123, 'path', 'query', 'fragment')).
test(primoTipo32) :- uri_parse("http://host.subhost:123/path?query", uri('http', [], 'host.subhost', 123, 'path', 'query', [])).
test(primoTipo33) :- uri_parse("http://host.subhost:123/path#fragment", uri('http', [], 'host.subhost', 123, 'path', [], 'fragment')).
test(primoTipo34) :- uri_parse("http://host.subhost:123/path", uri('http', [], 'host.subhost', 123, 'path', [], [])).
test(primoTipo35) :- uri_parse("http://host.subhost:123/?query#fragment", uri('http', [], 'host.subhost', 123, [], 'query', 'fragment')).
test(primoTipo36) :- uri_parse("http://host.subhost:123/?query", uri('http', [], 'host.subhost', 123, [], 'query', [])).
test(primoTipo37) :- uri_parse("http://host.subhost:123/#fragment", uri('http', [], 'host.subhost', 123, [], [], 'fragment')).
test(primoTipo38) :- uri_parse("http://host.subhost:123/", uri('http', [], 'host.subhost', 123, [], [], [])).
test(primoTipo39) :- uri_parse("http://host.subhost:123", uri('http', [], 'host.subhost', 123, [], [], [])).

test(primoTipo40) :- uri_parse("http://host.subhost/path/subpath?query#fragment", uri('http', [], 'host.subhost', 80, 'path/subpath', 'query', 'fragment')).
test(primoTipo41) :- uri_parse("http://host.subhost/path/subpath?query", uri('http', [], 'host.subhost', 80, 'path/subpath', 'query', [])).
test(primoTipo42) :- uri_parse("http://host.subhost/path/subpath#fragment", uri('http', [], 'host.subhost', 80, 'path/subpath', [], 'fragment')).
test(primoTIpo43) :- uri_parse("http://host.subhost/path/subpath", uri('http', [], 'host.subhost', 80, 'path/subpath', [], [])).
test(primoTipo44) :- uri_parse("http://host.subhost/path?query#fragment", uri('http', [], 'host.subhost', 80, 'path', 'query', 'fragment')).
test(primoTipo45) :- uri_parse("http://host.subhost/path?query", uri('http', [], 'host.subhost', 80, 'path', 'query', [])).
test(primoTipo46) :- uri_parse("http://host.subhost/path#fragment", uri('http', [], 'host.subhost', 80, 'path', [], 'fragment')).
test(primoTipo47) :- uri_parse("http://host.subhost/path", uri('http', [], 'host.subhost', 80, 'path', [], [])).
test(primoTipo48) :- uri_parse("http://host.subhost/?query#fragment", uri('http', [], 'host.subhost', 80, [], 'query', 'fragment')).
test(primoTipo49) :- uri_parse("http://host.subhost/?query", uri('http', [], 'host.subhost', 80, [], 'query', [])).
test(primoTipo50) :- uri_parse("http://host.subhost/#fragment", uri('http', [], 'host.subhost', 80, [], [], 'fragment')).
test(primoTipo51) :- uri_parse("http://host.subhost/", uri('http', [], 'host.subhost', 80, [], [], [])).
test(primoTipo52) :- uri_parse("http://host.subhost", uri('http', [], 'host.subhost', 80, [], [], [])).

test(primoTipo53) :- uri_parse("http://userinfo@host:123/path/subpath?query#fragment", uri('http', 'userinfo', 'host', 123, 'path/subpath', 'query', 'fragment')).
test(primoTipo54) :- uri_parse("http://userinfo@host:123/path/subpath?query", uri('http', 'userinfo', 'host', 123, 'path/subpath', 'query', [])).
test(primoTipo55) :- uri_parse("http://userinfo@host:123/path/subpath#fragment", uri('http', 'userinfo', 'host', 123, 'path/subpath', [], 'fragment')).
test(primoTIpo56) :- uri_parse("http://userinfo@host:123/path/subpath", uri('http', 'userinfo', 'host', 123, 'path/subpath', [], [])).
test(primoTipo57) :- uri_parse("http://userinfo@host:123/path?query#fragment", uri('http', 'userinfo', 'host', 123, 'path', 'query', 'fragment')).
test(primoTipo58) :- uri_parse("http://userinfo@host:123/path?query", uri('http', 'userinfo', 'host', 123, 'path', 'query', [])).
test(primoTipo59) :- uri_parse("http://userinfo@host:123/path#fragment", uri('http', 'userinfo', 'host', 123, 'path', [], 'fragment')).
test(primoTipo60) :- uri_parse("http://userinfo@host:123/path", uri('http', 'userinfo', 'host', 123, 'path', [], [])).
test(primoTipo61) :- uri_parse("http://userinfo@host:123/?query#fragment", uri('http', 'userinfo', 'host', 123, [], 'query', 'fragment')).
test(primoTipo62) :- uri_parse("http://userinfo@host:123/?query", uri('http', 'userinfo', 'host', 123, [], 'query', [])).
test(primoTipo63) :- uri_parse("http://userinfo@host:123/#fragment", uri('http', 'userinfo', 'host', 123, [], [], 'fragment')).
test(primoTipo64) :- uri_parse("http://userinfo@host:123/", uri('http', 'userinfo', 'host', 123, [], [], [])).
test(primoTipo65) :- uri_parse("http://userinfo@host:123", uri('http', 'userinfo', 'host', 123, [], [], [])).

test(primoTipo66) :- uri_parse("http://userinfo@host/path/subpath?query#fragment", uri('http', 'userinfo', 'host', 80, 'path/subpath', 'query', 'fragment')).
test(primoTipo67) :- uri_parse("http://userinfo@host/path/subpath?query", uri('http', 'userinfo', 'host', 80, 'path/subpath', 'query', [])).
test(primoTipo68) :- uri_parse("http://userinfo@host/path/subpath#fragment", uri('http', 'userinfo', 'host', 80, 'path/subpath', [], 'fragment')).
test(primoTIpo69) :- uri_parse("http://userinfo@host/path/subpath", uri('http', 'userinfo', 'host', 80, 'path/subpath', [], [])).
test(primoTipo70) :- uri_parse("http://userinfo@host/path?query#fragment", uri('http', 'userinfo', 'host', 80, 'path', 'query', 'fragment')).
test(primoTipo71) :- uri_parse("http://userinfo@host/path?query", uri('http', 'userinfo', 'host', 80, 'path', 'query', [])).
test(primoTipo72) :- uri_parse("http://userinfo@host/path#fragment", uri('http', 'userinfo', 'host', 80, 'path', [], 'fragment')).
test(primoTipo73) :- uri_parse("http://userinfo@host/path", uri('http', 'userinfo', 'host', 80, 'path', [], [])).
test(primoTipo74) :- uri_parse("http://userinfo@host/?query#fragment", uri('http', 'userinfo', 'host', 80, [], 'query', 'fragment')).
test(primoTipo75) :- uri_parse("http://userinfo@host/?query", uri('http', 'userinfo', 'host', 80, [], 'query', [])).
test(primoTipo76) :- uri_parse("http://userinfo@host/#fragment", uri('http', 'userinfo', 'host', 80, [], [], 'fragment')).
test(primoTipo77) :- uri_parse("http://userinfo@host/", uri('http', 'userinfo', 'host', 80, [], [], [])).
test(primoTipo78) :- uri_parse("http://userinfo@host", uri('http', 'userinfo', 'host', 80, [], [], [])).

test(primoTipo79) :- uri_parse("http://host:123/path/subpath?query#fragment", uri('http', [], 'host', 123, 'path/subpath', 'query', 'fragment')).
test(primoTipo80) :- uri_parse("http://host:123/path/subpath?query", uri('http', [], 'host', 123, 'path/subpath', 'query', [])).
test(primoTipo81) :- uri_parse("http://host:123/path/subpath#fragment", uri('http', [], 'host', 123, 'path/subpath', [], 'fragment')).
test(primoTIpo82) :- uri_parse("http://host:123/path/subpath", uri('http', [], 'host', 123, 'path/subpath', [], [])).
test(primoTipo83) :- uri_parse("http://host:123/path?query#fragment", uri('http', [], 'host', 123, 'path', 'query', 'fragment')).
test(primoTipo84) :- uri_parse("http://host:123/path?query", uri('http', [], 'host', 123, 'path', 'query', [])).
test(primoTipo85) :- uri_parse("http://host:123/path#fragment", uri('http', [], 'host', 123, 'path', [], 'fragment')).
test(primoTipo86) :- uri_parse("http://host:123/path", uri('http', [], 'host', 123, 'path', [], [])).
test(primoTipo87) :- uri_parse("http://host:123/?query#fragment", uri('http', [], 'host', 123, [], 'query', 'fragment')).
test(primoTipo88) :- uri_parse("http://host:123/?query", uri('http', [], 'host', 123, [], 'query', [])).
test(primoTipo89) :- uri_parse("http://host:123/#fragment", uri('http', [], 'host', 123, [], [], 'fragment')).
test(primoTipo90) :- uri_parse("http://host:123/", uri('http', [], 'host', 123, [], [], [])).
test(primoTipo91) :- uri_parse("http://host:123", uri('http', [], 'host', 123, [], [], [])).

test(primoTipo92) :- uri_parse("http://host/path/subpath?query#fragment", uri('http', [], 'host', 80, 'path/subpath', 'query', 'fragment')).
test(primoTipo93) :- uri_parse("http://host/path/subpath?query", uri('http', [], 'host', 80, 'path/subpath', 'query', [])).
test(primoTipo94) :- uri_parse("http://host/path/subpath#fragment", uri('http', [], 'host', 80, 'path/subpath', [], 'fragment')).
test(primoTIpo95) :- uri_parse("http://host/path/subpath", uri('http', [], 'host', 80, 'path/subpath', [], [])).
test(primoTipo96) :- uri_parse("http://host/path?query#fragment", uri('http', [], 'host', 80, 'path', 'query', 'fragment')).
test(primoTipo97) :- uri_parse("http://host/path?query", uri('http', [], 'host', 80, 'path', 'query', [])).
test(primoTipo98) :- uri_parse("http://host/path#fragment", uri('http', [], 'host', 80, 'path', [], 'fragment')).
test(primoTipo99) :- uri_parse("http://host/path", uri('http', [], 'host', 80, 'path', [], [])).
test(primoTipo100) :- uri_parse("http://host/?query#fragment", uri('http', [], 'host', 80, [], 'query', 'fragment')).
test(primoTipo101) :- uri_parse("http://host/?query", uri('http', [], 'host', 80, [], 'query', [])).
test(primoTipo102) :- uri_parse("http://host/#fragment", uri('http', [], 'host', 80, [], [], 'fragment')).
test(primoTipo103) :- uri_parse("http://host/", uri('http', [], 'host', 80, [], [], [])).
test(primoTipo104) :- uri_parse("http://host", uri('http', [], 'host', 80, [], [], [])).

test(primoTIpo_1) :- \+(uri_parse("http://", _)).
test(primoTipo_2) :- \+(uri_parse("http:///path/subpath?query#fragment", _)).
test(primoTipo_3) :- \+(uri_parse("http:///path/subpath?query", _)).
test(primoTipo_4) :- \+(uri_parse("http:///path/subpath#fragment", _)).
test(primoTIpo_5) :- \+(uri_parse("http:///path/subpath", _)).
test(primoTipo_6) :- \+(uri_parse("http:///path?query#fragment", _)).
test(primoTipo_7) :- \+(uri_parse("http:///path?query", _)).
test(primoTipo_8) :- \+(uri_parse("http:///path#fragment", _)).
test(primoTipo_9) :- \+(uri_parse("http:///path", _)).
test(primoTipo_10) :- \+(uri_parse("http:///?query#fragment", _)).
test(primoTipo_11) :- \+(uri_parse("http:///?query", _)).
test(primoTipo_12) :- \+(uri_parse("http:///#fragment", _)).
test(primoTipo_13) :- \+(uri_parse("http:///", _)).
test(primoTipo_14) :- \+(uri_parse("http://", _)).
test(primoTipo_15) :- \+(uri_parse("http://host?query#fragment", _)).
test(primoTipo_16) :- \+(uri_parse("http://host?query", _)).
test(primoTipo_17) :- \+(uri_parse("http://host#fragment", _)).
test(primoTipo_18) :- \+(uri_parse("://host/path/subpath?query#fragment", _)).
test(primoTipo_19) :- \+(uri_parse("://host/path/subpath?query", _)).
test(primoTipo_20) :- \+(uri_parse("://host/path/subpath#fragment", _)).
test(primoTIpo_21) :- \+(uri_parse("://host/path/subpath", _)).
test(primoTipo_22) :- \+(uri_parse("://host/path?query#fragment", _)).
test(primoTipo_23) :- \+(uri_parse("://host/path?query", _)).
test(primoTipo_24) :- \+(uri_parse("://host/path#fragment", _)).
test(primoTipo_25) :- \+(uri_parse("://host/path", _)).
test(primoTipo_26) :- \+(uri_parse("://host/?query#fragment", _)).
test(primoTipo_27) :- \+(uri_parse("://host/?query", _)).
test(primoTipo_28) :- \+(uri_parse("://host/#fragment", _)).
test(primoTipo_29) :- \+(uri_parse("://host/", _)).
test(primoTipo_30) :- \+(uri_parse("://host", _)).
test(primoTipo_31) :- \+(uri_parse("http//host/path/subpath?query#fragment", _)).
test(primoTipo_32) :- \+(uri_parse("http//host/path/subpath?query", _)).
test(primoTipo_33) :- \+(uri_parse("http//host/path/subpath#fragment", _)).
test(primoTIpo_34) :- \+(uri_parse("http//host/path/subpath", _)).
test(primoTipo_35) :- \+(uri_parse("http//host/path?query#fragment", _)).
test(primoTipo_36) :- \+(uri_parse("http//host/path?query", _)).
test(primoTipo_37) :- \+(uri_parse("http//host/path#fragment", _)).
test(primoTipo_38) :- \+(uri_parse("http//host/path", _)).
test(primoTipo_39) :- \+(uri_parse("http//host/?query#fragment", _)).
test(primoTipo_40) :- \+(uri_parse("http//host/?query", _)).
test(primoTipo_41) :- \+(uri_parse("http//host/#fragment", _)).
test(primoTipo_42) :- \+(uri_parse("http//host/", _)).
test(primoTipo_43) :- \+(uri_parse("http//host", _)).




% INTEGRATION TEST ---- secondo tipo di uri (senza authority)

test(secondoTipo1) :- uri_parse("http:/path/subpath?query#fragment", uri('http', [], [], 80, 'path/subpath', 'query', 'fragment')).
test(secondoTipo2) :- uri_parse("http:/path/subpath?query", uri('http', [], [], 80, 'path/subpath', 'query', [])).
test(secondoTipo3) :- uri_parse("http:/path/subpath#fragment", uri('http', [], [], 80, 'path/subpath', [], 'fragment')).
test(secondoTipo4) :- uri_parse("http:/path/subpath", uri('http', [], [], 80, 'path/subpath', [], [])).
test(secondoTipo5) :- uri_parse("http:/path?query#fragment", uri('http', [], [], 80, 'path', 'query', 'fragment')).
test(secondoTipo6) :- uri_parse("http:/path?query", uri('http', [], [], 80, 'path', 'query', [])).
test(secondoTipo7) :- uri_parse("http:/path#fragment", uri('http', [], [], 80, 'path', [], 'fragment')).
test(secondoTipo8) :- uri_parse("http:/path", uri('http', [], [], 80, 'path', [], [])).
test(secondoTipo9) :- uri_parse("http:/?query#fragment", uri('http', [], [], 80, [], 'query', 'fragment')).
test(secondoTipo10) :- uri_parse("http:/#fragment", uri('http', [], [], 80, [], [], 'fragment')).
test(secondoTipo11) :- uri_parse("http:/?query", uri('http', [], [], 80, [], 'query', [])).
test(secondoTipo12) :- uri_parse("http:/", uri('http', [], [], 80, [], [], [])).

% elementi presenti senza lo /
test(secondoTipo13) :- \+uri_parse("http:path/subpath?query#fragment", _).
test(secondoTipo14) :- \+uri_parse("http:path/subpath?query", _).
test(secondoTipo15) :- \+uri_parse("http:path/subpath#fragment", _).
test(secondoTipo16) :- \+uri_parse("http:path/subpath", _).
test(secondoTipo17) :- \+uri_parse("http:path?query#fragment", _).
test(secondoTipo18) :- \+uri_parse("http:path?query", _).
test(secondoTipo19) :- \+uri_parse("http:path#fragment", _).
test(secondoTipo20) :- \+uri_parse("http:path", _).
test(secondoTipo21) :- \+uri_parse("http:?query#fragment", _).
test(secondoTipo22) :- \+uri_parse("http:#fragment", _).
test(secondoTipo23) :- \+uri_parse("http:?query", _).
test(secondoTipo24) :- uri_parse("http:", uri('http', [], [], 80, [], [], [])).

test(secondoTipo_1) :- \+(uri_parse("http/path/subpath?query#fragment", _)).
test(secondoTipo_2) :- \+(uri_parse("http/path/subpath?query", _)).
test(secondoTipo_3) :- \+(uri_parse("http/path/subpath#fragment", _)).
test(secondoTipo_4) :- \+(uri_parse("http/path/subpath", _)).
test(secondoTipo_5) :- \+(uri_parse("http/path?query#fragment", _)).
test(secondoTipo_6) :- \+(uri_parse("http/path?query", _)).
test(secondoTipo_7) :- \+(uri_parse("http/path#fragment", _)).
test(secondoTipo_8) :- \+(uri_parse("http/path", _)).
test(secondoTipo_9) :- \+(uri_parse("http/?query#fragment", _)).
test(secondoTipo_10) :- \+(uri_parse("http/#fragment", _)).
test(secondoTipo_11) :- \+(uri_parse("http/?query", _)).
test(secondoTipo_12) :- \+(uri_parse("http/", _)).

test(secondoTipo_13) :- \+(uri_parse("httppath/subpath?query#fragment", _)).
test(secondoTipo_14) :- \+(uri_parse("httppath/subpath?query", _)).
test(secondoTipo_15) :- \+(uri_parse("httppath/subpath#fragment", _)).
test(secondoTipo_16) :- \+(uri_parse("httppath/subpath", _)).
test(secondoTipo_17) :- \+(uri_parse("httppath?query#fragment", _)).
test(secondoTipo_18) :- \+(uri_parse("httppath?query", _)).
test(secondoTipo_19) :- \+(uri_parse("httppath#fragment", _)).
test(secondoTipo_20) :- \+(uri_parse("httppath", _)).
test(secondoTipo_21) :- \+(uri_parse("http?query#fragment", _)).
test(secondoTipo_22) :- \+(uri_parse("http#fragment", _)).
test(secondoTipo_23) :- \+(uri_parse("http?query", _)).
test(secondoTipo_24) :- \+(uri_parse("http", _)).

test(secondoTipo_25) :- \+(uri_parse(":/path/subpath?query#fragment", _)).
test(secondoTipo_26) :- \+(uri_parse(":/path/subpath?query", _)).
test(secondoTipo_27) :- \+(uri_parse(":/path/subpath#fragment", _)).
test(secondoTipo_28) :- \+(uri_parse(":/path/subpath", _)).
test(secondoTipo_29) :- \+(uri_parse(":/path?query#fragment", _)).
test(secondoTipo_30) :- \+(uri_parse(":/path?query", _)).
test(secondoTipo_31) :- \+(uri_parse(":/path#fragment", _)).
test(secondoTipo_32) :- \+(uri_parse(":/path", _)).
test(secondoTipo_33) :- \+(uri_parse(":/?query#fragment", _)).
test(secondoTipo_34) :- \+(uri_parse(":/#fragment", _)).
test(secondoTipo_35) :- \+(uri_parse(":/?query", _)).
test(secondoTipo_36) :- \+(uri_parse(":/", _)).

test(secondoTipo_37) :- \+(uri_parse(":path/subpath?query#fragment", _)).
test(secondoTipo_38) :- \+(uri_parse(":path/subpath?query", _)).
test(secondoTipo_39) :- \+(uri_parse(":path/subpath#fragment", _)).
test(secondoTipo_40) :- \+(uri_parse(":path/subpath", _)).
test(secondoTipo_41) :- \+(uri_parse(":path?query#fragment", _)).
test(secondoTipo_42) :- \+(uri_parse(":path?query", _)).
test(secondoTipo_43) :- \+(uri_parse(":path#fragment", _)).
test(secondoTipo_44) :- \+(uri_parse(":path", _)).
test(secondoTipo_45) :- \+(uri_parse(":?query#fragment", _)).
test(secondoTipo_46) :- \+(uri_parse(":#fragment", _)).
test(secondoTipo_47) :- \+(uri_parse(":?query", _)).
test(secondoTipo_48) :- \+(uri_parse(":", _)).

:- end_tests(uri_parse).