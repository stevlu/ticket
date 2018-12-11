package com.stevlu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.stevlu.mapper")
public class WebSocketServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebSocketServerApplication.class, args);
	}
}