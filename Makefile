test: sample.log
	perl read.pl sample.log

sample.log: sample.log.7z
	7z x -y sample.log.7z
