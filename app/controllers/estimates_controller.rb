class EstimatesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
  end

  def new
    respond_to do |format|
      format.html # 通常のHTMLフォーマットへの処理
      format.pdf do
        post_pdf = EstimatePdf::PostPdf.new().render
        send_data post_pdf,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
      end
    end

  end
end
