require 'test_helper'

class IndexTest < ActionDispatch::IntegrationTest

  def setup
    @product = Product.create(name: 'Product 1', price: 4000)
  end

  test 'index render correctly' do
    sign_in users(:jc)
    get products_path
    assert_select "h1", "Products"
    assert_select "a", "Nuevo Producto"
    assert_select "th", "Nombre"
    assert_select "th", "Precio"
    assert_select "td", "#{@product.name}"
    assert_select "td",  "$4,000.00"
  end
end

#en el contexto del test crear un producto y verificar
#que este exista en el index de products.

#a travez de un test probar que en el index solo se muestren los productos
#con el atributo published en true