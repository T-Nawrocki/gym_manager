class Quote

    @quotes = [

        "“Of all the gyms I've been to, this is one of them!”",

        "“Luckily, the equipment was easy to clean!”",

        "“The weights were heavy, so that's a positive!”",
        
        "“A staff member handed me this review form and
        told me to sign if I wanted to leave!”",

        "“There were an adequate number of walls!”",

        "“It'll be even better when they add changing rooms!”",

        "“At first I was worried that it was some sort of scam,
        but the owner assured me that they won that lawsuit!”",

        "“Please, if anyone is reading this, you have to help me
        I'm trapped and they say they won't let me out unless
        I finish making this website but I just want to go home
        and I can't get the sessions class to work. And they want 
        a class called class? Who does that? What am I supposed to 
        do oh gods they're coming back please call the police...”",

        "“The gym is completely normal and why would you ask?”",

        "“I didn't see a single possum!'",

        "“I have seen the owner's wife, and they are happy, healthy and alive.”",

        "“The Fyre Festival of gyms!”"

    ]

    @names = [
        "Tomek",
        "Rebeka",
        "Rudy",
        "Alina",
        "Helena",
        "James",
        "Other James",
        "Jane",
        "Robert",
        "Ruben"
    ]

    def self.random_quote
        @quotes.sample
    end

    def self.random_name
        @names.sample
    end
    
end
