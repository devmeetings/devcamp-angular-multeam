describe('<%= projectName %> <%= name %> directive', () ->
  beforeEach(module('<%= directivesModuleName %>', () ->
    
  ))

  it('should have a dummy test', inject(() ->
    expect(true).toBeTruthy()
  ))
)