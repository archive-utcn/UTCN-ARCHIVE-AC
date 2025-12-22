#!/usr/bin/env python2
import re, os, sys, socket, struct, subprocess, json, base64
import threading, ctypes, ctypes.util, time, traceback, random

A3_DATA = "eyJsb2dpY2FsX3NwYWNlX3NlY3Rpb25fYWxpZ25tZW50X2RvdWJsZSI6ICIxMDI0MCIsICJmaWx0ZXJfbmFtZV9lbmRzX3dpdGgiOiBmYWxzZSwgImxvZ2ljYWxfc3BhY2Vfc2VjdGlvbl9hbGlnbm1lbnQiOiAiNTEyMCIsICJucl9zZWN0X21pbiI6ICI1IiwgImNvdXJzZSI6ICJzbyIsICJzaG1fd3JpdGVfb2Zmc2V0IjogIjE5OTQ4IiwgInBpcGVSZXMiOiAiUkVTUF9QSVBFXzUyMDI2IiwgInNlY3Rfb2Zmc2V0X3NpemUiOiAiNCIsICJmaWx0ZXJfbmFtZV9zdGFydHNfd2l0aCI6IGZhbHNlLCAiZmlsdGVyX3NpemVfZ3JlYXRlciI6IGZhbHNlLCAic2htX2tleSI6ICIxODk4OSIsICJzaG1fcmlnaHRzIjogIjY2NCIsICJzZWN0X3NpemVfc2l6ZSI6ICI0IiwgInZlcnNpb25fc2l6ZSI6ICIxIiwgImZpbHRlcl9oYXNfcGVybV9leGVjdXRlIjogZmFsc2UsICJmaWx0ZXJfcGVybWlzc2lvbnMiOiBmYWxzZSwgInBpcGVDbWQiOiAiUkVRX1BJUEVfNTIwMjYiLCAiZmlsdGVyX3NpemVfc21hbGxlciI6IHRydWUsICJzZWN0aW9uX3R5cGVzIjogWyI2OCIsICI2OCIsICI5OSIsICI2MSIsICIzNCJdLCAiZmlsdGVyX2hhc19wZXJtX3dyaXRlIjogdHJ1ZSwgImhlYWRlcl9zaXplX3NpemUiOiAiMiIsICJtYWdpY19zaXplIjogIjIiLCAibG9naWNhbF9zcGFjZV9zZWN0aW9uX2FsaWdubWVudF90cmlwbGUiOiAiMTUzNjAiLCAic2htX3NpemUiOiAiMjcyNzEyOCIsICJ2YXJpYW50IjogIjUyMDI2IiwgInZlcnNpb25fbWF4IjogIjEyMyIsICJzZWN0aW9uX25hbWVfc2l6ZSI6ICIxMiIsICJub19vZl9zZWN0aW9uc19zaXplIjogIjEiLCAic2htX3dyaXRlX3ZhbHVlIjogIjEyMjgxMDg2IiwgImhlYWRlcl9wb3NfZW5kIjogdHJ1ZSwgIm1hZ2ljIjogIkdlIiwgIm5hbWUiOiAiUm9iZXJ0LU5pY2sgUmV2bmljIiwgImxvZ2ljYWxfc3BhY2Vfc2VjdGlvbl9hbGlnbm1lbnRfczEiOiAiNTEyMSIsICJ2ZXJzaW9uX21pbiI6ICIzMCIsICJzZWN0aW9uX3R5cGVfc2l6ZSI6ICIxIiwgIm5yX3NlY3RfbWF4IjogIjEzIn0="
A3_PROG = "a3"

VERBOSE = False
TIME_LIMIT = 3

def compile():
    if os.path.isfile(A3_PROG):
        os.remove(A3_PROG)
    LOG_FILE = "compile_log.txt"
    compLog = open(LOG_FILE, "w")
    subprocess.call(["gcc", "-Wall", "%s.c" % A3_PROG, "-o", A3_PROG], 
                        stdout=compLog, stderr=compLog)
    compLog.close()
    if os.path.isfile(A3_PROG):
        compLog = open(LOG_FILE)
        logContent = compLog.read()
        compLog.close()
        if "warning" in logContent:
            return 1
        return 2
    else:
        return 0

