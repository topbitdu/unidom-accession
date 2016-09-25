# Unidom Accession 就职领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-accession.svg)](https://badge.fury.io/rb/unidom-accession)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Accession domain model engine includes Post Fullfillment and its relative models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。就职领域模型引擎包括岗位履行及其相关的模型。

## Recent Update
Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.

## Usage in Gemfile
```ruby
gem 'unidom-accession'
```

## Run the Database Migration
```shell
rake db:migrate
```
The migration versions start with 200405.

## Call the Model
```ruby
post_fulfillment = Unidom::Accession::PostFulfillment.valid_at.alive.first

post_fulfillment = Unidom::Accession::PostFulfillment.fulfill! fulfiller: fulfiller, fulfilled: post, opened_at: Time.now
# or like the following source codes, which opened_at is optional
post_fulfillment = Unidom::Accession::PostFulfillment.fulfill! fulfiller: fulfiller, fulfilled: post

part_time_fulfillments = Unidom::Accession::PostFulfillment.part_time.temporary(false) # all part time & permanent post fulfillments
temporary_fulfillments = Unidom::Accession::PostFulfillment.part_time(false).temporary # all full time & temporary post fulfillments
```

## Include the Concern
```ruby
include Unidom::Accession::Concerns::AsPostFulfilled
include Unidom::Accession::Concerns::AsPostFulfiller
```

### As Post Fulfilled concern
The As Post Fulfilled concern do the following tasks for the includer automatically:  
1. Define the has_many :post_fulfillments macro as: ``has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as: :fulfilled``  
2. Define the has_many :fulfiller_people macro as: ``has_many :fulfiller_people, through: :post_fulfillments, source: :fulfiller, source_type: 'Unidom::Party::Person'``  
3. Define the #is_fulfilled_as_post! method as: ``def is_fulfilled_as_post!(by: nil, at: Time.now)``
4. Define the #is_fulfilled_as_post? method as: ``def is_fulfilled_as_post?(by: nil, at: Time.now)``

### As Post Fulfiller concern
The As Post Fulfiller concern do the following tasks for the includer automatically:  
1. Define the has_many :post_fulfillments macro as: ``has_many :post_fulfillments, class_name: 'Unidom::Accession::PostFulfillment', as: :fulfiller``  
2. Define the has_many :fulfilled_posts macro as: ``has_many :fulfilled_posts, through: :post_fulfillments, source: :fulfilled, source_type: 'Unidom::Position::Post'``  
3. Define the #fulfill_post! method as: ``def fulfill_post!(post, at: Time.now)``
4. Define the #fulfill_post? method as: ``def fulfill_post?(post, at: Time.now)``
