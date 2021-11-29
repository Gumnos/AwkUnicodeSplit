# AwkUnicodeSplit
An awk(1) fragment for reassembling Unicode characters after a split()

When invoking `split(s, a, //)`
on UTF-8 data
in One True `awk`,
it will divide up Unicode codepoints
into their constituent UTF-8 bytes.
However, sometimes you want to keep the codepoints together.

Passing the resulting array `a`
to the `unicollapse()` function
will reassemble the Unicode codepoints
and collapse the consolidated bytes
out of the array.

The example invocation in the source

    {
        split($0, a, //)
        print "Length before:", length(a)
        unicollapse(a)
        print "Length after:", length(a)
        for (i = 1; i<=length(a); i++) print i, a[i]
    }

can be tested at the shell with

    $ echo 'Test 💩' | ./unicode.awk

This splits the line into bytes,
prints the number of bytes,
then reassembles it into codepoints,
prints the resulting (shorter) length,
and prints each character/codepoint
in the resulting split.
