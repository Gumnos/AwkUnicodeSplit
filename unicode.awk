function unicollapse(a, _c, _i, _len, _index, _building) {
    _building = 0
    for (_len=_index=1; _index <= length(a); _index++) {
        _c = a[_index]
        _i = c2a[_c]
        if (and(_i, 128)) {
            _building = 1
            if (and(_i, 128+64) == 128)
                a[_len] = a[_len] _c
        } else {
            if (_building) {
                _building = 0
                ++_len
            }
            a[_len++] = _c
        }
    }
    while (_index >= _len)
        delete a[_index--]
}

BEGIN {
    for (i=0; i<256; i++)
        c2a[sprintf("%c", i)] = i
}

{
    split($0, a, //)
    print "Length before:", length(a)
    unicollapse(a)
    print "Length after:", length(a)
    for (i = 1; i<=length(a); i++) print i, a[i]
}
