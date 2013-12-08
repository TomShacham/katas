require 'codewars_ranking_system'

describe User do

  let(:user) {User.new}

  context 'new user' do

    it 'initializes with a rank of -8' do
      expect(user.rank).to eq(-8)
    end

    it 'has zero progress to start off with' do
      expect(user.progress).to be_zero
    end

  end

  context 'completing katas' do

    context 'increase progress within level' do

      it 'should increase progress by 3 completing same level kata' do
        user.inc_progress(-8)
        expect(user.progress).to eq(3)
      end

      it 'should increase progress by 10 for next level kata' do
        user.inc_progress(-7)
        expect(user.progress).to eq(10)
      end

      it 'should increase progress by 40 for next level kata' do
        user.inc_progress(-6)
        expect(user.progress).to eq(40)
      end

      it 'should increase progress by 90 for next level kata' do
        user.inc_progress(-5)
        expect(user.progress).to eq(90)
      end

    end

    context 'progressing ranks' do

      it 'expect rank to go up by one when progress exceeds 100' do
        user.inc_progress(-4)
        expect(user.rank).to be -7
      end

      it 'expect rank to be -2' do
        user.inc_progress(1)
        expect(user.rank).to be -2
      end

      it 'expect progress to be 60 when 4 level difference kata completed' do
        user.inc_progress(-4)
        expect(user.progress).to be 60
      end

    end

    context 'completing multiple katas and having corrent rank and progress, esp beyond 0 rank' do

      it 'progress should be 40 after completing a 1 then 2' do
        user.inc_progress(1)
        user.inc_progress(2)
        expect(user.progress).to be 30
      end

      it 'progress should be 61 after completing a -4 then -8' do
        user.inc_progress(-4)
        user.inc_progress(-8)
        expect(user.progress).to be 61
      end

      it 'rank should be 7 after completing a 5 then 4' do
        user.inc_progress(5)
        user.inc_progress(4)
        expect(user.rank).to be 7
      end

      it 'progress should be 41 after completing a 5 then 4' do
        user.inc_progress(5)
        user.inc_progress(6)
        expect(user.progress).to be 41
      end

    end

  end

end