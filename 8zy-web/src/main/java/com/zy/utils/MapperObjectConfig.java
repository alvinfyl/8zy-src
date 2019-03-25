package com.zy.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 转换解析器
 *
 * @author wangqingguo 2017/9/25
 */
@Configuration
public class MapperObjectConfig {

    @Bean(name = "mapperObject")
    public ObjectMapper getObjectMapper() {
        return new ObjectMapper().registerModule(new ParameterNamesModule()).registerModule(new Jdk8Module())
                .registerModule(new JavaTimeModule());
    }


}
