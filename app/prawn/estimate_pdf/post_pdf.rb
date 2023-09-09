# app/prawn/estimate_pdf/post_pdf.rb

module EstimatePdf
  class PostPdf < Prawn::Document

    def initialize(estimate_product)
      super(
        page_size: 'A4',
        top_margin: 40,
        bottom_margin: 30,
        right_margin: 20,
        left_margin: 20
      ) # 新規PDF作成
      # stroke_axis # 座標を表示
      @estimate_product = estimate_product

      header
      total_place

      move_down 20
      contents
    end

    def header
      font FONT_Medium
      text_box '見積書', :align => :center, size: 30

      font FONT_Light
      text_box @estimate_product.company_name, at: [0, 700], size: 20
      text_box '下記の通り、お見積り申し上げます。', at: [0, 670], size: 10

      bounding_box([0,650], :width=>200,:height=>100) do
        rows = [
          ["件名","何かのプロジェクト"],
          ["納期","2022/04/30"],
          ["支払条件","月末締翌月末払"],
          ["有効期限","御見積後2週間"],
        ]
        table rows do
          # 1列目はセンター寄せ
          columns(0).align = :center
          # 1列目の背景色をff7500に
          columns(0).background_color = 'ff7500'
        end
      end

      bounding_box([355, 690], :width => 200, :height => 100) do
        text_box @estimate_product.estimate_number, :align => :right, size: 12
        text_box @estimate_product.estimate_date,:at => [0, 85], :align => :right, size: 12
      end

      bounding_box([360, 650], :width => 200, :height => 100) do
        text_box "どこかの株式会社",:at => [20, 100]
        text_box "〒000-0000",:at => [20, 85]
        text_box "住所は日本のどこか",:at => [20, 70]
        text_box "どこかの番地",:at => [20, 55]
        text_box "TEL:012-3456-7891",:at => [20, 40]
        text_box current_user.name,:at => [20, 25]
      end

    end

    def total_place
      bounding_box([10,530], :width=>300,:height=>50) do
        rows = [
          ["合計",@estimate_product.total_place+"(税込)"]
        ]
        table rows, cell_style: { height: 50, width: 200, padding: 13 , size: 20} do
          # 1列目はセンター寄せ
          columns(0).align = :center
          columns(1).align = :center
          # 1列目の背景色をff7500に
          columns(0).background_color = 'ff7500'
          # 1列目の横幅を30に
          columns(0).width = 80
          columns(1).width = 200
        end
      end
    end

    def contents
      rows = [
        [{ content: "摘要", width: 250 },{content: "数量", width: 50 },{content: "単位", width: 50 },{content: "単価", width: 100 },{content: "金額", width: 100 },],
        # 21行
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
        ["","","","",""],
      ]
      table rows, cell_style: { height: 20, padding: 3, position: :center} do
        rows(0).align = :center
        rows(0).background_color = 'ff7500'
      end
    end
  end
end