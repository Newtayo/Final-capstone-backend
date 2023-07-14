require 'application_system_test_case'

class LaptopsTest < ApplicationSystemTestCase
  setup do
    @laptop = laptops(:one)
  end

  test 'visiting the index' do
    visit laptops_url
    assert_selector 'h1', text: 'Laptops'
  end

  test 'should create laptop' do
    visit laptops_url
    click_on 'New laptop'

    fill_in 'Description', with: @laptop.description
    fill_in 'Image url', with: @laptop.image_url
    fill_in 'Model year', with: @laptop.model_year
    fill_in 'Name', with: @laptop.name
    fill_in 'Price', with: @laptop.price
    fill_in 'Ram size', with: @laptop.ram_size
    fill_in 'Rom size', with: @laptop.rom_size
    click_on 'Create Laptop'

    assert_text 'Laptop was successfully created'
    click_on 'Back'
  end

  test 'should update Laptop' do
    visit laptop_url(@laptop)
    click_on 'Edit this laptop', match: :first

    fill_in 'Description', with: @laptop.description
    fill_in 'Image url', with: @laptop.image_url
    fill_in 'Model year', with: @laptop.model_year
    fill_in 'Name', with: @laptop.name
    fill_in 'Price', with: @laptop.price
    fill_in 'Ram size', with: @laptop.ram_size
    fill_in 'Rom size', with: @laptop.rom_size
    click_on 'Update Laptop'

    assert_text 'Laptop was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Laptop' do
    visit laptop_url(@laptop)
    click_on 'Destroy this laptop', match: :first

    assert_text 'Laptop was successfully destroyed'
  end
end
