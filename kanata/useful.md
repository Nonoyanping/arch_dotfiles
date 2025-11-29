There is a variant of tap-dance with the name tap-dance-eager. The variant is parsed identically but the difference is that it will activate every action in the sequence as the taps progress.

In the example below, repeated taps will, in order:

1. type a
2. erase the a and type bb
3. erase the bb and type ccc

```lisp
(defalias
  td2 (tap-dance-eager 500 (
    (macro a) ;; use macro to prevent auto-repeat of the key
    (macro bspc b b)
    (macro bspc bspc c c c)
  ))
)
```
