class EstimatesController < ApplicationController
   before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
  end

  def new
    @estimate_product = EstimateProduct.new
    @estimate_item = EstimateItem.new
    @parents = EstimateItem.all.order("id ASC").limit(3)
  end

  def search
    item = EstimateItem.find(params[:id])
    children_item = item.children
    render json:{ item: children_item }
  end


  def create
  @estimate_product = EstimateProduct.new(estimate_product_params)
    if @estimate_product.save
      post_pdf = EstimatePdf::PostPdf.new(@estimate_product, current_user)
      send_data post_pdf.render,
      filename: "#{@estimate_product.estimate_number}.pdf", # 作成されるファイル名を見積書番号に変更する
      type: 'application/pdf',
      disposition: 'inline' # 外すとダウンロード
    else
      render :new
    end
  end

  private

  def estimate_product_params
    params.require(:estimate_product).permit(:estimate_number, :company_name, :total_price, :quantity).merge(user_id: current_user.id)
  end

end
