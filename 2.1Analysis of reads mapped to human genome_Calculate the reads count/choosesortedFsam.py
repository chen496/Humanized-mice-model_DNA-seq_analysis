import os
for root, dirs, files in os.walk("/nethome/cxw496/local/test/HTSeq/input1"):
        for i,fn in enumerate(files):
                print i,fn
		m=""
		m=os.path.join(root,fn)
		print m
                import HTSeq
		name=str(fn)
                name=name+'.txt'
                print name
                alignment_file = HTSeq.SAM_Reader(m)

		import itertools
                a=""
                for c in itertools.islice( alignment_file, 0, None ):
			os.chdir(r'/nethome/cxw496/local/test/HTSeq/output1')
			f=open(name,'w')
                        a+='\n'+c.read.seq+'	'+c.read.name
                        f.write(a)


