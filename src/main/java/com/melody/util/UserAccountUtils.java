package com.melody.util;

import java.util.Date;
import java.util.Calendar;

public class UserAccountUtils {

    public static String calculateAgeGroup(Date birthDate) {
        // Calculate the age from the birth date
        int age = calculateAge(birthDate);

        // Determine the age group based on the calculated age
        int ageGroup = age / 10;
        return String.valueOf(ageGroup);
    }

    private static int calculateAge(Date birthDate) {
        Calendar birthCalendar = Calendar.getInstance();
        birthCalendar.setTime(birthDate);

        Calendar currentCalendar = Calendar.getInstance();

        int age = currentCalendar.get(Calendar.YEAR) - birthCalendar.get(Calendar.YEAR);
        if (currentCalendar.get(Calendar.MONTH) < birthCalendar.get(Calendar.MONTH) ||
                (currentCalendar.get(Calendar.MONTH) == birthCalendar.get(Calendar.MONTH) &&
                        currentCalendar.get(Calendar.DAY_OF_MONTH) < birthCalendar.get(Calendar.DAY_OF_MONTH))) {
            age--;
        }
        return age;
    }
}
