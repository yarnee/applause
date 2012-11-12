package org.applause.lang.generator.ios

import com.google.inject.Inject
import org.applause.lang.generator.ios.model.ModelCompiler
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.generator.IGenerator
import org.applause.lang.generator.ios.ui.UICompiler
import org.applause.util.xcode.project.XcodeProject
import static extension org.applause.util.xcode.project.Path.*
import org.applause.util.xcode.project.XcodeGroup

class IosAppGenerator implements IGenerator {

	@Inject ModelCompiler modelCompiler
	@Inject UICompiler uiCompiler
	@Inject extension ProjectExtensions projectExtensions
	
	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
		
//		val path = "/Users/peterfriese/Projects/peterfriese.de/Applause2/applause/tooling/org.applause.util.xcode.projectfile.sample/MyTestProject/MyTestProject.xcodeproj"
		val path = "/Users/peterfriese/Projects/peterfriese.de/Applause2/applause/reference/org.applause.demos.githubbrowser.ios/GithubBrowser.xcodeproj"
		
		// Project root
		val project = XcodeProject::createProject(path)
		val mainGroup = project.createMainGroup
		
		modelCompiler.compile(resource, fsa, project, mainGroup)
		
		uiCompiler.compile(resource, fsa)
		
		project.finishPbxFile(mainGroup)
		val pbxprojFilename = resource.xcodeprojName + '/project.pbxproj'
		val projectString = project.toString
		fsa.generateFile(pbxprojFilename,  IosOutputConfigurationProvider::OUTPUT_XCODEPROJ, projectString)
//		project.save
	}
	
	def void finishPbxFile(XcodeProject project, XcodeGroup mainGroup) {
		// MyTestProject group
		val groupEmptyApplicationProject = mainGroup.createGroup("MyTestProject".toPath)
		val appDelegeateHeaderFile = groupEmptyApplicationProject.createHeaderFile("AppDelegate.h".toPath)
		val appDelegateModuleFile = groupEmptyApplicationProject.createModuleFile("AppDelegate.m".toPath)
		
		// Supporting Files (this group does not have a physical folder)
		val groupSupportingFilesEAP = groupEmptyApplicationProject.createGroup("Supporting Files")
		val mainModuleFile = groupSupportingFilesEAP.createModuleFile("main.m".toPath)
		groupSupportingFilesEAP.createPlistFile("MyTestProject-Info.plist".toPath)
		groupSupportingFilesEAP.createHeaderFile("MyTestProject-Prefix.pch".toPath)
		
		// Frameworks group
		val groupFrameworks = mainGroup.createGroup("Frameworks")
		groupFrameworks.createFrameworkFile("System/Library/Frameworks/UIKit.framework".toPath)
		

		// Products group
		val groupProducts = mainGroup.createGroup("Products")
		groupProducts.productsGroup = true
		val applicationFile = groupProducts.createAppFile("MyTestProject.app".toPath)
		val octestFile = groupProducts.createOCTestFile("MyTestProjectTests.octest".toPath)
		
		// MyTestProject app target
		val applicationTarget = project.createApplicationTarget("MyTestProject", applicationFile)
		applicationTarget.productName = "MyTestProject" 
		
		val applicationTestTarget = project.createApplicationTarget("MyTestProjectTests", octestFile)
		applicationTestTarget.productName = "MyTestProjectTests" 
		
		// Build configuration list for PBXProject MyTestProject
		val buildConfigurationProject = project.getBuildConfiguration("Release")
		buildConfigurationProject.setSetting("ALWAYS_SEARCH_USER_PATHS", "NO")
		buildConfigurationProject.setSetting("ARCHS", '"$(ARCHS_STANDARD_32_BIT)"')
		buildConfigurationProject.setSetting("CLANG_CXX_LANGUAGE_STANDARD", '"gnu++0x"')
		buildConfigurationProject.setSetting("CLANG_ENABLE_OBJC_ARC", "YES")
		buildConfigurationProject.setSetting("CLANG_WARN__DUPLICATE_METHOD_MATCH", "YES")
		buildConfigurationProject.setSetting('"CODE_SIGN_IDENTITY[sdk=iphoneos*]"', '"iPhone Developer"')
		buildConfigurationProject.setSetting("COPY_PHASE_STRIP", "YES")
		buildConfigurationProject.setSetting("GCC_C_LANGUAGE_STANDARD", "gnu99")
		buildConfigurationProject.setSetting("GCC_VERSION", "com.apple.compilers.llvm.clang.1_0")
		buildConfigurationProject.setSetting("GCC_WARN_ABOUT_RETURN_TYPE", "YES")
		buildConfigurationProject.setSetting("GCC_WARN_UNINITIALIZED_AUTOS", "YES")
		buildConfigurationProject.setSetting("GCC_WARN_UNUSED_VARIABLE", "YES")
		buildConfigurationProject.setSetting("IPHONEOS_DEPLOYMENT_TARGET", "5.1")
		buildConfigurationProject.setSetting("OTHER_CFLAGS", '"-DNS_BLOCK_ASSERTIONS=1"')
		buildConfigurationProject.setSetting("SDKROOT", "iphoneos")
		buildConfigurationProject.setSetting("VALIDATE_PRODUCT", "YES")

		val buildConfigurationProjectDebug = project.getBuildConfiguration("Debug")
		buildConfigurationProjectDebug.setSetting("ALWAYS_SEARCH_USER_PATHS", "NO")
		buildConfigurationProjectDebug.setSetting("ARCHS", '"$(ARCHS_STANDARD_32_BIT)"')
		buildConfigurationProjectDebug.setSetting("CLANG_CXX_LANGUAGE_STANDARD", '"gnu++0x"')
		buildConfigurationProjectDebug.setSetting("CLANG_ENABLE_OBJC_ARC", "YES")
		buildConfigurationProjectDebug.setSetting("CLANG_WARN__DUPLICATE_METHOD_MATCH", "YES")
		buildConfigurationProjectDebug.setSetting('"CODE_SIGN_IDENTITY[sdk=iphoneos*]"', '"iPhone Developer"')
		buildConfigurationProjectDebug.setSetting("COPY_PHASE_STRIP", "YES")
		buildConfigurationProjectDebug.setSetting("GCC_C_LANGUAGE_STANDARD", "gnu99")
		buildConfigurationProjectDebug.setSetting("GCC_VERSION", "com.apple.compilers.llvm.clang.1_0")
		buildConfigurationProjectDebug.setSetting("GCC_WARN_ABOUT_RETURN_TYPE", "YES")
		buildConfigurationProjectDebug.setSetting("GCC_WARN_UNINITIALIZED_AUTOS", "YES")
		buildConfigurationProjectDebug.setSetting("GCC_WARN_UNUSED_VARIABLE", "YES")
		buildConfigurationProjectDebug.setSetting("IPHONEOS_DEPLOYMENT_TARGET", "5.1")
		buildConfigurationProjectDebug.setSetting("OTHER_CFLAGS", '"-DNS_BLOCK_ASSERTIONS=1"')
		buildConfigurationProjectDebug.setSetting("SDKROOT", "iphoneos")
		buildConfigurationProjectDebug.setSetting("VALIDATE_PRODUCT", "YES")
		
		
		// Build configuration list for PBXNativeTarget MyTestProject
		val buildConfigurationRelease = applicationTarget.getBuildConfiguration("Release")
		buildConfigurationRelease.setSetting("GCC_PRECOMPILE_PREFIX_HEADER", "YES")
		buildConfigurationRelease.setSetting("INFOPLIST_FILE", '"MyTestProject/MyTestProject-Info.plist"')
		buildConfigurationRelease.setSetting("PRODUCT_NAME", '"$(TARGET_NAME)"')
		buildConfigurationRelease.setSetting("WRAPPER_EXTENSION", "app")
		

		val buildConfigurationDebug = applicationTarget.getBuildConfiguration("Debug")
		buildConfigurationDebug.setSetting("GCC_PRECOMPILE_PREFIX_HEADER", "YES")
		buildConfigurationDebug.setSetting("GCC_PREFIX_HEADER", '"MyTestProject/MyTestProject-Prefix.pch"')
		buildConfigurationDebug.setSetting("INFOPLIST_FILE", '"MyTestProject/MyTestProject-Info.plist"')
		buildConfigurationDebug.setSetting("PRODUCT_NAME", '"$(TARGET_NAME)"')
		buildConfigurationDebug.setSetting("WRAPPER_EXTENSION", "app")
		
	} 
	
}
