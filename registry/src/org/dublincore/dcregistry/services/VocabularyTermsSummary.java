/*
 * The contents of this file, as updated from time to time by Dublin Core
 * Metadata Initiative (DCMI), are subject to the Dublin Core Public
 * License Version 1.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a current copy of the
 * License at http://dublincore.org/dcpl/.
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
 * the License for the specific language governing rights and
 * limitations under the License.
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Dublin Core Metadata Initiative. For
 * more information on the Dublin Core Metadata Initiative, please see
 * http://dublincore.org/.
 *
 * This is Original Code.
 *
 * The Developer of the Original Code is:
 *  H.Wagner    <wagnerh@oclc.org>
 * 
 * Portions created by DCMI are Copyright (C) 2000. 
 *
 */


package org.dublincore.dcregistry.services;

public interface VocabularyTermsSummary extends javax.xml.rpc.Service {
    public java.lang.String getvocabularyTermsSummaryAddress();

    public org.dublincore.dcregistry.services.VocabularyTerms getvocabularyTermsSummary() throws javax.xml.rpc.ServiceException;

    public org.dublincore.dcregistry.services.VocabularyTerms getvocabularyTermsSummary(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
