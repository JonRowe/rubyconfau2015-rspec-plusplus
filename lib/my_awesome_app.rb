module MyAwesomeApp
  module_function

  def get action, params = {}, headers = {}
    case action
    when :index
      {
        some_models:
          [
           { id: 1, url:'/show/1', information: "i don't care about" },
           { id: 2, url:'/show/2', information: "i don't care about" },
           { id: 3, url:'/show/3', information: "i don't care about" },
          ],
        actions: [:index, :show],
      }
    when :show
      {
        1 => { id: 1, name: 'My Thing #1', description: 'Lorum ipsum' },
        2 => { id: 2, name: 'My Thing #2', description: 'Lorum ipsum' },
        3 => { id: 3, name: 'My Thing #3', description: 'Lorum ipsum' },
      }[params[:id]]
    else
      { error: "not found" }
    end
  end

end
