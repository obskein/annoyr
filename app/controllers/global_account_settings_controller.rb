class GlobalAccountSettingsController < ApplicationController
  # GET /global_account_settings
  # GET /global_account_settings.xml
  def index
    @global_account_settings = GlobalAccountSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @global_account_settings }
    end
  end

  # GET /global_account_settings/1
  # GET /global_account_settings/1.xml
  def show
    @global_account_setting = GlobalAccountSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @global_account_setting }
    end
  end

  # GET /global_account_settings/new
  # GET /global_account_settings/new.xml
  def new
    @global_account_setting = GlobalAccountSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @global_account_setting }
    end
  end

  # GET /global_account_settings/1/edit
  def edit
    @global_account_setting = GlobalAccountSetting.find(params[:id])
  end

  # POST /global_account_settings
  # POST /global_account_settings.xml
  def create
    @global_account_setting = GlobalAccountSetting.new(params[:global_account_setting])

    respond_to do |format|
      if @global_account_setting.save
        format.html { redirect_to(@global_account_setting, :notice => 'Global account setting was successfully created.') }
        format.xml  { render :xml => @global_account_setting, :status => :created, :location => @global_account_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @global_account_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /global_account_settings/1
  # PUT /global_account_settings/1.xml
  def update
    @global_account_setting = GlobalAccountSetting.find(params[:id])

    respond_to do |format|
      if @global_account_setting.update_attributes(params[:global_account_setting])
        format.html { redirect_to(@global_account_setting, :notice => 'Global account setting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @global_account_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /global_account_settings/1
  # DELETE /global_account_settings/1.xml
  def destroy
    @global_account_setting = GlobalAccountSetting.find(params[:id])
    @global_account_setting.destroy

    respond_to do |format|
      format.html { redirect_to(global_account_settings_url) }
      format.xml  { head :ok }
    end
  end
end
