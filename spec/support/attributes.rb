def test_attributes_getter_setter (*attributes)
  test_attributes_getter *attributes
  test_attributes_setter *attributes
end

def test_attributes_getter (*attributes)
  it { expect(subject).to respond_to(*attributes) }
end

def test_attributes_setter (*attributes)
  ats = attributes
  ats = ats.map { |a| "#{a}=".to_sym }
  it { expect(subject).to respond_to(*ats) }
end
