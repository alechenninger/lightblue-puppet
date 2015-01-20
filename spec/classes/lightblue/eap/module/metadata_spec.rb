require 'spec_helper'

describe 'lightblue::eap::module::metadata' do

  let(:hiera_config){ 'spec/fixtures/hiera/hiera.yaml' }

  let :params do
    {
      :directory => '/tmp'
    }
  end

  context 'lightblue-metadata.json' do

    describe 'defaults' do
      it do
        should contain_file("/tmp/lightblue-metadata.json") \
          .with({
              'ensure'  => 'file',
              'owner'   => 'jboss',
              'group'   => 'jboss',
              'mode'    => '0644'
            }
          ) \
          .with_content(/"documentation":/) \
          .with_content(/"type":/) \
          .without_content(/"hookConfigurationParsers":/) \
          .without_content(/"roleMap":/) \
          .without_content(/"backend_parsers":/) \
          .without_content(/"property_parsers":/) \
          .with_content(/"dataSource": "metadata",/) \
          .with_content(/"collection": "metadata"/)
      end
    end

    describe 'roleMap' do
      it do
        let :params do
          {
            :metadata_roles => {
                :'metadata.find.dependencies' => 'find.dependencies',
                :'metadata.find.roles' => 'find.roles',
                :'metadata.find.entityNames' => 'find.entityNames',
                :'metadata.find.entityVersions' => 'find.entityVersions',
                :'metadata.find.entityMetadata' => 'find.entityMetadata',
                :'metadata.insert' => 'insert',
                :'metadata.insert.schema' => 'insert.schema',
                :'metadata.update.entityInfo' => 'update.entityInfo',
                :'metadata.update.schemaStatus' => 'update.schemaStatus',
                :'metadata.update.defaultVersion' => 'update.defaultVersion',
                :'metadata.delete.entity' => 'delete.entity'
            }
          }
        end

        should contain_file("/tmp/lightblue-metadata.json") \
          .with({
              'ensure'  => 'file',
              'owner'   => 'jboss',
              'group'   => 'jboss',
              'mode'    => '0644'
            }
          ) \
          .with_content(/"documentation":/) \
          .with_content(/"type":/) \
          .without_content(/"hookConfigurationParsers":/) \
          .without_content(/"roleMap":/) \
          .without_content(/"backend_parsers":/) \
          .without_content(/"property_parsers":/) \
          .with_content(/"dataSource": "metadata",/) \
          .with_content(/"collection": "metadata"/)
      end
    end
  end

end
