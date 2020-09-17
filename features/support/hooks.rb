Dir[File.join(File.dirname(__FILE__), 'helper/*.rb')].sort.each do |files|
  require files
  World(module_name(files))
end