describe('<%= projectName %> <%= name %> filter', () ->
  beforeEach(module('<%= filtersModuleName %>', () ->
    
  ))

  it('should have a dummy test', inject(() ->
    expect(true).toBeTruthy()
  ))
)