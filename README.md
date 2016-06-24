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
Unidom::Accession::PostFulfillment.fulfill! fulfiller, post
```
