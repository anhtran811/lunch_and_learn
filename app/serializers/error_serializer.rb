class ErrorSerializer
  def self.invalid_parameters(error) 
    {
      "error": error        
    }
  end
end
