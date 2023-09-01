# app/prawn/estimate_pdf/post_pdf.rb

module EstimatePdf
  class PostPdf < Prawn::Document

    def initialize
      super(page_size: 'A4') # 新規PDF作成
      stroke_axis # 座標を表示

       header

      cols = [
        ['banana', 'apple', 'peach'],
        ['kiwi', 'grape', ''],
        ['cherry', 'watermelon', '']
      ]
      table cols

      image 'app/assets/images/test_image.png', at: [10, 200]
    end

    def header
      font FONT_Regular
      text_box 'ヘッダー'

      font FONT_Bold
      text_box 'ヘッダー', at: [0, 730], size: 10

      font FONT_Extra_Light
      text_box 'ヘッダー', at: [0, 700], size: 20

      font FONT_Heavy
      text_box 'ヘッダー', at: [0, 650], size: 30

      font FONT_Light
      text_box 'ヘッダー', at: [0, 600], size: 40

      font FONT_Medium
      text_box 'ヘッダー', at: [0, 550], size: 50

      font FONT_Normal
      text_box 'ヘッダー', at: [0, 500], size: 60
    end
  end
end