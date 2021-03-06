class CreatePublicationsData < ActiveRecord::Migration
  def self.up
    Publication.create(:name => 'Fairfax Your Weekend')
    Publication.create(:name => 'Waikato Times')
    Publication.create(:name => 'AA Directions')  
    Publication.create(:name => 'Alive')
    Publication.create(:name => 'Art News New Zealand')
    Publication.create(:name => 'B-Guided')
    Publication.create(:name => 'Business Day')
    Publication.create(:name => 'Canvas')
    Publication.create(:name => 'Country Channel')
    Publication.create(:name => 'Cuisine')
    Publication.create(:name => 'Her')
    Publication.create(:name => 'Herald Cars')
    Publication.create(:name => 'Dominion-Post')
    Publication.create(:name => 'Herald Homes')
    Publication.create(:name => 'Fairfax')
    Publication.create(:name => 'Fairfax Australia')    
    Publication.create(:name => 'Home New Zealand')
    Publication.create(:name => 'Idealog')
    Publication.create(:name => 'Herald Jobs')
    Publication.create(:name => 'Herald on Sunday')
    Publication.create(:name => 'Kia Ora')
    Publication.create(:name => 'NBR')
    Publication.create(:name => 'Life & Leisure')
    Publication.create(:name => 'Manawatu Standard')
    Publication.create(:name => 'Maori TV')
    Publication.create(:name => 'Metro')
    Publication.create(:name => 'Next')
    Publication.create(:name => 'North & South') 
    Publication.create(:name => 'Nelson Mail')
    Publication.create(:name => 'New Zealand Gardener')
    Publication.create(:name => 'New Zealand Home + Entertaining')   
    Publication.create(:name => 'NZ Herald')
    Publication.create(:name => 'NZ House & Garden')  
    Publication.create(:name => 'Northern Advocate')
    Publication.create(:name => 'NZ Gardener')
    Publication.create(:name => 'NZ Geographic')  
    Publication.create(:name => 'NZPA')
    Publication.create(:name => 'Otago Daily Times')
    Publication.create(:name => 'NZ Listener')
    Publication.create(:name => 'NZ Opera News')
    Publication.create(:name => 'NZ Trends')   
    Publication.create(:name => 'Sunday Star-Times')
    Publication.create(:name => 'Scoop')
    Publication.create(:name => 'Simply Young Living')
    Publication.create(:name => 'Southland Times')
    Publication.create(:name => 'Spasifik')
    Publication.create(:name => 'Stuff')  
    Publication.create(:name => 'The Press')
    Publication.create(:name => 'TV3')
    Publication.create(:name => 'Taranaki Daily News')
    Publication.create(:name => 'The Business Herald')
    Publication.create(:name => 'Viva')
    Publication.create(:name => 'TV3 Sunrise')
    Publication.create(:name => 'TVNZ')
    Publication.create(:name => 'Uno')    
    Publication.create(:name => 'Waikato Times TV Week')  
    Publication.create(:name => 'Waikato Times House & Lifestyle')
    Publication.create(:name => 'Waikato Times Motortimes')
    Publication.create(:name => 'Waikato Times Tempo')
    Publication.create(:name => 'Waikato Times Your Weekend')
    Publication.create(:name => 'Wairarapa Times-Age')   
    Publication.create(:name => 'Wine NZ')  
    Publication.create(:name => 'Wanganui Chronicle')
    Publication.create(:name => 'Whakatane Beacon')
    Publication.create(:name => 'Wilderness')  
    Publication.create(:name => 'World Luxury Collections')
    Publication.create(:name => 'Your Home & Garden')
  end

  def self.down
    Publication.delete_all
  end
end
