# Goldenrule reference model for arbiter

# g = []
# for i in range(2):
#     for j in range(2):
#         for k in range(2):
#             if i == 1:
#                 g = [1, 0, 0]
#             elif (j == 1 and i != 1):
#                 g = [0, 1, 0]
#             elif (k == 1 and i != 1 and j != 1):
#                 g = [0, 0, 1]
#             else:
#                 g = [0, 0, 0]
#             print("r = %d%d%d, g = %d%d%d" %(i, j, k, g[0], g[1], g[2]))

# Functional test of the following 16 input sequence
# 001
# 101
# 100
# 110
#
# 010
# 110
# 100
# 101
#
# 001
# 010
# 111
# 101
#
# 100
# 000
# 010
# 110

r = [[0, 0, 1],
     [1, 0, 1],
     [1, 0, 0],
     [1, 1, 0],
     [0, 1, 0],
     [1, 1, 0],
     [1, 0, 0],
     [1, 0, 1],
     [0, 0, 1],
     [0, 1, 0],
     [1, 1, 1],
     [1, 0, 1],
     [1, 0, 0],
     [0, 0, 0],
     [0, 1, 0],
     [1, 1, 0]]
index = 0
for i in range(len(r)):
    #print("r =  %d%d%d" %(r[i][0], r[i][1], r[i][2] ))
    if(i == 0):

        if(r[i][0] == 1):
            g = [1, 0, 0]
        elif(r[i][1] == 1 and r[i][0] != 1):
            g = [0, 1, 0]
        elif(r[i][2] == 1 and r[i][0] != 1 and r[i][1] != 1):
            g = [0, 0, 1]
        else:
            g = [0, 0, 0]
    else:

        #get index of last output
        if(g[0] == 1):
            index = 0
        elif(g[1] == 1):
            index = 1
        elif(g[2] == 1):
            index = 2



        if(r[i][index] != 1):

            if(r[i][0] ==1):
                g = [1, 0, 0]
            elif(r[i][1] == 1 and r[i][0] != 1):
                g = [0, 1, 0]
            elif(r[i][2] == 1 and r[i][0] != 1 and r[i][1] != 1):
                g = [0, 0, 1]
            else:
                g = [0, 0, 0]

    print("r = %d%d%d, g = %d%d%d" %(r[i][0], r[i][1], r[i][2], g[0], g[1], g[2]))

