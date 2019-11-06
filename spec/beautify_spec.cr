require "./spec_helper"

describe Beautify do
  it "beautifies js" do
    js = "if ('this_is'==/an_example/){of_beautifier();}else{var a=b?(c%d):e[f];}"
    result = "if ('this_is' == /an_example/) {\n    of_beautifier();\n} else {\n    var a = b ? (c % d) : e[f];\n}"
    Beautify.js(js).should eq result
  end

  it "beautifies html" do
    html = "<!DOCTYPE html><html><body><h1>My First Heading</h1><p>My first paragraph.</p></body></html>"
    result = "<!DOCTYPE html>\n<html>\n\n<body>\n    <h1>My First Heading</h1>\n    <p>My first paragraph.</p>\n</body>\n\n</html>"
    Beautify.html(html).should eq result
  end

  it "beautifies css" do
    css = "p.smallcaps{font-variant:small-caps}"
    result = "p.smallcaps {\n    font-variant: small-caps\n}"
    Beautify.css(css).should eq result
  end
end
