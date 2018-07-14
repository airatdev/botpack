describe Botpack::Responder do
  describe "#respond" do
    subject { described_class.new(double, message) }

    after do
      subject.respond
    end

    context "when answer is found" do
      class FooAnswer < Botpack::Answer
        condition do
          message.end_with?("foo")
        end

        responses ["bar"]
      end

      let(:message) { double(text: "foo") }

      it "sends a message" do
        expect(subject).to receive(:send_message).with("bar")
        expect(subject).to receive(:track).with("fooanswer")
      end

      context "when chance didn't proc" do
        before { allow(ENV).to receive(:[]).with("CHANCE").and_return("0") }

        it "doesn't do anything" do
          expect(subject).not_to receive(:send_message)
          expect(subject).not_to receive(:track)
        end
      end
    end

    context "when answer is not found" do
      let(:message) { double(text: "123") }

      it "doesn't do anything" do
        expect(subject).not_to receive(:send_message)
        expect(subject).not_to receive(:track)
      end
    end
  end
end
