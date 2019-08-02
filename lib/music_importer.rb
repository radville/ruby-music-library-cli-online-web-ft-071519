class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    initial_dir = Dir.pwd
    Dir.chdir(self.path)
    files = Dir.glob("*")
    Dir.chdir(initial_dir)
    files
  end
  
end