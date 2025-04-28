# This file is a part of AstroLib.jl. License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

"""
    jdcnv(date) -> julian_days

### Purpose ###

Convert proleptic Gregorian Calendar date in UTC standard to number of Julian
days.

### Explanation ###

Takes the given proleptic Gregorian date in UTC standard and returns the number
of Julian calendar days since epoch `-4713-11-24T12:00:00`.

### Argument ###

* `date`: date in proleptic Gregorian Calendar.  Can be either a single date or
  an array of dates.  Each element can be either a `DateTime` type or anything
  that can be converted directly to `DateTime`.  In the case of vectorial input,
  each element is considered as a date, so you cannot provide a date by parts.

### Output ###

Number of Julian days, as a floating point.

### Example ###

Find the Julian days number at 2016 August 23, 03:39:06.

``` julia
jdcnv(DateTime(2016, 08, 23, 03, 39, 06))
# => 2.4576236521527776e6
jdcnv(2016, 08, 23, 03, 39, 06)
# => 2.4576236521527776e6
jdcnv("2016-08-23T03:39:06")
# => 2.4576236521527776e6
```

### Notes ###

This is the inverse of `daycnv`.

`get_juldate` returns the number of Julian days for current time.  It is
equivalent to `jdcnv(now(Dates.UTC))`.

For the conversion of Julian date to number of Julian days, use `juldate`.
"""
const jdcnv = Dates.datetime2julian
jdcnv(date...) = jdcnv(DateTime(date...))
