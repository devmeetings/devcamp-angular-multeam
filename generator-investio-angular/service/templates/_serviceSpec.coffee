describe('<%= projectName %> <%= name %> service', () ->
  beforeEach(module('<%= servicesModuleName %>', () ->
    
  ))

  it('should have a dummy test', inject(() ->
    expect(true).toBeTruthy()
  ))
)