#!/usr/bin/python

import socket,md5,string,time,os,sys,random,urllib,getopt,argparse,signal

server_cnf = ('ns-server.epitech.eu', 4242)
location = urllib.quote("BMTech 0.6.4")
useragent = urllib.quote("BMTeh v0.6 [%d]"%os.getpid())
states = ["actif", "actif"]
delays = [ 10 ] + [ 4242 ]*10 + [ 424 ]*10
user = ''
password = ''
key = '';

f = open('/tmp/ns_pid','w')
f.write(str(os.getpid()))
f.close()
f = open('/tmp/success_bmtech', 'w')
f.write('0')
f.close()
parser = argparse.ArgumentParser(description='NetSoul Connection by BMTech')
parser.add_argument('-u','--user', help='Specify Username', required=True)
parser.add_argument('-p','--password', help='Specify password', required=True)
parser.add_argument('-k','--key', help='Specify Magic Key', required=True)
args = parser.parse_args()
if args.user:
    user = args.user
if args.password:
    password = args.password
if args.key:
    key = args.key
f = open('/tmp/key_bmtech', 'w')
f.write(key)
f.close()

def signal_handler(signal, frame):
    print('You pressed Ctrl+C!')
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)
    
def md5sum(str):
    chk = md5.new()
    chk.update(str)
    return chk.digest()

def hexify(str):
    return string.join(map(lambda c:"%02x"%ord(c),str),"")

def expect(file,str):
    reply = file.readline()[:-1]
    if reply[:len(str)]==str: return
    print "Invalid reply : '%s*' expected, '%s' received."%(str,reply)
    time.sleep(3)
    sys.exit()

while 1:
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(server_cnf)
    f=s.makefile()
    cmd,code,hash,ip,port,timestamp=string.split(f.readline()[:-1])
    sum=md5sum("%s-%s/%s%s"%(hash,ip,port,password))
    authreply=hexify(sum)
    s.send("auth_ag ext_user none none\n")
    expect(f,"rep 002 --")
    s.send("ext_user_log %s %s %s %s\n"%(user,authreply,location,useragent))
    expect(f,"rep 002 --")
    statechange_deadline = string.atoi(timestamp)
    ping_deadline = string.atoi(timestamp)
    ping_delay = 40
    check_deadline = string.atoi(timestamp)
    localtime = string.atoi(timestamp)
    toget = localtime + 1500
    f = open('/tmp/success_bmtech', 'w')
    f.write('1')
    f.close()
    print "You have been connected"
    while (localtime < toget):
        localtime += 1
        if localtime > ping_deadline:
            ping_deadline += ping_delay
            s.send("ping\n")
        if localtime > statechange_deadline:
            delay = random.choice(delays)
            newstate = random.choice(states)
            statechange_deadline+=delay
            s.send("state %s:%i\n"%(newstate,int(localtime)))
        time.sleep(1)
    s.close();
#exit();
