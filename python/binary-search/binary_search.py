def binary_search(l, item):
    start_idx = 0
    end_idx = len(l) - 1

    while start_idx <= end_idx:
        middle = (start_idx + end_idx) // 2

        if l[middle] == item:
            return middle
        elif l[middle] > item:
            end_idx = middle - 1
        else:
            start_idx = middle + 1

    raise ValueError('fail to find item')
