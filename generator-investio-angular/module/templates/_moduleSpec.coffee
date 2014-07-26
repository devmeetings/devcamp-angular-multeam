describe('<%= projectName %> <%= projectModuleName %>.<%= name %> module', ()->
  beforeEach(module('<%= projectModuleName %>.<%= name %>', () ->
    
  ))

  it('should have a dummy test', inject(() ->
    expect(true).toBeTruthy()
  ))
)