# Intro 
# smt = 5

# def test_st(smtt):
#     smt= smtt
#     print(smt)
#     smt += 1
#     print(smt)
#
#
# print(smt)
# test_st(smt)

smt_di = ["foo", "foo1"]
def smt(dikk):
    smt = dikk.append("foo2")
    # print(dikk)
    # print(smt)
    return smt
print(smt_di)
smt_di = smt(smt_di)
print(smt_di)
