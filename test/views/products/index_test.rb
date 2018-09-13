require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest

  test 'index render correctly' do
    get products_path
    assert_select "h1", "Products"
    assert_select "a", "Nuevo Producto"
    assert_select "th", "Nombre"
    assert_select "th", "Precio"
  end
end