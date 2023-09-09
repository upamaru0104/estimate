class EstimatesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
  end

  def new
    @estimate_product = EstimateProduct.new
  end

  def create
    @estimate_product = EstimateProduct.new(estimate_product_params)
    date_change
    respond_to do |format|
      format.pdf do
        if @estimate_product.save
          post_pdf = EstimatePdf::PostPdf.new(@estimate_product)
          send_data post_pdf.render,
          filename: "#{estimate_product.estimate_number}.pdf", # 作成されるファイル名を見積書番号に変更する
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
        else
          render :new
        end
      end
    end
  end

  private

  def estimate_product_params
    params.require(:estimate_product).permit(:estimate_number, :estimate_date, :company_name, :total_price, :ancestry, :quantity).merge(user_id: current_user.id)
  end

  def date_change
    date_obj = Date.today
    date_str = date_obj.strftime("%Y年%m月%d日")
    @estimate_product.estimate_date = date_str
  end

end
