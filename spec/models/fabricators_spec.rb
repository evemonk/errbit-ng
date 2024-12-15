# frozen_string_literal: true

Fabrication::Config.fabricator_path.each do |folder|
  Dir.glob(Rails.root.join(folder, "**", "*.rb").to_s).each do |file|
    require file
  end
end

RSpec.describe "Fabrication", type: :model do
  # TODO : when 1.8.7 drop support se directly Symbol#sort
  Fabrication.manager.schematics.keys.sort.each do |fabricator_name|
    context "Fabricate(:#{fabricator_name})" do
      subject { Fabricate.build(fabricator_name) }

      it { is_expected.to be_valid }
    end
  end
end
