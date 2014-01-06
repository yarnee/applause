/*
* generated by Xtext
*/
package org.applause.lang.ui.contentassist.antlr;

import java.util.Collection;
import java.util.Map;
import java.util.HashMap;

import org.antlr.runtime.RecognitionException;
import org.eclipse.xtext.AbstractElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.AbstractContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.FollowElement;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;

import com.google.inject.Inject;

import org.applause.lang.services.ApplauseDslGrammarAccess;

public class ApplauseDslParser extends AbstractContentAssistParser {
	
	@Inject
	private ApplauseDslGrammarAccess grammarAccess;
	
	private Map<AbstractElement, String> nameMappings;
	
	@Override
	protected org.applause.lang.ui.contentassist.antlr.internal.InternalApplauseDslParser createParser() {
		org.applause.lang.ui.contentassist.antlr.internal.InternalApplauseDslParser result = new org.applause.lang.ui.contentassist.antlr.internal.InternalApplauseDslParser(null);
		result.setGrammarAccess(grammarAccess);
		return result;
	}
	
	@Override
	protected String getRuleName(AbstractElement element) {
		if (nameMappings == null) {
			nameMappings = new HashMap<AbstractElement, String>() {
				private static final long serialVersionUID = 1L;
				{
					put(grammarAccess.getNamedElementAccess().getAlternatives(), "rule__NamedElement__Alternatives");
					put(grammarAccess.getTypeAccess().getAlternatives(), "rule__Type__Alternatives");
					put(grammarAccess.getRESTVerbAccess().getAlternatives(), "rule__RESTVerb__Alternatives");
					put(grammarAccess.getDataTypeAccess().getGroup(), "rule__DataType__Group__0");
					put(grammarAccess.getEntityAccess().getGroup(), "rule__Entity__Group__0");
					put(grammarAccess.getEntityAccess().getGroup_3(), "rule__Entity__Group_3__0");
					put(grammarAccess.getAttributeAccess().getGroup(), "rule__Attribute__Group__0");
					put(grammarAccess.getPlatformAccess().getGroup(), "rule__Platform__Group__0");
					put(grammarAccess.getTypeMappingAccess().getGroup(), "rule__TypeMapping__Group__0");
					put(grammarAccess.getDataSourceAccess().getGroup(), "rule__DataSource__Group__0");
					put(grammarAccess.getDataSourceAccessMethodAccess().getGroup(), "rule__DataSourceAccessMethod__Group__0");
					put(grammarAccess.getDataSourceAccessMethodAccess().getGroup_2(), "rule__DataSourceAccessMethod__Group_2__0");
					put(grammarAccess.getDataSourceAccessMethodAccess().getGroup_2_1(), "rule__DataSourceAccessMethod__Group_2_1__0");
					put(grammarAccess.getRESTSpecificationAccess().getGroup(), "rule__RESTSpecification__Group__0");
					put(grammarAccess.getRESTSpecificationAccess().getGroup_2(), "rule__RESTSpecification__Group_2__0");
					put(grammarAccess.getParameterAccess().getGroup(), "rule__Parameter__Group__0");
					put(grammarAccess.getModelAccess().getElementsAssignment(), "rule__Model__ElementsAssignment");
					put(grammarAccess.getDataTypeAccess().getNameAssignment_1(), "rule__DataType__NameAssignment_1");
					put(grammarAccess.getEntityAccess().getAbstractAssignment_0(), "rule__Entity__AbstractAssignment_0");
					put(grammarAccess.getEntityAccess().getNameAssignment_2(), "rule__Entity__NameAssignment_2");
					put(grammarAccess.getEntityAccess().getSuperTypeAssignment_3_1(), "rule__Entity__SuperTypeAssignment_3_1");
					put(grammarAccess.getEntityAccess().getAttributesAssignment_5(), "rule__Entity__AttributesAssignment_5");
					put(grammarAccess.getAttributeAccess().getTypeAssignment_0(), "rule__Attribute__TypeAssignment_0");
					put(grammarAccess.getAttributeAccess().getManyAssignment_1(), "rule__Attribute__ManyAssignment_1");
					put(grammarAccess.getAttributeAccess().getNameAssignment_2(), "rule__Attribute__NameAssignment_2");
					put(grammarAccess.getPlatformAccess().getNameAssignment_1(), "rule__Platform__NameAssignment_1");
					put(grammarAccess.getPlatformAccess().getMappingsAssignment_3(), "rule__Platform__MappingsAssignment_3");
					put(grammarAccess.getTypeMappingAccess().getTypeAssignment_1(), "rule__TypeMapping__TypeAssignment_1");
					put(grammarAccess.getTypeMappingAccess().getSimpleNameAssignment_3(), "rule__TypeMapping__SimpleNameAssignment_3");
					put(grammarAccess.getDataSourceAccess().getNameAssignment_1(), "rule__DataSource__NameAssignment_1");
					put(grammarAccess.getDataSourceAccess().getBaseUrlAssignment_5(), "rule__DataSource__BaseUrlAssignment_5");
					put(grammarAccess.getDataSourceAccess().getResourceTypeAssignment_8(), "rule__DataSource__ResourceTypeAssignment_8");
					put(grammarAccess.getDataSourceAccess().getMethodsAssignment_9(), "rule__DataSource__MethodsAssignment_9");
					put(grammarAccess.getDataSourceAccessMethodAccess().getNameAssignment_0(), "rule__DataSourceAccessMethod__NameAssignment_0");
					put(grammarAccess.getDataSourceAccessMethodAccess().getDeclaredParametersAssignment_2_0(), "rule__DataSourceAccessMethod__DeclaredParametersAssignment_2_0");
					put(grammarAccess.getDataSourceAccessMethodAccess().getDeclaredParametersAssignment_2_1_1(), "rule__DataSourceAccessMethod__DeclaredParametersAssignment_2_1_1");
					put(grammarAccess.getDataSourceAccessMethodAccess().getReturnsManyAssignment_4(), "rule__DataSourceAccessMethod__ReturnsManyAssignment_4");
					put(grammarAccess.getDataSourceAccessMethodAccess().getRestSpecificationAssignment_5(), "rule__DataSourceAccessMethod__RestSpecificationAssignment_5");
					put(grammarAccess.getRESTSpecificationAccess().getVerbAssignment_0(), "rule__RESTSpecification__VerbAssignment_0");
					put(grammarAccess.getRESTSpecificationAccess().getPathAssignment_1(), "rule__RESTSpecification__PathAssignment_1");
					put(grammarAccess.getRESTSpecificationAccess().getBodyAssignment_2_1(), "rule__RESTSpecification__BodyAssignment_2_1");
					put(grammarAccess.getDataSourceBodySpecificationAccess().getBodycontentsAssignment(), "rule__DataSourceBodySpecification__BodycontentsAssignment");
					put(grammarAccess.getParameterAccess().getTypeAssignment_0(), "rule__Parameter__TypeAssignment_0");
					put(grammarAccess.getParameterAccess().getNameAssignment_1(), "rule__Parameter__NameAssignment_1");
				}
			};
		}
		return nameMappings.get(element);
	}
	
	@Override
	protected Collection<FollowElement> getFollowElements(AbstractInternalContentAssistParser parser) {
		try {
			org.applause.lang.ui.contentassist.antlr.internal.InternalApplauseDslParser typedParser = (org.applause.lang.ui.contentassist.antlr.internal.InternalApplauseDslParser) parser;
			typedParser.entryRuleModel();
			return typedParser.getFollowElements();
		} catch(RecognitionException ex) {
			throw new RuntimeException(ex);
		}		
	}
	
	@Override
	protected String[] getInitialHiddenTokens() {
		return new String[] { "RULE_WS", "RULE_ML_COMMENT", "RULE_SL_COMMENT" };
	}
	
	public ApplauseDslGrammarAccess getGrammarAccess() {
		return this.grammarAccess;
	}
	
	public void setGrammarAccess(ApplauseDslGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}
}
