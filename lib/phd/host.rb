class PhD #:nodoc:

  # Represents a host / server that we want to deploy an Application to
  class Host
    attr_accessor :name

    def initialize name
      @name = name
    end
  end

  # Represents a collection of Host instances
  #
  # Really just an Array class with a few additional helper methods added
  #
  class HostCollection < Array

    # You have to explicitly call #save on #hosts to persist them!
    def save
      PhD.persist self
    end

    # Returns array of the names of all of the hosts
    def names
      self.map &:name
    end

    # Adds a Host to the collection (accepts the same arguments as Host#new) 
    # and persists the collection (calls #save)
    #
    def add *args
      self << Host.new(*args)
      save
    end

  end

end