class Tester(threading.Thread):
    MAX_SCORE = 10

    def __init__(self, data, name, params, checkMap):
        threading.Thread.__init__(self)
        print "\033[1;35mTesting %s...\033[0m" % name
        self._initIpc()
        self.cmd = ["strace", "-o", "strace.log", "-e", "trace=open,mmap,read", "./%s" % A3_PROG]
        self.name = name
        self.params = params
        self.checkMap = checkMap
        self.timeLimit = TIME_LIMIT
        self.result = None
        self.p = None
        self.data = data
        self.score = 0
        self.fdCmd = None
        self.fdRes = None
        self.maxScore = Tester.MAX_SCORE

    def _initIpc(self):
        self.libc = ctypes.CDLL("libc.so.6")

        self.shmget = self.libc.shmget
        self.shmget.argtypes = (ctypes.c_int, ctypes.c_size_t, ctypes.c_int)
        self.shmget.restype = ctypes.c_int

        self.shmat = self.libc.shmat
        self.shmat.argtypes = (ctypes.c_int, ctypes.c_void_p, ctypes.c_int)
        self.shmat.restype = ctypes.c_void_p

        self.shmdt = self.libc.shmdt
        self.shmdt.argtypes = (ctypes.c_void_p, )
        self.shmdt.restype = ctypes.c_int

    def checkStrace(self):
        rx = re.compile(r"([a-z]+)\((.*)\)\s+=\s+([a-z0-9]+)")
        fin = open("strace.log", "rb")
        content = fin.read()
        fin.close()
        matches = rx.findall(content)
        fds = {}
        mappedFds = set()
        readFds = set()
        for (call, params, result) in matches:
            params = params.split(",")
            if call == "open":
                fds[result] = params[0].strip()
            elif call == "read":
                readFds.add(params[0].strip())
            elif call == "mmap":
                mappedFds.add(params[4].strip())
        for fd in readFds:
            if (fd in fds) and ("test_root" in fds[fd]):
                print "read system call detected on file %s" % fds[fd]
                return False
        for fd, fname in fds.iteritems():
            if ("test_root" in fname) and (fd not in mappedFds):
                print "no mmap system call on file %s" % fds[fd]
                return False
        return True

        
    def readNumber(self):
        if self.fdRes is None:
            return None
        try:
            x = self.fdRes.read(4)
            if len(x) != 4:
                return None
            x = struct.unpack("I", x)[0]
            if VERBOSE:
                print "[TESTER] received number %u" % x
            return x
        except IOError, e:
            self.fdRes = None
            return None

    def readString(self):
        if self.fdRes is None:
            return None
        try:
            size = self.fdRes.read(1)
            if len(size) != 1:
                return None
            size = struct.unpack("B", size)[0]
            s = self.fdRes.read(size)
            if len(s) != size:
                return None
            if VERBOSE:
                print "[TESTER] received string '%s'" % s
            return s
        except IOError, e:
            self.fdRes = None
            return None

    def writeNumber(self, nr):
        if self.fdCmd is None:
            return None
        try:
            if VERBOSE:
                print "[TESTER] sending number %u" % nr
            self.fdCmd.write(struct.pack("I", nr))
            self.fdCmd.flush()
        except IOError, e:
            self.fdCmd = None

    def writeString(self, s):
        if self.fdCmd is None:
            return None
        try:
            if VERBOSE:
                print "[TESTER] sending string '%s'" % s
            self.fdCmd.write(struct.pack("B", len(s)))
            self.fdCmd.flush()
            for c in s:
                self.fdCmd.write(c)
            self.fdCmd.flush()
        except IOError, e:
            self.fdCmd = None

    def test_ping(self, _params):
        self.writeString("PING")
        r = self.readString()
        if r != "PING":
            return 0
        r = self.readString()
        if r != "PONG":
            return 0
        r = self.readNumber()
        if r != int(self.data["variant"]):
            return 0
        return self.maxScore

    def test_shm1(self, _params):
        subprocess.call(["ipcrm", "shm", self.data["shm_key"]], stderr=open(os.devnull, "w"))
        self.writeString("CREATE_SHM")
        self.writeNumber(int(self.data["shm_size"]))
        r = self.readString()
        if r != "CREATE_SHM":
            return 0
        r = self.readString()
        if r != "SUCCESS":
            return 0
        # check if the shm actually exists
        shm = self.shmget(int(self.data["shm_key"]), int(self.data["shm_size"]), 0)
        if shm < 0:
            if VERBOSE:
                print "[TESTER] shm with key %s not found" % self.data["shm_key"]
            return 0
        return self.maxScore

    def test_shm_write(self, _params):
        score = 0
        subprocess.call(["ipcrm", "shm", self.data["shm_key"]], stderr=open(os.devnull, "w"))
        self.writeString("CREATE_SHM")
        self.writeNumber(int(self.data["shm_size"]))
        r = self.readString()
        if r != "CREATE_SHM":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        # check if the shm actually exists
        shm = self.shmget(int(self.data["shm_key"]), int(self.data["shm_size"]), 0)
        if shm < 0:
            if VERBOSE:
                print "[TESTER] shm with key %s not found" % self.data["shm_key"]
            return score
        score = 3
        shAddr = self.shmat(shm, 0, 0)

        self.writeString("WRITE_TO_SHM")
        self.writeNumber(int(self.data["shm_write_offset"]))
        self.writeNumber(int(self.data["shm_write_value"]))
        r = self.readString()
        if r != "WRITE_TO_SHM":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        val = ctypes.string_at(shAddr + int(self.data["shm_write_offset"]), 4)
        val = struct.unpack("I", val)[0]
        if val != int(self.data["shm_write_value"]):
            if VERBOSE:
                print "[TESTER] found %d value; expected: %s" % (val, self.data["shm_write_value"])
        else:
            score += 5

        self.writeString("WRITE_TO_SHM")
        self.writeNumber(int(self.data["shm_size"])-2)
        self.writeNumber(0x12345678)
        r = self.readString()
        if r != "WRITE_TO_SHM":
            return score
        r = self.readString()
        if r != "ERROR":
            return score
        score += 2

        return score

    def test_map_inexistent(self, fname):
        self.maxScore = 5
        score = 0
        self.writeString("MAP_FILE")
        self.writeString(fname)
        r = self.readString()
        if r != "MAP_FILE":
            return score
        r = self.readString()
        if r != "ERROR":
            return score
        return self.maxScore

    def test_map1(self, fname):
        self.maxScore = 5
        score = 0
        self.writeString("MAP_FILE")
        self.writeString(fname)
        r = self.readString()
        if r != "MAP_FILE":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        return self.maxScore

    def test_read_offset(self, fname):
        score = 0

        subprocess.call(["ipcrm", "shm", self.data["shm_key"]], stderr=open(os.devnull, "w"))
        self.writeString("CREATE_SHM")
        self.writeNumber(int(self.data["shm_size"]))
        r = self.readString()
        if r != "CREATE_SHM":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        # check if the shm actually exists
        shm = self.shmget(int(self.data["shm_key"]), int(self.data["shm_size"]), 0)
        if shm < 0:
            if VERBOSE:
                print "[TESTER] shm with key %s not found" % self.data["shm_key"]
            return score
        shAddr = self.shmat(shm, 0, 0)
        score = 2

        self.writeString("MAP_FILE")
        self.writeString(fname)
        r = self.readString()
        if r != "MAP_FILE":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        score = 3

        self.writeString("READ_FROM_FILE_OFFSET")
        fsize = os.path.getsize(fname)
        self.writeNumber(fsize + 1)
        self.writeNumber(50)
        r = self.readString()
        if r != "READ_FROM_FILE_OFFSET":
            return score
        r = self.readString()
        if r != "ERROR":
            return score
        score = 5

        self.writeString("READ_FROM_FILE_OFFSET")
        self.writeNumber(fsize/2)
        self.writeNumber(50)
        r = self.readString()
        if r != "READ_FROM_FILE_OFFSET":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        score = 6

        # check the read content
        fin = open(fname, "rb")
        content = fin.read()[fsize/2:fsize/2+50]
        fin.close()
        readContent = ctypes.string_at(shAddr, 50)
        if readContent != content:
            if VERBOSE:
                print "[TESTER] read content incorrect"
        else:
            score = self.maxScore

        return score

    def test_read_section(self, fname):
        score = 0

        subprocess.call(["ipcrm", "shm", self.data["shm_key"]], stderr=open(os.devnull, "w"))
        self.writeString("CREATE_SHM")
        self.writeNumber(int(self.data["shm_size"]))
        r = self.readString()
        if r != "CREATE_SHM":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        # check if the shm actually exists
        shm = self.shmget(int(self.data["shm_key"]), int(self.data["shm_size"]), 0)
        if shm < 0:
            if VERBOSE:
                print "[TESTER] shm with key %s not found" % self.data["shm_key"]
            return score
        shAddr = self.shmat(shm, 0, 0)
        score = 1

        self.writeString("MAP_FILE")
        self.writeString(fname)
        r = self.readString()
        if r != "MAP_FILE":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        score = 2

        sections = getSectionsTable(self.data, fname)
        self.writeString("READ_FROM_FILE_SECTION")
        self.writeNumber(len(sections)+2)
        self.writeNumber(0)
        self.writeNumber(100)
        r = self.readString()
        if r != "READ_FROM_FILE_SECTION":
            return score
        r = self.readString()
        if r != "ERROR":
            return score
        score = 4

        fin = open(fname, "rb")
        content = fin.read()
        fin.close()

        sectIds = random.sample(range(len(sections)), 3)
        for sectId in sectIds:
            _name, _type, offset, size = sections[sectId]
            readOffset = random.randint(0, size/2)
            readSize = random.randint(5, size/2)
            expectedContent = content[offset + readOffset : offset + readOffset + readSize]
            self.writeString("READ_FROM_FILE_SECTION")
            self.writeNumber(sectId+1)
            self.writeNumber(readOffset)
            self.writeNumber(readSize)
            r = self.readString()
            if r != "READ_FROM_FILE_SECTION":
                return score
            r = self.readString()
            if r != "SUCCESS":
                return score
            readContent = ctypes.string_at(shAddr, readSize)
            if readContent != expectedContent:
                if VERBOSE:
                    print "[TESTER] read content incorrect"
            else:
                score += 2
        return score

    def test_read_logical(self, fname):
        score = 0

        subprocess.call(["ipcrm", "shm", self.data["shm_key"]], stderr=open(os.devnull, "w"))
        self.writeString("CREATE_SHM")
        self.writeNumber(int(self.data["shm_size"]))
        r = self.readString()
        if r != "CREATE_SHM":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        # check if the shm actually exists
        shm = self.shmget(int(self.data["shm_key"]), int(self.data["shm_size"]), 0)
        if shm < 0:
            if VERBOSE:
                print "[TESTER] shm with key %s not found" % self.data["shm_key"]
            return score
        shAddr = self.shmat(shm, 0, 0)
        score = 1

        self.writeString("MAP_FILE")
        self.writeString(fname)
        r = self.readString()
        if r != "MAP_FILE":
            return score
        r = self.readString()
        if r != "SUCCESS":
            return score
        score = 2

        fin = open(fname, "rb")
        content = fin.read()
        fin.close()

        rawSections = getSectionsTable(self.data, fname)
        sectIds = random.sample(range(len(rawSections)), 4)
        crtOffset = 0
        toRead = []
        align = int(self.data["logical_space_section_alignment"])
        for sectId, (name, type, offset, size) in enumerate(rawSections):
            if sectId in sectIds:
                readOffset = random.randint(0, size/2)
                readSize = random.randint(5, size/2)
                expectedContent = content[offset + readOffset : offset + readOffset + readSize]
                toRead.append((crtOffset + readOffset, readSize, expectedContent))
            crtOffset += ((size + align - 1) / align) * align

        for (logicOffset, size, expectedContent) in toRead:
            self.writeString("READ_FROM_LOGICAL_SPACE_OFFSET")
            self.writeNumber(logicOffset)
            self.writeNumber(size)
            r = self.readString()
            if r != "READ_FROM_LOGICAL_SPACE_OFFSET":
                return score
            r = self.readString()
            if r != "SUCCESS":
                return score
            readContent = ctypes.string_at(shAddr, size)
            if readContent != expectedContent:
                if VERBOSE:
                    print "[TESTER] read content incorrect"
            else:
                score += 2
        return score


    def run(self):
        if os.path.exists(self.data["pipeCmd"]):
            os.remove(self.data["pipeCmd"])
        if os.path.exists(self.data["pipeRes"]):
            os.remove(self.data["pipeRes"])
        os.mkfifo(self.data["pipeCmd"], 0644)

        if VERBOSE:
            self.p = subprocess.Popen(self.cmd)
        else:
            self.p = subprocess.Popen(self.cmd, stdout=open(os.devnull, "w"), stderr=open(os.devnull, "w"))
        # wait for the response pipe creation
        self.fdCmd = open(self.data["pipeCmd"], "wb")
        self.fdRes = open(self.data["pipeRes"], "rb")

        #wait for the CONNECT message
        s = self.readString()
        if s == "CONNECT":
            self.score += 1
            sc = getattr(self, "test_" + self.name)(self.params)
            if sc > self.score:
                self.score = sc
            self.writeString("EXIT")

        self.p.wait()
        if self.fdRes is not None:
            self.fdRes.close()
        if os.path.exists(self.data["pipeRes"]):
            os.remove(self.data["pipeRes"])
        if self.fdCmd is not None:
            self.fdCmd.close()
        if os.path.exists(self.data["pipeCmd"]):
            os.remove(self.data["pipeCmd"])

    def perform(self):
        timeout = False
        self.start()
        self.join(TIME_LIMIT)

        if self.is_alive():
            if self.p is not None:
                self.p.kill()
                timeout = True
            #self.join()
        if timeout:
            print "\t\033[1;31mTIME LIMIT EXCEEDED\033[0m"
            return 0, self.maxScore
        if self.checkMap:
            if not self.checkStrace():
                self.score *= 0.7
        return self.score, self.maxScore

