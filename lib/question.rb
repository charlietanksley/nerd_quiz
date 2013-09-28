Question = Struct.new(:user) do
  def to_json
    "{'question':'answer'}"
  end
end
