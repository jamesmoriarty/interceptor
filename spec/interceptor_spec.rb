require 'spec_helper'

describe Interceptor do
  it 'has a version number' do
    expect(Interceptor::VERSION).not_to be nil
  end

  describe ".intercept" do
    subject { Repository }

    context "passed" do
      let(:args) { { status: :yiss } }

      it { expect(subject.save(args)).to eq args }

      it do
        expect(subject).to receive(:save).with(args)
        subject.save(args)
      end
    end

    context "intercepted" do
      let(:args) { {} }

      it { expect(subject.save(args)).to be_nil }
    end

    context "multiple interceptors" do
      before do
        class Repository
          class << self
            intercept(:save) do |attributes|
              attributes.values.include?(:yisss)
            end
          end
        end
      end

      it { expect(subject.save({})).to be_nil }
      it { expect(subject.save(status: :yiss)).to be_nil }
      it { expect(subject.save(status: :yisss)).to eq(status: :yisss) }
    end
  end
end
