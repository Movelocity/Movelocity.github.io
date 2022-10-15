import sys

def handle(event : dict):
    if event['action'] == 'newUser':
        with open("data", 'a', encoding='utf-8') as f:
            f.write("'{}':'default'\n".format(event['uid']))

    elif event['action'] == 'setUserName':
        records = []
        with open("data", 'r', encoding='utf-8') as f:
            i = 0
            records = f.read().split('\n')
            for rc in records:
                attributes = rc.split(':')
                uid = attributes[0].replace("'", "")
                uname = attributes[1].replace("'", "")
                if uid == event['uid']:
                    uname = event['data']
                    records[i] = "'{}':'{}".format(uid, uname)
                    break
                i += 1

        with open("data", 'w', encoding='utf-8') as f:
            for rc in records:
                f.write(rc+'\n')

    elif event['action'] == 'getUserName':
        with open("data", 'r', encoding='utf-8') as f:
            records = f.read().split('\n')
            for rc in records:
                attributes = rc.split(':')
                if len(attributes) != 2:
                    continue
                uid = attributes[0].replace("'", "")
                uname = attributes[1].replace("'", "")
                if uid == event['uid']:
                    print(uname)
            return 'null'
            
if __name__ == '__main__':
    ag = str(sys.argv)
    





