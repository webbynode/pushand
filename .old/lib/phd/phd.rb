#
# PhD doco ...
#
class PhD
  RCFILE = '~/.phdrc'
  RCDIR  = '~/.phd/'

  # class-level attributes
  class << self
    attr_reader :hosts
  end

  # Returns a list of all of the hosts a user has saved
  #
  # NOTE: to persist updates to #hosts, you need to call hosts.save
  #
  def self.hosts
    @hosts ||= HostCollection.new
    @hosts = self.load(:hosts) if updated?(:hosts) # if hosts have been changed (file modified)
    @hosts
  end

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

  # Whether or not a file has been updated (meaning we should probably re-load the information)
  def self.updated? *path_in_rcdir
    file_to_persist_to = File.join(PhD.rcdir, *path_in_rcdir.map(&:to_s)) + '.yml'
    return false unless File.file?(file_to_persist_to)

    @cached_mtimes ||= { }

    mtime = File.mtime file_to_persist_to
    if @cached_mtimes[file_to_persist_to] != mtime
      @cached_mtimes[file_to_persist_to] = mtime
      true
    else
      false
    end
  end

  # Saves user configuration objects, eg. #hosts
  def self.persist object
    case object
    when HostCollection
      persist_as_yaml object, :hosts
    else
      raise "Don't know howto persist #{ object.inspect }"
    end
  end

  # Loads user configuration objects by key/name, eg. :hosts
  def self.load *path_in_rcdir
    file_to_persist_to = File.join(PhD.rcdir, *path_in_rcdir.map(&:to_s)) + '.yml'
    if File.file? file_to_persist_to
      YAML::load_file file_to_persist_to
    else
      nil
    end
  end

  protected

  # Persists the given object as YAML to the given path (inside rcdir)
  #
  #   >> persist_as_yaml @host, :hosts, 'host1'
  #   >> persist_as_yaml @foo, :foo
  #
  # Serializes via #to_yaml
  #
  def self.persist_as_yaml object, *path_in_rcdir
    file_to_persist_to = File.join(PhD.rcdir, *path_in_rcdir.map(&:to_s)) + '.yml'
    FileUtils.mkdir_p File.dirname(file_to_persist_to)
    File.open(file_to_persist_to, 'w'){|f| f << object.to_yaml }
  end

end
