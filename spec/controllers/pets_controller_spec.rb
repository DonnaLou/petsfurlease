require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  def make_roger
      Pet.create(user_id: 1, name: "Roger", species: 'Rabbit', breed: 'Cartoon', age: 36, details: 'Married to Jessica')
  end

  describe "GET show" do
    it "redirects to the show view" do

      # Setup
      roger = make_roger

      # Act
      get :show, id: roger.id

      # Assert
      expect(response).to render_template('show')
    end

    it "assigns the new pet to the instance variable" do

      # Setup
      roger = make_roger

      # Act
      get :show, id: roger.id

      expect(assigns(:pet)).to eq(roger)

      # Fine, it's assigned, but did our params make it through?
      # Let's choose one at random:
      expect(assigns(:pet).age).to eq(roger.age)
    end
  end

  describe "DELETE pet" do
    it "deletes the @pet instance" do

      # Arrange
      roger = make_roger

      # Act/Assert

      expect {
        delete :destroy, id: roger
      }.to change(Pet,  :count).by(-1)
    end

  end

end
