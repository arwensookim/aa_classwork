require "towers_of_hanoi"

describe TowersOfHanoi do
    subject(:towers) { TowersOfHanoi.new }

    describe "#move" do
        it "raise an error when selected tower is empty" do
            expect {towers.move(2,3)}.to raise_error("Invalid move")
        end
        it "always allows moving disc to an empty tower" do
            expect {towers.move(0,1)}.not_to raise_error
        end
        it "takes the top disc off the tower" do
            towers.move(0,1)
            expect(towers.instance_variable_get("@stack")).to eq([[2,3],[1],[]])
        end
        it "moves disc to another tower" do
            towers.move(0,1)
            towers.move(0,2)
            towers.move(1,2)
            expect(towers.instance_variable_get("@stack")).to eq([[3],[],[1,2]])
        end
        it "does not allow moving disc on top of the smaller disc" do
            towers.move(0,1)
            expect {towers.move(0,1)}.to raise_error("Can not move disc on top of a smaller disc")
        end
    end

    describe "#won?" do
        it "return true when all discs are on the last tower"
        it "return false if the discs is not in order"
    end

    describe "#render" do 
        it "prints subtowers"
    end

end
