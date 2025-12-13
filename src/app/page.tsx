import { Button } from "@/components/ui/button";
import Image from "next/image";
import { SignedIn, SignedOut, SignOutButton, SignUpButton } from "@clerk/nextjs";


export default function Home() {
  return (
    <div>
      <h1>Home page</h1>
      <SignedOut>
       <SignUpButton mode="modal">SignUp Page</SignUpButton>
      </SignedOut>

      <SignedIn>
        <SignOutButton>LogOut</SignOutButton>
      </SignedIn>
    </div>
  );
}
