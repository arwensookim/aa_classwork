# require "tdd_projects"
# require "rspec"
# #Aim to have 2 - 3 test cases per method

# describe "#my_uniq" do
#     let(:array) { [1,2,1,3,3] }
#     let(:result) { Array.new }
#     before(:each) do 
#         expect(array).not_to receive(:uniq)
#     end
#     it "returns unique elements from the array" do 
#         expect(my_uniq(array)).to eq([1,2,3])
#     end

#     #test that it doesnt modify the original array
#     it "doesn't modify the original array" do 
#         my_uniq(array) {|ele| result << ele if !result.include?(ele) }
#         expect(array).to eq([1,2,1,3,3])
#     end
# end

# describe "Array#two_sum" do
#     it "should return indices where the elements at those positions sum to 0" do
#         expect([-1, 0, 2, -2].two_sum).to eq([[2,3]])
#     end
    
#     it "finds multiple pairs" do
#         expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]])
#     end
    
#     it "returns [] when no pair is found" do
#         expect([1,2,3,4].two_sum).to eq([])
#     end
    
#     it "returns array of pairs to be worted 'dictionary-wise'" do
#         expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]])
#     end
# end


# describe "#my_transpose" do
#     let(:rows) {[[0, 1, 2],[3, 4, 5],[6, 7, 8]]}
#     before(:each) do
#         expect(rows).not_to receive(:transpose)
#     end

#     it "should transpose the array" do
#         expect(my_transpose(rows)).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
#     end

#     it "should not modify the original array" do
#         expect(rows).to eq([[0, 1, 2],[3, 4, 5],[6, 7, 8]])
#     end

# end

# describe "#stock_picker" do 
#     let(:prices) { {"Monday"=>70, "Tuesday"=>65, "Wednesday"=>80, "Thursday"=>110, "Friday"=>50} }
#     it "returns the two days that has the most profit" do 
#         expect(stock_picker(prices)).to eq(["Tuesday","Thursday"])
#     end
#     it "returns the earlier day first" do
#         expect(stock_picker(prices)).not_to eq(["Friday","Thursday"])
#     end
# end

