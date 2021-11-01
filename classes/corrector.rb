class Corrector
  def correct_name(name)
    if name.length <= 10
      name.capitalize
    elsif name.length > 10
      name.capitalize[0, 10]
    end
  end
end
