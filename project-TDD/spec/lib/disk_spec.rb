require 'disk'
describe Disk do
  it "creates a disk" do
    disk = Disk.new(:blue)
    expect(disk.color).to eq(:blue)
  end
end
