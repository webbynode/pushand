#
# PhD doco ...
#
class PhD
  RCFILE = '~/.phdrc'
  RCDIR  = '~/.phd/'

  # class-level attributes
  class << self
    attr_accessor :hosts
  end

  # defaults
  PhD.hosts ||= []

  # Gets the path to the file where we store user configuration data for PhD.
  #
  # The path returned is fully expanded.
  #
  #   >> PhD.rcfile = 'hello'
  #
  #   >> PhD.rcfile
  #   => '/fully/expanded/path/to/hello'
  #
  def self.rcfile
    @rcfile ||= PhD::RCFILE
    File.expand_path @rcfile
  end

  # Sets the path to the file where we store user configuration data for PhD.  See #rcfile
  def self.rcfile= value
    @rcfile = value
    self.rcfile
  end

  # Get the path to the directory where we store user configuration data for PhD.
  #
  # The path returned is fully expanded.
  #
  #   >> PhD.rcfile = 'hello'
  #
  #   >> PhD.rcfile
  #   => '/fully/expanded/path/to/hello'
  #
  def self.rcdir
    @rcdir ||= PhD::RCDIR
    File.expand_path @rcdir
  end

  # Set the path to the directory where we store user configuration data for PhD.  See #rcdir
  def self.rcdir= value
    @rcdir = value
    self.rcdir
  end

end
