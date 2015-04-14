<p:declare-step version='1.0' name="main"
                xmlns:p="http://www.w3.org/ns/xproc"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:cx="http://xmlcalabash.com/ns/extensions"
                xmlns:sr="http://www.w3.org/2005/sparql-results#"
                exclude-inline-prefixes="c cx sr">
<p:output port="result"/>
<p:serialization port="result" indent="true"/>

<p:import href="../../../resources/library.xpl"/>

<cx:rdfa name="rdfa">
  <p:input port="source">
    <p:inline>
      <html xmlns="http://www.w3.org/1999/xhtml"
            vocab="http://schema.org/">
        <body>
          <p>
            <span id="ndw" typeof="Person">
              <a href="http://norman.walsh.name/knows/who/norman-walsh">
                <span property="name">
                  <span property="givenName">Norman</span>
                  <span property="familyName">Walsh</span>
                </span>
              </a>
            </span>
          </p>
        </body>
      </html>
    </p:inline>
  </p:input>
</cx:rdfa>

<cx:rdf-load href="foaf.rdf"/>

<cx:sparql>
  <p:input port="query">
    <p:inline>
      <c:data>
PREFIX s: &lt;http://schema.org/>
PREFIX foaf: &lt;http://xmlns.com/foaf/0.1/>

SELECT *
WHERE
{
  ?s s:givenName "Norman" .
  ?s foaf:nick "norm"
}
      </c:data>
    </p:inline>
  </p:input>
</cx:sparql>

<p:choose>
  <p:when test="contains(//sr:uri, 'norman-walsh')">
    <p:identity>
      <p:input port="source">
        <p:inline><c:result>PASS</c:result></p:inline>
      </p:input>
    </p:identity>
  </p:when>
  <p:otherwise>
    <p:error code="FAIL">
      <p:input port="source">
        <p:inline><message>Did not find expected text.</message></p:inline>
      </p:input>
    </p:error>
  </p:otherwise>
</p:choose>

</p:declare-step>
