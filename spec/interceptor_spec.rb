require 'spec_helper'

describe Interceptor do
  it 'has a version number' do
    expect(Interceptor::VERSION).not_to be nil
  end

  describe ".intercept" do
    subject { Repository }

    context "passed" do
      let(:args) { { status: "yiss" } }

      it do
        expect(subject).to receive(:save).with(args)
        subject.save(args)
      end
    end

    context "intercepted" do
      let(:args) { {} }

      it { expect(subject.save(args)).to be_nil }
    end
  end
end
