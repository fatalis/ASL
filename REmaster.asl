state("bhd")
{
    float time : 0x97C9C0, 0xe474c; 
}

start
{
    return current.time < old.time;
}

reset
{
	return current.time < old.time;
}

isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromSeconds(current.time);
}
