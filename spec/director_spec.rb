# require "spec_helper"

# describe Director do
#   let(:director) { Director.new }

#   it "initializes" do
#   end

#   describe "command()" do
#     context "PLACE" do
#       context "valid" do
#       	let(:command) { "PLACE 1,2,WEST" }

#         it "places the toy robot" do
#           expect(director.command(command)).to eq("The toy robot was successfully placed at [1,2] facing WEST")
#         end
#       end

#       context "invalid" do
#       end
#     end

#     context "MOVE" do
#       context "valid" do
#         before { director.command("PLACE 1,2,WEST") }
        
#         let(:command) { "MOVE" }

#         it "places the toy robot one block forward towards its direction" do
#           expect(director.command(command)).to eq("The toy robot was successfully placed at [1,2] facing WEST")
#         end
#       end

#       context "invalid" do
#       end
#     end
#   end
# end
