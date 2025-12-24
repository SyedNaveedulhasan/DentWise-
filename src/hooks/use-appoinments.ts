"use client";

import { getAppoinments } from "@/lib/actions/appoinments";
import { useQuery } from "@tanstack/react-query";

export function useGetAppointments(){
    const result = useQuery({
        queryKey: ["getAppointments"],
        queryFn: getAppoinments
    });

    return result;
}