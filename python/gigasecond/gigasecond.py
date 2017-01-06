from datetime import datetime, timedelta

def add_gigasecond(dt):
    return dt + timedelta(seconds=1000000000)
