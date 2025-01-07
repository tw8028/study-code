import maya.OpenMaya as OpenMaya

dagIterator = OpenMaya.MItDag(OpenMaya.MItDag.kDepthFirst, OpenMaya.MFn.kInvalid)
dagNodeFn = OpenMaya.MFnDagNode()
while (not dagIterator.isDone()):
    curentObj = dagIterator.currentItem()
    depth = dagIterator.depth()
    dagNodeFn.setObject(curentObj)
    name = dagNodeFn.name()
    type = curentObj.apiTypeStr()
    path = dagNodeFn.fullPathName()

    printout = ''
    for i in range(depth):
        printout += '---->'
    printout += name + ':' + type
    print(printout)

    dagIterator.next()
