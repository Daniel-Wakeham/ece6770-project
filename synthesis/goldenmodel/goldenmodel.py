# Goldenrule reference model for arbiter

g = []
for i in range(2):
    for j in range(2):
        for k in range(2):
            if i == 1:
                g = [1, 0, 0]
            elif (j == 1 and i != 1):
                g = [0, 1, 0]
            elif (k == 1 and i != 1 and j != 1):
                g = [0, 0, 1]
            else:
                g = [0, 0, 0]
            print("r = %d%d%d, g = %d%d%d" %(i, j, k, g[0], g[1], g[2]))
