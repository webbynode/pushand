class PhD #:nodoc:

  #
  # bin doco ...
  #
  class Bin
    include SimpleCLI

    def usage
      puts <<doco

  phd == %{ ... }

    Usage:
      phd command [options]

    Examples:
      phd ...              # ...

    Options:
      -x, --xxx            # ...

    Further help:
      phd commands         # list all available commands
      phd help <COMMAND>   # show help for COMMAND
      phd help             # show this help message

doco
    end
  end

end
