run lambda { |env| 
	request = Rack::Request.new(env)
	bucket = request.env['REQUEST_PATH'].gsub('/', '')

	erb = ERB.new(File.read("./policy.erb"))
	output = erb.result(binding)

	[200, {'Content-Type'=>'text/plain'}, StringIO.new(output)] 
}