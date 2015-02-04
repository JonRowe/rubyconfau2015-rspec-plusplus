RSpec.describe do
  require 'my_awesome_app'
  include MyAwesomeApp

  let(:my_json) { MyAwesomeApp.get :index }

  it do
    expect(my_json).to a_hash_including(
      some_models: array_including(hash_including(id: 1))
    )
  end

  def have_detail fragment
    a_hash_including(
      some_models: array_including(hash_including(fragment))
    )
  end

  it do
    expect(my_json).to have_detail(id: 1).and have_detail(id: 2)
  end

  RSpec::Matchers.define_negated_matcher :preserve, :change

  it do
    expect { my_json }.to preserve { my_json }
  end
end
