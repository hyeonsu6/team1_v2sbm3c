package dev.mvc.team1_v2sbm3c;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import dev.mvc.festival.Festival;
import dev.mvc.freview.Freview;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// Windows: path = "C:/kd/deploy/resort_v2sbm3c_blog/contents/storage";
		// ▶ file:///C:/kd/deploy/resort_v2sbm3c_blog/contents/storage

		// Ubuntu: path = "/home/ubuntu/deploy/resort_v2sbm3c_blog/contents/storage";
		// ▶ file:////home/ubuntu/deploy/resort_v2sbm3c_blog/contents/storage

		// JSP 인식되는 경로: http://localhost:9093/contents/storage";
		registry.addResourceHandler("/festival/storage/**").addResourceLocations("file:///" + Festival.getUploadDir());
//		// JSP 인식되는 경로: http://localhost:9093/contents/storage";
		registry.addResourceHandler("/freview/storage/**").addResourceLocations("file:///" + Freview.getUploadDir());

		// JSP 인식되는 경로: http://localhost:9091/attachfile/storage";
		// registry.addResourceHandler("/contents/storage/**").addResourceLocations("file:///"
		// + Tool.getOSPath() + "/attachfile/storage/");

		// JSP 인식되는 경로: http://localhost:9091/member/storage";
		// registry.addResourceHandler("/contents/storage/**").addResourceLocations("file:///"
		// + Tool.getOSPath() + "/member/storage/");
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**").allowedOriginPatterns("*") // React 앱의 URL, 2.4 부터 allowedOriginPatterns 사용
				.allowedMethods("GET", "POST", "PUT", "DELETE").allowedHeaders("*").allowCredentials(true);
	}
}