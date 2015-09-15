$sect="";
$count=0;
$debug=1;
while(<>)
{
    if(m{^URL +} .. m{^Result.*?\n}g){
        $sect.=$_;
    }else{
        $count++;
        my ($result) = ($sect =~ /Result +(.*)/);

        # URL        `https://www.linkedin.com/company/streambox-inc.'
        my ($url) = ($sect =~ /^URL +(.*)/);

        # Parent URL http://wwwdev5.streambox.com/wordpress/, line 743, col 6
        my ($parent_url) = ($sect =~ /Parent URL +(.*)/);

        if($result){
#	print $result;
#	print "\n";
	if($result =~ m/Not Found/){
	    # print "url: $url\n";
	    # print "parent: $parent_url\n";
	    # print $result;
	    # print "\n";
	    print "$sect\n";
	    print "\n";
	}
        }
#        $debug and print "$sect\n";
        $sect="";
    }
#    die if ($count>100);
}
