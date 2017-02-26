# Unidom Accession Roadmap 就职领域模型引擎路线图

## v0.1
1. Post Fulfillment model & migration (20040501000000)

## v1.0
1. Improve the models to support the Keyword Arguments

## v1.1
1. As Post Fulfilled concern
2. As Post Fulfiller concern

## v1.2
1. Improve the As Post Fulfilled concern to add the ``has_many :post_fulfillments`` macro
2. Improve the As Post Fulfilled concern to add the ``has_many :fulfilled_posts`` macro

## v1.3
1. Improve the As Post Fulfilled concern to add the #``is_fulfilled_as_post!`` method
2. Improve the As Post Fulfiller concern to add the #``fulfill_post!`` method

## v1.3.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v2.0
1. Improve the As Post Fulfilled concern for the #``is_fulfilled_as_post!`` method
2. Improve the As Post Fulfiller concern for the #``fulfill_post!`` method

## v2.1
1. Improve the As Post Fulfilled concern to add the #``is_fulfilled_as_post?`` method
2. Improve the As Post Fulfiller concern to add the #``fulfill_post?`` method

## v2.2
1. Improve the Post Fulfillment model to add the .part_time scope & the .temporary scope

## v2.2.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v2.2.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v2.2.3
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1

## v2.2.4
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improve the Engine class to include the Engine Extension concern

## v2.2.5
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improve the models to support the namespace neglecting

## v2.3
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v2.3.1
1. Improve the Post Fulfillment spec for the ``part_time`` scope, & the temporary scope

## v2.4
1. Improve the As Post Fulfilled concern for the #is_fulfilled_as_post! method to support the NoSQL columns
2. Improve the As Post Fulfiller concern for the #fulfill_post! method to support the NoSQL columns
3. Improve the Post Fulfillment model for the .fulfill! method to support the NoSQL columns
