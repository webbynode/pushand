class PhD #:nodoc:

  # Represents a host / server that we want to deploy an Application to
  class Host
    attr_accessor :name

    def initialize name
      @name = name
    end
  end

end
