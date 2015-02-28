<p:library xmlns:p="http://www.w3.org/ns/xproc"
           xmlns:cx="http://xmlcalabash.com/ns/extensions"
           version="1.0">

<p:declare-step type="cx:rdfa">
   <p:input port="source"/>
   <p:output port="result" sequence="true"/>
   <p:option name="max-triples-per-document" select="100"/>
</p:declare-step>

<p:declare-step type="cx:rdf-load">
  <p:input port="source" sequence="true"/>
  <p:output port="result" sequence="true"/>
  <p:option name="href" required="true"/>
  <p:option name="language"/>
  <p:option name="graph"/>
  <p:option name="max-triples-per-document" select="100"/>
</p:declare-step>

<p:declare-step type="cx:rdf-store">
  <p:input port="source" sequence="true"/>
  <p:output port="result" primary="false"/>
  <p:option name="href"/>
  <p:option name="language"/>
  <p:option name="graph"/>
</p:declare-step>

<p:declare-step type="cx:sparql">
  <p:input port="source" sequence="true" primary="true"/>
  <p:input port="query"/>
  <p:output port="result" sequence="true"/>
</p:declare-step>

</p:library>
