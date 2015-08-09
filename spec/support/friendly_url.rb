shared_examples_for "Model slug" do
  describe "slug" do
    let(:random) { rand(100000) }
    let(:random2) { rand(100000) }
    let(:name) { "Original Name Random #{random}" }
    let(:slug) { "original-name-random-#{random}" }
    let(:new_name) { "New Name Random #{random2}" }
    let(:new_slug) { "new-name-random-#{random2}" }
    let!(:model) { FactoryGirl.create factory_name, name: name }

    it "#to_param gives 'name-random'" do
      expect(model.to_param).to eq slug
    end

    it "using .find given a slug gets the correct model" do
      expect(described_class.find slug).to eq model
    end

    it "using .find given the id gets the correct model" do
      expect(described_class.find model.id).to eq model
    end

    it "after change the name, changes the slug" do
      model.name = new_name
      model.save!

      expect(model.slug).to eq new_slug
      expect(model.to_param).to eq new_slug
    end
  end
end

shared_examples_for "Model friendly url" do
  it_behaves_like "Model slug"
  describe "friendly url" do
    let(:random) { rand(100000) }
    let(:random2) { rand(100000) }
    let(:name) { "Original Name Random #{random}" }
    let(:slug) { "original-name-random-#{random}" }
    let(:new_name) { "New Name Random #{random2}" }
    let(:new_slug) { "new-name-random-#{random2}" }
    let!(:model) { FactoryGirl.create factory_name, name: name }

    it "the path helper uses the slug" do
      expect(polymorphic_path model).to include(slug)
    end

    it "after change the name, changes the url" do
      model.name = new_name
      model.save!

      expect(polymorphic_path model).not_to include(slug)
      expect(polymorphic_path model).to include(new_slug)
    end

  end
end