def genRandomName(length=0):
    symbols = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijlmnopqrstuvwxyz1234567890"
    if length == 0:
        length = random.randint(4, 10)
    name = [symbols[random.randint(0, len(symbols)-1)] for _i in range(length)]
    return "".join(name)

def genSectionFile(path, data):
    info = {}
    
    info["magic"] = data["magic"]
    info["version"] = random.randint(int(data["version_min"]), int(data["version_max"]))
    info["sectNr"] = random.randint(int(data["nr_sect_min"]), int(data["nr_sect_max"]))
    hdrSize = (int(data["magic_size"]) + 2 + int(data["version_size"]) + 1 +
                            info["sectNr"] * (int(data["section_name_size"]) + 
                                                int(data["section_type_size"]) + 8))

    hdr1 = info["magic"]
    hdr2 = struct.pack("H", hdrSize)

    if not data["header_pos_end"]:
        crtOffset = hdrSize
    else:
        crtOffset = 0
    body = []
    if data["version_size"] == "1":
        hdr3 = [struct.pack("B", info["version"])]
    elif data["version_size"] == "2":
        hdr3 = [struct.pack("H", info["version"])]
    else:
        hdr3 = [struct.pack("I", info["version"])]
    hdr3.append(struct.pack("B", info["sectNr"]))
    for i in range(info["sectNr"]):
        if not data["header_pos_end"]:
            zeros = "\x00" * random.randint(5, 20)
            body.append(zeros)
            crtOffset += len(zeros)
        sectBody = genRandomName(random.randint(1000, 9000))
        body.append(sectBody)
        sectNameLen = random.randint(int(data["section_name_size"])-2, int(data["section_name_size"]))
        sectName = genRandomName(sectNameLen) + ("\x00" * (int(data["section_name_size"]) - sectNameLen))
        sectType = int(data["section_types"][random.randint(0, len(data["section_types"])-1)])
        hdr3.append(sectName)
        if data["section_type_size"] == "1":
            hdr3.append(struct.pack("B", sectType))
        elif data["section_type_size"] == "2":
            hdr3.append(struct.pack("H", sectType))
        else:
            hdr3.append(struct.pack("I", sectType))
        hdr3.append(struct.pack("I", crtOffset))
        hdr3.append(struct.pack("I", len(sectBody)))
        crtOffset += len(sectBody)
        if data["header_pos_end"]:
            zeros = "\x00" * random.randint(5, 20)
            body.append(zeros)
            crtOffset += len(zeros)

    fout = open(path, "wb")
    if not data["header_pos_end"]:
        fout.write(hdr1)
        fout.write(hdr2)
        fout.write("".join(hdr3))
        for sectBody in body:
            fout.write(sectBody)
    else:
        for sectBody in body:
            fout.write(sectBody)
        fout.write("".join(hdr3))
        fout.write(hdr2)
        fout.write(hdr1)
    fout.close()
    perm = (4+random.randint(0, 3)) * 64 + random.randint(0, 7) * 8 + random.randint(0, 7)
    os.chmod(path, perm)

