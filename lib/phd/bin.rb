class PhD #:nodoc:

  #
  # bin doco ...
  #
  class Bin
    include SimpleCLI

    # once the new SimpleCLI is out, this can be in a #before block ...
    def initialize args = [], options = {}
      handle_global_arguments args

      # if command looks like foo:bar, conver it to foo_bar
      if args.length > 0 and args.first.include?(':')
        args[0] = args[0].sub(':', '_')
      end

      super
    end

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

    def hosts_help
      <<doco
  Usage: #{ script_name } hosts

    Summary:
      Prints a list of available hosts
doco
    end
    def hosts
      if PhD.hosts.empty?
        puts "No hosts.  Use `phd hosts:add` to add host."
      else
        PhD.hosts.each do |host|
          puts host.name
        end
      end
    end

    def hosts_add_help
      <<doco
  Usage: #{ script_name } hosts:add foo.com

    Summary:
      Adds a host
doco
    end
    def hosts_add name
      PhD.hosts.add name
    end

    protected

    def handle_global_arguments args
      opts = OptParseSimple.new do |opts|
        opts.on('--rcfile [x]'){|x| PhD.rcfile = x }
        opts.on('--rcdir [x]'){|x|  PhD.rcdir  = x }
      end
      opts.parse! args
    end

  end
end
