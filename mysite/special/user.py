import sys

def runner(action, uid, data):
    if action == 'newUser':
        with open("data", 'a', encoding='utf-8') as f:
            f.write("'{}':'default'\n".format(uid))
        print('ok')

    elif action == 'setUserName':
        records = []
        with open("data", 'r', encoding='utf-8') as f:
            i = 0
            records = f.read().split('\n')
            for rc in records:
                attributes = rc.split(':')
                usid = attributes[0].replace("'", "")
                if usid == uid:
                    records[i] = "'{}':'{}".format(usid, data)
                    print('ok')
                    break
                i += 1
        #print(str(records))

        with open("data", 'w', encoding='utf-8') as f:
            for rc in records:
                f.write(rc+'\n')

    elif action == 'getUserName':
        with open("data", 'r', encoding='utf-8') as f:
            records = f.read().split('\n')
            for rc in records:
                attributes = rc.split(':')
                if len(attributes) != 2:
                    continue
                usid = attributes[0].replace("'", "")
                uname = attributes[1].replace("'", "")
                if usid == uid:
                    print(uname)
                    break
            return 'null'


if __name__ == '__main__':
    li = sys.argv
    # print(str(li))
    if len(li) == 4:
        runner(li[1], li[2], li[3])