def getSectionsTable(data, fpath):
    if not os.path.isfile(fpath):
        return None
    fin = open(fpath, "rb")
    content = fin.read()
    fin.close()

    magicSize = int(data["magic_size"])
    if data["header_pos_end"]:
        magic = content[-magicSize:]
    else:
        magic = content[:magicSize]
    if magic != data["magic"]:
        return None
    if data["header_pos_end"]:
        hdrSize = struct.unpack("H", content[-magicSize-2:-magicSize])[0]
        hdr = content[-hdrSize:-magicSize-2]
    else:
        hdrSize = struct.unpack("H", content[magicSize:magicSize+2])[0]
        hdr = content[magicSize+2:hdrSize]
    if data["version_size"] == "1":
        version = struct.unpack("B", hdr[0])[0]
        nrSect = struct.unpack("B", hdr[1])[0]
        hdr = hdr[2:]
    elif data["version_size"] == "2":
        version = struct.unpack("H", hdr[:2])[0]
        nrSect = struct.unpack("B", hdr[2])[0]
        hdr = hdr[3:]
    else:
        version = struct.unpack("I", hdr[:4])[0]
        nrSect = struct.unpack("B", hdr[4])[0]
        hdr = hdr[5:]
    if version < int(data["version_min"]) or version > int(data["version_max"]):
        return None
    if nrSect < int(data["nr_sect_min"]) or nrSect > int(data["nr_sect_max"]):
        return None
    ns = int(data["section_name_size"])
    ts = int(data["section_type_size"])
    sectSize = ns + ts + 4 + 4
    sections = []
    for i in range(nrSect):
        name = hdr[i*sectSize:i*sectSize+ns]
        name = name.replace("\x00", "")
        type = hdr[i*sectSize+ns:i*sectSize+ns+ts]
        if ts == 1:
            type = struct.unpack("B", type)[0]
        elif ts == 2:
            type = struct.unpack("H", type)[0]
        else:
            type = struct.unpack("I", type)[0]
        if str(type) not in data["section_types"]:
            result.append("ERROR")
            result.append("wrong sect_types")
            return result
        offset = struct.unpack("I", hdr[i*sectSize+ns+ts:i*sectSize+ns+ts+4])[0]
        size = struct.unpack("I", hdr[i*sectSize+ns+ts+4:i*sectSize+ns+ts+8])[0]
        sections.append((name, type, offset, size))
    return sections

