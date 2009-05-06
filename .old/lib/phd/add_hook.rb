=begin

... this works and gets called by << ... but not my code below ... WTF?

... i would rather not do aliasing ...

>> class Array
>>   def concat_with_tracing *args
>>     puts "#{self.inspect}#concat(#{args.inspect})"
>>   end
>>   alias_method_chain :concat, :tracing
>> end

>> [] << 'y'
[]#concat([["[", "]", " ", "<", "<", " ", "'", "y", "'", "\n"]])
>> [] += "hi"
[]#concat([["[", "]", " ", "+", "=", " ", "\"", "h", "i", "\"", "\n"]])
>> x = []
[]#concat([["x", " ", "=", " ", "[", "]", "\n"]])
>> x[1] = 5
[]#concat([["x", "[", "1", "]", " ", "=", " ", "5", "\n"]])
=end

class Object #:nodoc:

  def add_hook method_name, &block
    return if method_name.to_s == 'add_hook' # protect against infinite looping

    unless self.respond_to? :hooked_methods

      # add some things to this particular object
      class << self
        attr_accessor :hooked_methods, :hooked_method_hooks
      end

      # initalize attributes
      self.hooked_methods      ||= { }
      self.hooked_method_hooks ||= { }

    end

    # for now, assume this is an instance method that we're hooking
    method     = self.class.instance_method(method_name.to_s)
    method_key = method_name.to_s + Time.now.to_s

    if method

      self.hooked_methods[ method_key ]      = method # store the original method
      self.hooked_method_hooks[ method_key ] = block  # store the block to call

      # using eval because define_method can't create
      # a method that accepts a block
      eval %{
        def self.#{ method_name } *args #, &block
          self.hooked_method_hooks[#{ method_key.inspect }].call(self, *args)
          self.hooked_methods[#{ method_key.inspect }].bind(self).call(*args) # add block
        end
      }

    else
      raise "Cannot find method #{ method_name.inspect } to add hook to"
    end
  end
    
end
