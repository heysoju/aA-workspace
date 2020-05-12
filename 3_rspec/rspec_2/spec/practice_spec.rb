require "practice"

describe Array do

    describe "#uniq" do
        it "removes duplicates from array" do
            expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
            expect([1].my_uniq).to eq([1])
        end
    end

    describe "#two_sum" do
        it "returns an array of paired positions that equal to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    describe "#my_transpose" do
        it "switches the orientation of columns and rows" do
            expect([[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
        end
    end

    describe "#stock_picker" do
        it "picks the single pair of indexes with best profit" do
            expect([2, 3, 5, 1, 9, 1, 8].stock_picker).to eq([3, 4])
            expect([2, 3, 5, 1, 9, 1, 10].stock_picker).to eq([[3, 6], [5, 6]])
            expect([2, 3, 5, 1, 9, 1, 1, 10].stock_picker).to eq([[3, 7], [5, 7], [6, 7]])
        end
    end

end