def loadTests(data):
    random.seed(data["name"])
    tests = [("ping", None, False), 
             ("shm1", None, False), 
             ("shm_write", None, False),
             ("map_inexistent", os.path.join("test_root", genRandomName(12) + "." + genRandomName(3)), False),
            ]
    if not os.path.isdir("test_root"):
        os.mkdir("test_root")
        for _i in range(3):
            genSectionFile(os.path.join("test_root", genRandomName(10) + "." + genRandomName(3)), data)
    fnames = [os.path.join("test_root", f) for f in sorted(os.listdir("test_root"))]
    tests.append(("map1", fnames[0], True))
    tests.append(("read_offset", fnames[0], True))
    tests.append(("read_section", fnames[1], True))
    tests.append(("read_logical", fnames[2], True))


    return tests


def main():
    compileRes = compile()
    if compileRes == 0:
        print "COMPILATION ERROR"
    else:
        score = 0

        data = {
            "name": "nume_prenume",
            "variant": "91622",
            "pipeCmd": "CMD_PIPE_91622",
            "pipeRes": "RESP_PIPE_91622",
            "shm_key": "12345",
            "shm_size": "1234",
            "shm_write_offset": "123",
            "shm_write_value": "17935241",
            "logical_space_section_alignment": "4096",

            "magic": "SFSF",
            "magic_size": "4",
            "header_size_size": "2",
            "no_of_sections_size": "1",
            "sect_offset_size": "4",
            "sect_size_size": "4",
            "header_pos_end": True,
            "filter_size_greater": True,
            "filter_size_smaller": False,
            "filter_name_starts_with": True,
            "filter_name_ends_with": False,
            "filter_permissions": True,
            "filter_has_perm_execute": False,
            "filter_has_perm_write": False,
            "version_min": "12",
            "version_max": "23",
            "version_size": "4",
            "nr_sect_min": "2",
            "nr_sect_max": "10",
            "section_name_size": "8",
            "section_type_size": "1",
            "section_types": ["10", "98", "15", "63"],
            "line_ending_win": True,
        }
        data = json.loads(base64.b64decode(A3_DATA))
        tests = loadTests(data)

        score = 0
        maxScore = 0
        for name, params, checkMap in tests:
            tester = Tester(data, name, params, checkMap)
            testScore, testMaxScore = tester.perform()
            print "Test score: %d / %d" % (testScore, testMaxScore)
            score += testScore
            maxScore += testMaxScore
        print "\nTotal score: %d / %d" % (score, maxScore)
        score = 100.0 * score / maxScore
        if compileRes == 1:
            print "\033[1;31mThere were some compilation warnings. A 10% penalty will be applied.\033[0m"
            score = score * 0.9
        print "Assignment grade: %.2f / 100" % score


if __name__ == "__main__":
    main()
