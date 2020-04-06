package edu.teldir.domain.dao;

import edu.teldir.domain.entity.Contact;

import java.util.Collection;

public interface ContactDao {
    Collection<Contact> getAllContacts();
    Contact getContact(long id);
    void save(Contact contact);
    void remove(Contact contact);
}
