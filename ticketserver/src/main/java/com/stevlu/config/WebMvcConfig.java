package com.stevlu.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.stevlu.common.DateConverter;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by Steven Lu on 2018/11/21.
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {
	@Override
	public void addFormatters(FormatterRegistry registry) {
		registry.addConverter(new DateConverter());
	}

	@Bean
	public ExecutorService executorService() {
		return Executors.newCachedThreadPool();
	}
}
