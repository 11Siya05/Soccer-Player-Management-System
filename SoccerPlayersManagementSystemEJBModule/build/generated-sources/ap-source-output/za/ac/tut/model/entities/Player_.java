package za.ac.tut.model.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.model.entities.Contract;
import za.ac.tut.model.entities.Team;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-08T12:20:37")
@StaticMetamodel(Player.class)
public class Player_ { 

    public static volatile SingularAttribute<Player, String> nationality;
    public static volatile SingularAttribute<Player, Contract> contract;
    public static volatile SingularAttribute<Player, Date> dateOfBirth;
    public static volatile SingularAttribute<Player, Long> id;
    public static volatile SingularAttribute<Player, String> position;
    public static volatile SingularAttribute<Player, Team> team;
    public static volatile SingularAttribute<Player, String> fullnames;
    public static volatile SingularAttribute<Player, Date> creationDate;
    public static volatile SingularAttribute<Player, String> contacts;

}