def slices(string, slice_size):
    numbers = [int(char) for char in list(string)]
    last_idx = len(numbers) + 1 - slice_size
    if last_idx < 1 or len(numbers) < last_idx:
        raise ValueError

    return [numbers[i:i+slice_size] for i in range(0, last_idx)]
