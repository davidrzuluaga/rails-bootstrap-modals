require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

  test "get index is successful if user is authenticated" do
    sign_in users(:jc)
    get products_path
    assert_response :success
  end

  test "is redirected to login if user is not authenticated" do
    get products_path
    assert_response :redirect
  end

  test "post create: creates a product" do
    sign_in users(:jc)
    assert_difference 'Product.count', 1 do
      post products_path, params: { product: { name: "product 1", published: true, price: 369 } }
    end
    assert_redirected_to products_path
  end
end
