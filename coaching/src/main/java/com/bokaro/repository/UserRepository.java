package com.bokaro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bokaro.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

//	@Query(value="select a.* from users a where a.username=?1",nativeQuery=true)
	User findByUserName(String username);

}
