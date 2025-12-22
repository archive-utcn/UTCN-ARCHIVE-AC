#ifndef __SETS_H__
#define __SETS_H__

template <typename T>
class Set_t
{
    public :
    // constructors & destructors
    Set_t();
    Set_t(Set_t *);
    ~Set_t();
    
    // methods
    virtual void Insert(T elem);
    virtual void Extract(T elem);
    virtual int  In(T elem);
    virtual void Union(Set_t *);
    virtual void Intersect(Set_t *);
};

#endif
