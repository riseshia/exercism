dic = {'G': 'C', 'C': 'G', 'T': 'A', 'A': 'U'}

def to_rna(dna):
    rna = ''.join([dic.get(c, '') for c in dna if c in dic])

    if len(rna) == len(dna):
        return rna
    else:
        return ''
