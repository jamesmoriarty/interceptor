require 'spec_helper'

describe 'MethodInterceptor module' do
  describe 'is namespaced under the class' do
    subject { Model }

    it do
      expect(subject.ancestors).to include Model::MethodInterceptor
    end
  end

  describe 'lists the methods it owns' do
    subject { Model::MethodInterceptor }

    it do
      expect(subject.to_s).to eq 'MethodInterceptor(save, create)'
    end

    describe 'even when reopened and re-intercepted' do
      before do
        class Model
          intercept(:build) { true }

          def build
            :build
          end
        end
      end

      subject { Model::MethodInterceptor }

      it { expect(subject.to_s).to eq 'MethodInterceptor(save, create, build)' }
    end
  end
end
