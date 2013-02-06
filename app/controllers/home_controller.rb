class HomeController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @cards = Card.find(:all, :conditions => { :user_id => current_user.id })
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cards }
    end
  end
  
  def active_cards
    
    @lat = params[:lat].to_f
    @lon = params[:lon].to_f
    @latDelta = params[:latDelta].to_f
    @lonDelta = params[:lonDelta].to_f
    @show_all = params[:show]=='all'
    
    @lat_min = @lat - @latDelta
    @lat_max = @lat + @latDelta
    @lon_min = @lon - @lonDelta
    @lon_max = @lon + @lonDelta
    
    @has_error =
      (@lat == nil) || (@lon == nil) || (@latDelta == nil) || (@lonDelta == nil) ||
      (@lat == 0.0) || (@lon == 0.0) || (@latDelta == 0.0) || (@lonDelta == 0.0)
      
    begin
      # paramsが正しいと見越して検索開始
      if @show_all
        
        # 全部出す
        @cards = Card.find_all_by_active( true )
        
      elsif @has_error
        # 入力ミス
        @cards = []
        
      else
        # latitude 
        
        @cards = Card.where(
                          @lat_min.to_s + " < latitude" + " and " +
                          "latitude < " + @lat_max.to_s + " and " +
                          @lon_min.to_s + " < longitude" + " and " +
                          "longitude < " + @lon_max.to_s)
      end
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @cards }
      end
      
    rescue Exception => e
      
      # ダメだったら失敗文字列だけを出力
      render :json => {"message"=>e.to_s}
    end
  end
end
