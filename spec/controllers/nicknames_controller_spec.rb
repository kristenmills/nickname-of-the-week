require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe NicknamesController do

  # This should return the minimal set of attributes required to create a valid
  # Nickname. As you add validations to Nickname, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NicknamesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all nicknames as @nicknames" do
      nickname = Nickname.create! valid_attributes
      get :index, {}, valid_session
      assigns(:nicknames).should eq([nickname])
    end
  end

  describe "GET show" do
    it "assigns the requested nickname as @nickname" do
      nickname = Nickname.create! valid_attributes
      get :show, {:id => nickname.to_param}, valid_session
      assigns(:nickname).should eq(nickname)
    end
  end

  describe "GET new" do
    it "assigns a new nickname as @nickname" do
      get :new, {}, valid_session
      assigns(:nickname).should be_a_new(Nickname)
    end
  end

  describe "GET edit" do
    it "assigns the requested nickname as @nickname" do
      nickname = Nickname.create! valid_attributes
      get :edit, {:id => nickname.to_param}, valid_session
      assigns(:nickname).should eq(nickname)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Nickname" do
        expect {
          post :create, {:nickname => valid_attributes}, valid_session
        }.to change(Nickname, :count).by(1)
      end

      it "assigns a newly created nickname as @nickname" do
        post :create, {:nickname => valid_attributes}, valid_session
        assigns(:nickname).should be_a(Nickname)
        assigns(:nickname).should be_persisted
      end

      it "redirects to the created nickname" do
        post :create, {:nickname => valid_attributes}, valid_session
        response.should redirect_to(Nickname.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved nickname as @nickname" do
        # Trigger the behavior that occurs when invalid params are submitted
        Nickname.any_instance.stub(:save).and_return(false)
        post :create, {:nickname => { "name" => "invalid value" }}, valid_session
        assigns(:nickname).should be_a_new(Nickname)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Nickname.any_instance.stub(:save).and_return(false)
        post :create, {:nickname => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested nickname" do
        nickname = Nickname.create! valid_attributes
        # Assuming there are no other nicknames in the database, this
        # specifies that the Nickname created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Nickname.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => nickname.to_param, :nickname => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested nickname as @nickname" do
        nickname = Nickname.create! valid_attributes
        put :update, {:id => nickname.to_param, :nickname => valid_attributes}, valid_session
        assigns(:nickname).should eq(nickname)
      end

      it "redirects to the nickname" do
        nickname = Nickname.create! valid_attributes
        put :update, {:id => nickname.to_param, :nickname => valid_attributes}, valid_session
        response.should redirect_to(nickname)
      end
    end

    describe "with invalid params" do
      it "assigns the nickname as @nickname" do
        nickname = Nickname.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Nickname.any_instance.stub(:save).and_return(false)
        put :update, {:id => nickname.to_param, :nickname => { "name" => "invalid value" }}, valid_session
        assigns(:nickname).should eq(nickname)
      end

      it "re-renders the 'edit' template" do
        nickname = Nickname.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Nickname.any_instance.stub(:save).and_return(false)
        put :update, {:id => nickname.to_param, :nickname => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested nickname" do
      nickname = Nickname.create! valid_attributes
      expect {
        delete :destroy, {:id => nickname.to_param}, valid_session
      }.to change(Nickname, :count).by(-1)
    end

    it "redirects to the nicknames list" do
      nickname = Nickname.create! valid_attributes
      delete :destroy, {:id => nickname.to_param}, valid_session
      response.should redirect_to(nicknames_url)
    end
  end

end