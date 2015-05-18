class Applications
  
  def set_fields(options)
    options.each do |key, value|
      self.public_send( "#{key}=", value ) if self.class.instance_methods.include? key
    end
  end

  def fields(*keys)
    field = Auth.new.auth
    keys.each do |key|
      if self.class.instance_methods.include? key
        field[key] = self.public_send(key)
      end
    end
    return field
  end

end
