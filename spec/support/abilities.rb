def all_models
  Dir.glob(Rails.root.join('app/models/**/*.rb')).each { |x| require x }
  ActiveRecord::Base.descendants.select { |model| factory_exist_by_model? model }
end

def abilities_all_read(model)
  abilities_all_action model, :read
end

def abilities_all_manage(model)
  abilities_all_action model, :manage
end

def factory_exist_by_model?(model)
  FactoryGirl.factories.map(&:name).include? factory_name_by_model(model)
end

def factory_name_by_model(model)
  model.model_name.element.to_sym
end

def abilities_all_action (sub, action)
  all_models.each do |model|
    describe "on #{model.to_s}: #{action}" do
      let(:mymodel) { FactoryGirl.create(model.model_name.element.to_sym) }
      subject { Ability.new(sub) }
      it { should be_able_to(action.to_sym, mymodel) }
    end
  end
end
