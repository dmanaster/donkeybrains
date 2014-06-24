class CertificatePdf < Prawn::Document

  def initialize(certificate)
    background = "#{Rails.root}/app/assets/images/parchment.jpg"
    super(left_margin: 7, top_margin: 7, right_margin: 7, :page_layout => :landscape, :page_size => "LETTER", :background => background)
    @certificate = certificate
    draw_top_bar
    draw_gold_bar
    insert_logo
    write_text
    insert_seal
    insert_president_signature
    insert_psychiatrist_signature
  end

  # Page dimensions: 792 x 612
  def draw_top_bar
    fill_color "000000"
    fill { rectangle [0, 565], 778, 80 }    
    fill_color "FFFFFF"
    text_box "#{@certificate.institution.upcase}",:at => [0, 540] , :height => 36, :width => 778, :align => :center, :size => 36, :overflow => :shrink_to_fit, :character_spacing => 4
  end

  def draw_gold_bar
    fill_color "785B23"
    fill { rectangle [0, 478], 778, 5 }    
  end

  def insert_logo
    logo = "#{Rails.root}/app/assets/images/medical_symbol.png"
    image logo, :position => :center, :vposition => 70, :scale => 0.35
  end

  def write_text
    fill_color "000000"
    move_down 85
    font "#{Rails.root}/app/assets/fonts/adine_kirnberg.ttf" 
    text "By Power of the Commonwealth of #{@certificate.state}", :align => :center, :size => 30
    text "#{@certificate.institution}", :align => :center, :size => 44
    text "hereby decrees", :align => :center, :size => 30
    font "#{Rails.root}/app/assets/fonts/olde_english_regular.ttf"
    text "#{@certificate.name}", :align => :center, :size => 50
    font "#{Rails.root}/app/assets/fonts/adine_kirnberg.ttf"
    text "to not have", :align => :center, :size => 30
    text '" Donkey Brains"', :align => :center, :size => 36
  end

  def insert_seal
    seal = "#{Rails.root}/app/assets/images/achievement.png"
    image seal, :at => [570, 280], :scale => 0.12

  end

  def insert_president_signature
    font "#{Rails.root}/app/assets/fonts/sweetly_broken.ttf"
    text_box "#{@certificate.president}", :align => :center, :size => 36, :at => [50, 90], width: 200
    font "Helvetica"
    text_box "#{@certificate.president} \n President, \n #{@certificate.institution}", :align => :center, :size => 12, :at => [50, 50], width: 200
  end

  def insert_psychiatrist_signature
    font "#{Rails.root}/app/assets/fonts/saint_andrews_queen.ttf"
    text_box "#{@certificate.psychiatrist}", :align => :center, :size => 30, :at => [500, 75], width: 200
    font "Helvetica"
    text_box "#{@certificate.psychiatrist} \n Attending Psychiatrist, \n #{@certificate.institution}", :align => :center, :size => 12, :at => [500, 50], width: 200
  end

end