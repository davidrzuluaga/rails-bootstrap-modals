require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product1 = products(:published1)
    @product2 = products(:published2)
    @product3 = products(:not_published)
  end

  test "Product is not created without a name" do
    product = Product.new
    assert_equal false, product.save
  end

  test ".word_count returns the correct number of words in name" do
    product = Product.new(name: "Hola mundo. Esto es una prueba!")
    assert_equal 6, product.word_count
  end

  test "published scope only returns published Products" do
    products = Product.published
    assert_equal 2, products.length
    # assert_includes products, products(:valid)
  end
end

# haga un test que pruebe que el metodo 'margen' calcule correctamente
#el margen de los productos en % (agregar el campo costo)

# haga un test para el metodo stock_status el cual retorna si un
#producto esta disponible en inventario (agregar el campo quantity)
