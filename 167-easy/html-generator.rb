require 'rbconfig'

if ARGV.length < 2
	puts "Usage: filename message"
end 

filename = ARGV[0]
message = ARGV[1]


def os
	@os ||= (
	  host_os = RbConfig::CONFIG['host_os']
	  case host_os
	  when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
	    :windows
	  when /darwin|mac os/
	    :macosx
	  when /linux/
	    :linux
	  when /solaris|bsd/
	    :unix
	  else
	    raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
	  end
	)
end

output = %Q{
<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>

    <body>
        <p>#{message}</p>
    </body>
</html>
}
file = File.open(filename, "w")
file.puts output
file.close 
#Open page in broswer
#if os == :windows
#	system %{cmd /c "start #{filename}"}
#else
	system %{open "#{filename}"}
#end