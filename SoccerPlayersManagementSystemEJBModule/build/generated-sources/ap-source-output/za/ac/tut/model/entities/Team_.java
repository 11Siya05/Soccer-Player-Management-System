package za.ac.tut.model.entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import za.ac.tut.model.entities.Player;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-08T12:20:37")
@StaticMetamodel(Team.class)
public class Team_ { 

    public static volatile SingularAttribute<Team, String> teamName;
    public static volatile ListAttribute<Team, Player> players;
    public static volatile SingularAttribute<Team, Long> id;

}