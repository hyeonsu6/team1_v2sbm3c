package dev.mvc.frecommend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import dev.mvc.fcate.FcateProcInter;
import dev.mvc.member.MemberProcInter;

public class RecommendCont {
	@Autowired
	@Qualifier("dev.mvc.fcate.FcateProc") // @Component("dev.mvc.fcate.FcateProc")
	private FcateProcInter fcateProc;
	
	@Autowired
	@Qualifier("dev.mvc.member.MemberProc") // @Component("dev.mvc.member.MemberProc")
	private MemberProcInter memberProc;
	
	
	public RecommendCont() {
		System.out.println("-> RecommendCont created.");
	}

}
