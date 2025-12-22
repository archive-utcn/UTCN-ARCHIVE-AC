#ifndef __SETS_H__
#define __SETS_H__

template <typename T>
class Hash_t : Set_t
{
    public :
    // constructors & destructors
    Hash_t();
    Hash_t(Set_t *);
    ~Hash_t();
    
    // methods
    virtual void Insert(T elem);
    virtual void Extract(T elem);
    virtual int  In(T elem);
    virtual void Union(Set_t *);
    virtual void Intersect(Set_t *);
};

#endif
