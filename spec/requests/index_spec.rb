describe 'Index page', type: :request do

  it 'on GET replies with success' do
    get('/')
    expect(response).to be_success
  end

end
