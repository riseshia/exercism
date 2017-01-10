from datetime import date
from calendar import monthrange


class MeetupDayException(Exception):
    pass


def _find_date(year, month, start_date, weekday):
    wd = [
        'Monday', 'Tuesday', 'Wednesday', 'Thursday',
        'Friday', 'Saturday', 'Sunday'
        ].index(weekday)
    cursor = start_date

    try:
        while True:
            if date(year, month, cursor).weekday() == wd:
                return cursor
            else:
                cursor += 1
    except ValueError:
        raise MeetupDayException('can not find matched date')


def _find_start_date(year, month, pattern):
    (_, last_d) = monthrange(year, month)
    return {
        '1st': 1, '2nd': 8, '3rd': 15,
        '4th': 22, '5th': 29, 'teenth': 10, 'last': last_d - 6
    }[pattern]


def meetup_day(year, month, weekday, pattern):
    start_date = _find_start_date(year, month, pattern)
    d = _find_date(year, month, start_date, weekday)
    return date(year, month, d)
