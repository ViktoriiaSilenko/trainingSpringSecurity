package edu.teldir.domain.service;

import edu.teldir.domain.entity.Contact;

import java.util.Collection;

public interface ContactService {
    Collection<Contact> getAllContacts();
    Contact getContact(long id);
    void save(Contact contact);
    void remove(Contact contact);
    void create(Contact contact);
}
