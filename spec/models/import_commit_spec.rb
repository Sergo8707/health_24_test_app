require 'rails_helper'

RSpec.describe ImportCommit, type: :model do
  describe '#import!' do
    let(:import) { ImportCommit.new('Sergo8707', 'tutuapp').import_commits! }
    it 'should  receive get for RestClient class' do
      expect(RestClient).to receive(:get).with("https://api.github.com/repos/Sergo8707/tutuapp/commits?page=1")
      import
    end

    it 'should receive parse for JSON class' do
      expect(JSON).to receive(:parse)
      import
    end

    it 'should receive destroy_all for User class' do
      expect(User).to receive(:destroy_all)
      import
    end

    it 'should save all commits in the database' do
      import
      expect(Commit.all.size).to eq(88)
    end
  end
end
