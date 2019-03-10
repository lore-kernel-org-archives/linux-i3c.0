Return-Path: <SRS0=lIk1=RN=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7099C10F10
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B57A5207E0
	for <linux-i3c@archiver.kernel.org>; Sun, 10 Mar 2019 13:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbKiXdnz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="JRdSND3Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="UMV/F1A2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B57A5207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRu+tqPNXMPJi0KWJoomPEhyPai8j3SWUUSx4qJBBDg=; b=GbKiXdnzFUghlv
	cKwcWEePhnRO20tTupi+/Rmp9qr0BgLrp219vnTU8eMEJpy5Rzw42ptA29pkAL21+EJ4hMZEy4gK+
	zvDEE3ykh5xGQE/Aifhfas/bAAJnv3zoUietex4ubsawOCjeUykgGntrYQdEA3VAIEj9C2OFXL3Zc
	GI3GZgqYYKTOynyQKcyJCNKpk1fUnJ2uuPWhWUD1/C5a1po+8pUZdkcwkIVpYaxByAoUHRmBEdHjv
	3u91NuPi2HxVjCaqZtC0KBZPxgcVwlqoTIVJXwtuHpcreDWCG/8J7CYwO4ADIzgqvT+XjtIX52aYg
	7w5GB/n16Ok7v4XoxQaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2yzD-0002tA-DZ; Sun, 10 Mar 2019 13:59:31 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2yz7-0002qW-BU
 for linux-i3c@lists.infradead.org; Sun, 10 Mar 2019 13:59:29 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2ADspKQ025223; Sun, 10 Mar 2019 06:59:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=QAK5VLRxuNDyI4TUikDzEOqp0peNIGeDt+m9dts5gZA=;
 b=JRdSND3YLJ97dT286ogp4pIJA0pCupmg7c2aBya9I++s8ODgKChZw9SRC4d2OJnHLypP
 R++mHJteQH7RDG6G3OXo+2SKjqaJNg5DMAs0ybRK4r/zkIuUzt6OwKH9Zid4SeY3PG4Z
 VYVpjq1HvIsVFxUyF8iWqGSwD/xNL8AfgYAqROIbRZhtmZW42QfHlHyjrRr3V7ly+zil
 D0eCEecnnGXi3rI24gGlyYiJBafgWtsGUuW+L9ezGu2R1n4ZsL7PFdOlSZD/ipAnYGRW
 RT3jHHGBepIORHLnKzjSIgOdBjJCwnE+jdt5/BOmouCJpOy820WX1mwo3lb50G6dqqzN TQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2r49y1cqyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 Mar 2019 06:59:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAK5VLRxuNDyI4TUikDzEOqp0peNIGeDt+m9dts5gZA=;
 b=UMV/F1A2jP8TjfsTpFmjDdNtLF2StOkvQiuGUeYvfH/Ernw6RQ4RuPBsbwdhhU4ks1m3xQ2G85PMoFq1gTgIN2hlS/YuF9J1mkTI1+ikwj+wJeXSnF7fwVhrDN+PuGHCBALkpkPIG7vbbEMrAz8N2+QEEmT5gd3396oxAbsKsGQ=
Received: from DM5PR07CA0108.namprd07.prod.outlook.com (2603:10b6:4:ae::37) by
 DM6PR07MB4713.namprd07.prod.outlook.com (2603:10b6:5:a1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.19; Sun, 10 Mar 2019 13:59:18 +0000
Received: from BY2NAM05FT010.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::205) by DM5PR07CA0108.outlook.office365.com
 (2603:10b6:4:ae::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.18 via Frontend
 Transport; Sun, 10 Mar 2019 13:59:18 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT010.mail.protection.outlook.com (10.152.100.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1709.11 via Frontend Transport; Sun, 10 Mar 2019 13:59:18 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x2ADxEpl032144
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Sun, 10 Mar 2019 06:59:17 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Sun, 10 Mar 2019 14:59:14 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Sun, 10 Mar 2019 14:59:13 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x2ADxCh8022630;
 Sun, 10 Mar 2019 13:59:12 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x2ADxCuI022622;
 Sun, 10 Mar 2019 13:59:12 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 4/6] i3c: master: cdns: add support for mastership request
 to Cadence I3C master driver.
Date: Sun, 10 Mar 2019 13:58:41 +0000
Message-ID: <20190310135843.21154-5-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190310135843.21154-1-pgaj@cadence.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(189003)(199004)(36092001)(106466001)(2351001)(246002)(8676002)(76176011)(42186006)(478600001)(105596002)(50466002)(2906002)(26826003)(316002)(48376002)(87636003)(54906003)(51416003)(47776003)(16586007)(50226002)(8936002)(86362001)(356004)(6666004)(186003)(2616005)(26005)(426003)(336012)(6916009)(14444005)(305945005)(5660300002)(30864003)(1076003)(36756003)(107886003)(4326008)(446003)(11346002)(5024004)(7636002)(126002)(476003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB4713; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd068eb0-4380-409d-dc06-08d6a5609695
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM6PR07MB4713; 
X-MS-TrafficTypeDiagnostic: DM6PR07MB4713:
X-Microsoft-Exchange-Diagnostics: 1; DM6PR07MB4713;
 20:5xNS0CH8p0GOinEdtdJo0U8wDLU49J7Prj23mFp+gzfvx7U5eFY4JfPCr6TE2JV6wBIFn1C2DJi313tpTrzaBpa2ybaJknCUml8DcFQRY7lLlAqOP67HS7bv86Va3R1Gs/ILXx5NfLSHfPwNCLOqmejjbeBQKeHezgBOzKalsYjA4hxb7Ep3ssqske+Zb1B7icBs3gZmx4/vD4PBy1DfUP+z1KZXHH1EJiq3k+qqgguzaOA6AZgZnzH9uc3aanfBdqKmcyWFMhkUnp6a13/l+YC5vZSbeBy0vLsalkIeL5IwpIZjFcyogPBZybiQGvVkfQsYKtiZtZ+umH0Ku8F05OV1kp0f0GR2s/RN/n1JsUmLcJ1Z0Zx0wh2tgwBExCDwG/0VXI9pQWT3BIaKOUTfRlFEzMvVVpbgpPF3KL+WKDLUxOeRZ57kifccZcsOx7hbpiTG4uSgrPy09t2wKuJhxdFFjP9v/UUMNarzNknCnT9sGSn5uxDbhuNybF1C0/+X
X-Microsoft-Antispam-PRVS: <DM6PR07MB4713566F57D4174C28BAB9A4C24F0@DM6PR07MB4713.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0972DEC1D9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR07MB4713;
 23:KN6EYDonMY5WJ+T6itxZgBtL5lL6jDk2yAvBormAt?=
 =?us-ascii?Q?CW0giy+JvMSQa1gI1EnLwApe2mV8YZR8Cjhdzh5EWqlCSbkEPngXHig6TP7I?=
 =?us-ascii?Q?T+CXwS11LI9PAFs4picYBJ1od5D6Ai3dFAPY6ab7t7MRkR4+PLzTZyUh85D/?=
 =?us-ascii?Q?oSSjGNZP6R5i3mgwacm/1rsc9hfXe8NJa1cCD+HDIyH1f8dFB4naa4YTmtLl?=
 =?us-ascii?Q?+HzQn5kFAhMtnXlG//w3bvpBKB58Iq+Trq+6g9ptZ6eRVP0jIisvudLgKIAB?=
 =?us-ascii?Q?9bcU8EOMpK2IZAVIfi/nT+JeL5pRA7EoGPiP8pyma7PIGEpvTZywYuTeWXV9?=
 =?us-ascii?Q?2N1VUc2RDc5iUBXefEQNfKywrRb7+H/0FbT6pxetjygmTqKaqwSuRfO2elUQ?=
 =?us-ascii?Q?E9yYKZu5TJom4YrE0NIq5IhyngcJRhN9VA7C10EOiomYUb9hErg9PbyIrN1/?=
 =?us-ascii?Q?jx0eOOH2tOzb3IjixPPX32C1ox29uBKveY4AwZgykjXhd5ep0imIC86dmSNw?=
 =?us-ascii?Q?zGnoLrQ0ryf2ng/S+bP9uTvCezUA7qjomtZyE1nEPPjqpxSCpTtm2qHPzvuF?=
 =?us-ascii?Q?19DNd/tA0ypzIoGcZmzlzy39bNpAQ+MoSl05m6+CiC2odmqkpYu0p/uld1s7?=
 =?us-ascii?Q?j39JG6HofxFaR5FzAaifUp9s27ysQR/RAm/JlNOos6TsMqKs25QoHtahjkcg?=
 =?us-ascii?Q?L0eHS7AQBAFgNSlZuwT1PFSMDbpTPVZuKZBIQhvuNqrY3AFUWDDNn3kQlvIH?=
 =?us-ascii?Q?iGUEvgAwprV1nMcy37om//02tJA4NoNX0KBK5pMskGvvDy4DmfRsGk1SWT9w?=
 =?us-ascii?Q?qgpEeZNctqLddujZJSO/7RaSSwu07vVxcDkQiB2LQMYCDV4PIBX5QF6+ho/J?=
 =?us-ascii?Q?M4VAKrjRZpGNhr34h1G+uEdxjsG8qsvRanH29K/pVl7PqoO+IJtzP8Olzevo?=
 =?us-ascii?Q?ouzLdV47UNMqQHGzhAGxY5ws5A1ot5cg8b2GMc/sZWcdk9hMspYt2Vr3Cemc?=
 =?us-ascii?Q?qt6MfKrwTrWny57b7qMWdjRMtMDQlw5DrFEB/elFEXTNUp8Jv7UQEFEvFpXn?=
 =?us-ascii?Q?K6LP9BHQmEAhlopgtld/g8aBz7WY8hNrTHqWLwxVZVB7eawlmjrt7R+5h2vA?=
 =?us-ascii?Q?mhNzcsXMpqkhWE9IW5v+42ASbsVQNMjUIUIPPmTOMcIVnhjZ+CVrA=3D=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T0byoUWvobBTlULcMhPlDPYyvfx2VTtpTD7mALGCFvTYHaN79hFvzPp1ZIkSxIYIfb7ldREsWunoUR/3FBxabBMLQykSGUk4E0bPtnTgIETm67ZK/iMwJRoeMmHLo6VNxTcWOl/PFmfs8kWODNoIwvbcQPcZYO2qBVPDq5daZTJoDuOcN8yRkDMbn+xSs1pT+GeAV2mcvR2kBoi1Mi/QKAqRznayXW8Y4m7o5kiVJfpRG39xwc8GLxImwej67pbO5xWf8BHfnarkhoimjZlS8RTJBu8VYLooFjC9y8toKEHZBOI4vn54r3V5DwcaEt0UngFuKf0IYSw7+EksHIrQ8DuBkjTr5PUT7ptdJJzcWAE6GQFwGeqePttf4fkBhKY5XgAh5PWT57IzoNUBgXVUweR7fQlIYn204nVQJKOIiVk=
X-Microsoft-Exchange-Diagnostics: 1; DM6PR07MB4713;
 20:TZ3jE6Pvv49Atz3goh/SZNh4rKvk6aALqoQbVkncI82NR0BVjV3eKTfqXKJg+fDCRzN3nqpZF+KmtPNSNshfYhHfz9SxKavORUzKV4lWbl8aa29x6KSZqscFtGmbl54RQcFusMSHzuV7VuR3QoDSWoRn5V/M19HOnEA2odC6YRWfX+fPSzLp5NmZLvUi3lMqT+z2mXoM4dlBMJ8p0zC+wo8w/47efKFh16FBvXXPsJddJevMqZo1OZqXo+T2KezR
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2019 13:59:18.0730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd068eb0-4380-409d-dc06-08d6a5609695
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4713
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-10_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903100109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_065925_705774_059689DD 
X-CRM114-Status: GOOD (  15.30  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch adds support for mastership request to Cadence I3C master driver.

Mastership is requested automatically after secondary master
receives mastership ENEC event. This allows secondary masters to
initialize their bus.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v3 and v4:
- Refactored the code

Main changes between v2 and v3:
- Add mastership type
- Add postponed master registration
- Add update device definition on bus initialization time
- Removed redundant mastership work structs
- Reworked IBI slot lookup
- Reworked Mastership event enabling/disabling

Changes in v2:
- Add work structs for mastership purpose
- Add missing mastership disable feature
---
 drivers/i3c/master/i3c-master-cdns.c | 495 +++++++++++++++++++++++++++++++----
 1 file changed, 443 insertions(+), 52 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 237f24a..61d6416 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -157,6 +157,7 @@
 #define SLV_IMR				0x48
 #define SLV_ICR				0x4c
 #define SLV_ISR				0x50
+#define SLV_INT_DEFSLVS			BIT(21)
 #define SLV_INT_TM			BIT(20)
 #define SLV_INT_ERROR			BIT(19)
 #define SLV_INT_EVENT_UP		BIT(18)
@@ -388,8 +389,19 @@ struct cdns_i3c_xfer {
 	struct cdns_i3c_cmd cmds[0];
 };
 
+enum cdns_i3c_mr {
+	REQUEST,
+	HANDOFF,
+	TAKEOVER
+};
+
 struct cdns_i3c_master {
 	struct work_struct hj_work;
+	struct {
+		struct work_struct work;
+		enum cdns_i3c_mr mr_type;
+		u32 ibir;
+	} mastership;
 	struct i3c_master_controller base;
 	u32 free_rr_slots;
 	unsigned int maxdevs;
@@ -408,6 +420,8 @@ struct cdns_i3c_master {
 	struct clk *pclk;
 	struct cdns_i3c_master_caps caps;
 	unsigned long i3c_scl_lim;
+	struct device *parent;
+	struct workqueue_struct *wq;
 };
 
 static inline struct cdns_i3c_master *
@@ -663,6 +677,88 @@ static void cdns_i3c_master_unqueue_xfer(struct cdns_i3c_master *master,
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
+static void
+cdns_i3c_master_i3c_dev_rr_to_info(struct cdns_i3c_master *master,
+				   unsigned int slot,
+				   struct i3c_device_info *info)
+{
+	u32 rr;
+
+	memset(info, 0, sizeof(*info));
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	info->dcr = rr;
+	info->bcr = rr >> 8;
+	info->pid = rr >> 16;
+	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
+}
+
+static void
+cdns_i3c_master_i2c_dev_rr_to_info(struct cdns_i3c_master *master,
+				   unsigned int slot,
+				   u16 *addr, u8 *lvr)
+{
+	u32 rr;
+
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	*addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	*lvr = rr;
+}
+
+static
+int cdns_i3c_sec_master_request_mastership(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 status;
+	int ret;
+
+	status = readl(master->regs + MST_STATUS0);
+	if (WARN_ON(status & MST_STATUS0_MASTER_MODE))
+		return -EEXIST;
+
+	status = readl(master->regs + SLV_STATUS1);
+	if (status & SLV_STATUS1_MR_DIS)
+		return -EACCES;
+
+	writel(SLV_INT_MR_DONE, master->regs + SLV_IER);
+	writel(readl(master->regs + CTRL) | CTRL_MST_INIT | CTRL_MST_ACK,
+	       master->regs + CTRL);
+
+	ret = readl_poll_timeout(master->regs + MST_STATUS0, status,
+				 status & MST_STATUS0_MASTER_MODE, 100,
+				 100000);
+	return ret;
+}
+
+static void cdns_i3c_master_update_devs(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 val, newdevs;
+	u16 addr;
+	u8 lvr;
+	int slot;
+	struct i3c_device_info i3c_info;
+
+	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
+	for (slot = 1; slot <= master->maxdevs; slot++) {
+		val = readl(master->regs + DEV_ID_RR0(slot));
+
+		if ((newdevs & BIT(slot)) && (val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i3c_dev_rr_to_info(master, slot,
+							   &i3c_info);
+
+			i3c_master_add_i3c_dev_locked(m, i3c_info.dyn_addr);
+		} else if ((newdevs & BIT(slot)) &&
+			   !(val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i2c_dev_rr_to_info(master, slot,
+							   &addr, &lvr);
+			i3c_master_add_i2c_dev(m, addr, lvr);
+		}
+	}
+}
+
 static enum i3c_error_code cdns_i3c_cmd_get_err(struct cdns_i3c_cmd *cmd)
 {
 	switch (cmd->error) {
@@ -913,6 +1009,7 @@ static int cdns_i3c_master_get_rr_slot(struct cdns_i3c_master *master,
 		return ffs(master->free_rr_slots) - 1;
 	}
 
+
 	activedevs = readl(master->regs + DEVS_CTRL) &
 		     DEVS_CTRL_DEVS_ACTIVE_MASK;
 
@@ -1005,9 +1102,9 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
+	writel(prepare_rr0_dev_address(dev->addr),
 	       master->regs + DEV_ID_RR0(data->id));
-	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
+	writel(dev->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
 	       DEVS_CTRL_DEV_ACTIVE(data->id),
 	       master->regs + DEVS_CTRL);
@@ -1037,22 +1134,6 @@ static void cdns_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	cdns_i3c_master_disable(master);
 }
 
-static void cdns_i3c_master_dev_rr_to_info(struct cdns_i3c_master *master,
-					   unsigned int slot,
-					   struct i3c_device_info *info)
-{
-	u32 rr;
-
-	memset(info, 0, sizeof(*info));
-	rr = readl(master->regs + DEV_ID_RR0(slot));
-	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
-	rr = readl(master->regs + DEV_ID_RR2(slot));
-	info->dcr = rr;
-	info->bcr = rr >> 8;
-	info->pid = rr >> 16;
-	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
-}
-
 static void cdns_i3c_master_upd_i3c_scl_lim(struct cdns_i3c_master *master)
 {
 	struct i3c_master_controller *m = &master->base;
@@ -1180,10 +1261,6 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 
 	cdns_i3c_master_upd_i3c_scl_lim(master);
 
-	/* Unmask Hot-Join and Mastership request interrupts. */
-	i3c_master_enec_locked(m, I3C_BROADCAST_ADDR,
-			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
-
 	return 0;
 }
 
@@ -1247,15 +1324,17 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
 	writel(prescl1, master->regs + PRESCL_CTRL1);
 
-	/* Get an address for the master. */
-	ret = i3c_master_get_free_addr(m, 0);
-	if (ret < 0)
-		return ret;
+	if (!m->secondary) {
+		/* Get an address for the master. */
+		ret = i3c_master_get_free_addr(m, 0);
+		if (ret < 0)
+			return ret;
 
-	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
-	       master->regs + DEV_ID_RR0(0));
+		writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
+		       master->regs + DEV_ID_RR0(0));
+	}
 
-	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
+	cdns_i3c_master_i3c_dev_rr_to_info(master, 0, &info);
 	if (info.bcr & I3C_BCR_HDR_CAP)
 		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
 
@@ -1274,9 +1353,32 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 
 	cdns_i3c_master_enable(master);
 
+	if (m->secondary) {
+		i3c_bus_maintenance_lock(&master->base.bus);
+		cdns_i3c_master_update_devs(&master->base);
+		i3c_bus_maintenance_unlock(&master->base.bus);
+	}
+
 	return 0;
 }
 
+static
+struct i3c_dev_desc *cdns_i3c_get_ibi_device(struct cdns_i3c_master *master,
+					     u32 ibir)
+{
+	struct i3c_dev_desc *dev;
+	u32 id = IBIR_SLVID(ibir);
+
+	if (id >= master->ibi.num_slots || (ibir & IBIR_ERROR))
+		return NULL;
+
+	dev = master->ibi.slots[id];
+	if (!dev)
+		return NULL;
+
+	return dev;
+}
+
 static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 				       u32 ibir)
 {
@@ -1354,27 +1456,100 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_MR:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
+			master->mastership.ibir = ibir;
+			master->mastership.mr_type = HANDOFF;
+			queue_work(master->base.wq,
+				   &master->mastership.work);
+			break;
 		default:
 			break;
 		}
 	}
 }
 
+static void cdns_i3c_master_bus_handoff(struct cdns_i3c_master *master)
+{
+	struct i3c_dev_desc *dev;
+
+	dev = cdns_i3c_get_ibi_device(master, master->mastership.ibir);
+
+	writel(MST_INT_MR_DONE, master->regs + MST_ICR);
+
+	master->base.bus.cur_master = dev;
+}
+
+static void cdns_i3c_master_mastership_takeover(struct cdns_i3c_master *master)
+{
+	if (master->base.init_done) {
+		i3c_bus_maintenance_lock(&master->base.bus);
+		cdns_i3c_master_update_devs(&master->base);
+		i3c_bus_maintenance_unlock(&master->base.bus);
+
+		i3c_master_register_new_devs(&master->base);
+	}
+
+	writel(readl(master->regs + CTRL) & ~CTRL_MST_ACK, master->regs + CTRL);
+}
+
+static void cdns_i3c_sec_master_event_up(struct cdns_i3c_master *master)
+{
+	u32 status;
+
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_ICR);
+	status = readl(master->regs + SLV_STATUS1);
+	if (!(status & SLV_STATUS1_MR_DIS) &&
+	    !master->base.this) {
+		master->mastership.mr_type = REQUEST;
+		queue_work(master->wq, &master->mastership.work);
+	}
+}
+
+static void cdns_i3c_sec_mastership_done(struct cdns_i3c_master *master)
+{
+	writel(SLV_INT_MR_DONE, master->regs + SLV_ICR);
+
+	master->base.bus.cur_master = master->base.this;
+
+	if (master->base.this) {
+		master->mastership.mr_type = TAKEOVER;
+		queue_work(master->base.wq, &master->mastership.work);
+	}
+}
+
 static irqreturn_t cdns_i3c_master_interrupt(int irq, void *data)
 {
 	struct cdns_i3c_master *master = data;
 	u32 status;
 
-	status = readl(master->regs + MST_ISR);
-	if (!(status & readl(master->regs + MST_IMR)))
-		return IRQ_NONE;
+	status = readl(master->regs + MST_STATUS0);
+
+	if (!master->base.this ||
+	    master->base.this != master->base.bus.cur_master) {
+		status = readl(master->regs + SLV_ISR);
+
+		if (!(status & readl(master->regs + SLV_IMR)))
+			return IRQ_NONE;
+
+		if (status & SLV_INT_MR_DONE)
+			cdns_i3c_sec_mastership_done(master);
 
-	spin_lock(&master->xferqueue.lock);
-	cdns_i3c_master_end_xfer_locked(master, status);
-	spin_unlock(&master->xferqueue.lock);
+		if (status & SLV_INT_EVENT_UP)
+			cdns_i3c_sec_master_event_up(master);
+	} else {
+		status = readl(master->regs + MST_ISR);
+		if (!(status & readl(master->regs + MST_IMR)))
+			return IRQ_NONE;
+
+		spin_lock(&master->xferqueue.lock);
+		cdns_i3c_master_end_xfer_locked(master, status);
+		spin_unlock(&master->xferqueue.lock);
 
-	if (status & MST_INT_IBIR_THR)
-		cnds_i3c_master_demux_ibis(master);
+		if (status & MST_INT_IBIR_THR)
+			cnds_i3c_master_demux_ibis(master);
+
+		if (status & MST_INT_MR_DONE)
+			cdns_i3c_master_bus_handoff(master);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1443,30 +1618,54 @@ static int cdns_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 	return ret;
 }
 
-static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
-				       const struct i3c_ibi_setup *req)
+static int cdns_i3c_master_find_ibi_slot(struct cdns_i3c_master *master,
+					 struct i3c_dev_desc *dev,
+					 s16 *slot)
 {
-	struct i3c_master_controller *m = i3c_dev_get_master(dev);
-	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
-	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	unsigned long flags;
 	unsigned int i;
-
-	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
-	if (IS_ERR(data->ibi_pool))
-		return PTR_ERR(data->ibi_pool);
+	int ret = -ENOENT;
 
 	spin_lock_irqsave(&master->ibi.lock, flags);
 	for (i = 0; i < master->ibi.num_slots; i++) {
-		if (!master->ibi.slots[i]) {
-			data->ibi = i;
-			master->ibi.slots[i] = dev;
+		/*
+		 * We only need 'SIR' slots to describe IBI-capable devices.
+		 * This slot may be used by mastership request interrupt,
+		 * We can ruse the same 'SIR' map entry.
+		 */
+		if (master->ibi.slots[i] == dev) {
+			*slot = i;
+			ret = 0;
 			break;
 		}
 	}
+
+	if (ret)
+		for (i = 0; i < master->ibi.num_slots; i++) {
+			if (!master->ibi.slots[i]) {
+				master->ibi.slots[i] = dev;
+				*slot = i;
+				ret = 0;
+				break;
+			}
+		}
 	spin_unlock_irqrestore(&master->ibi.lock, flags);
 
-	if (i < master->ibi.num_slots)
+	return ret;
+}
+
+static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
+				       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool))
+		return PTR_ERR(data->ibi_pool);
+
+	if (cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi) == 0)
 		return 0;
 
 	i3c_generic_ibi_free_pool(data->ibi_pool);
@@ -1475,6 +1674,51 @@ static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
 	return -ENOSPC;
 }
 
+static int
+cdns_i3c_master_enable_mastership_events(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *i3cdev;
+	unsigned long flags;
+	u32 sircfg, sirmap;
+	int ret;
+
+	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
+		if (I3C_BCR_DEVICE_ROLE(i3cdev->info.bcr) != I3C_BCR_I3C_MASTER)
+			continue;
+
+		data = i3c_dev_get_master_data(i3cdev);
+		if (!data)
+			continue;
+
+		ret = cdns_i3c_master_find_ibi_slot(master, i3cdev, &data->ibi);
+		if (ret)
+			continue;
+
+		spin_lock_irqsave(&master->ibi.lock, flags);
+		sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+		sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+		sircfg = SIR_MAP_DEV_ROLE(i3cdev->info.bcr >> 6) |
+			SIR_MAP_DEV_DA(i3cdev->info.dyn_addr) |
+			SIR_MAP_DEV_PL(i3cdev->info.max_ibi_len) |
+			SIR_MAP_DEV_ACK;
+
+		if (i3cdev->info.bcr & I3C_BCR_MAX_DATA_SPEED_LIM)
+			sircfg |= SIR_MAP_DEV_SLOW;
+
+		sirmap |= SIR_MAP_DEV_CONF(data->ibi, sircfg);
+		writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+		spin_unlock_irqrestore(&master->ibi.lock, flags);
+	}
+
+	/* Unmask Hot-Join and Mastership request interrupts. */
+	i3c_master_enec_locked(&master->base, I3C_BROADCAST_ADDR,
+			       I3C_CCC_EVENT_HJ | I3C_CCC_EVENT_MR);
+
+	return 0;
+}
+
 static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -1490,6 +1734,52 @@ static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	i3c_generic_ibi_free_pool(data->ibi_pool);
 }
 
+static int
+cdns_i3c_master_disable_mastership_events(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data;
+	struct i3c_dev_desc *i3cdev;
+	unsigned long flags;
+	u32 sirmap;
+	int ret;
+
+	ret = i3c_master_disec_locked(m, I3C_BROADCAST_ADDR,
+				      I3C_CCC_EVENT_MR);
+	if (ret)
+		return ret;
+
+	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
+		if (I3C_BCR_DEVICE_ROLE(i3cdev->info.bcr) != I3C_BCR_I3C_MASTER)
+			continue;
+
+		data = i3c_dev_get_master_data(i3cdev);
+
+		ret = cdns_i3c_master_find_ibi_slot(master, i3cdev, &data->ibi);
+		if (ret)
+			continue;
+
+		/*
+		 * Do not modify SIR register and cleanup slots
+		 * if regular IBI is enabled for this device.
+		 */
+		if (master->ibi.slots[data->ibi]->ibi->handler)
+			continue;
+
+		spin_lock_irqsave(&master->ibi.lock, flags);
+		sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+		sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+		sirmap |= SIR_MAP_DEV_CONF(data->ibi,
+					SIR_MAP_DEV_DA(I3C_BROADCAST_ADDR));
+		writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+		spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+		cdns_i3c_master_free_ibi(i3cdev);
+	}
+
+	return ret;
+}
+
 static void cdns_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
 					     struct i3c_ibi_slot *slot)
 {
@@ -1516,6 +1806,9 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.request_ibi = cdns_i3c_master_request_ibi,
 	.free_ibi = cdns_i3c_master_free_ibi,
 	.recycle_ibi_slot = cdns_i3c_master_recycle_ibi_slot,
+	.request_mastership = cdns_i3c_sec_master_request_mastership,
+	.enable_mr_events = cdns_i3c_master_enable_mastership_events,
+	.disable_mr_events = cdns_i3c_master_disable_mastership_events
 };
 
 static void cdns_i3c_master_hj(struct work_struct *work)
@@ -1527,10 +1820,80 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 	i3c_master_do_daa(&master->base);
 }
 
+static int cdns_i3c_sec_master_bus_init(struct cdns_i3c_master *master)
+{
+	u32 val;
+	int ret;
+
+	val = readl(master->regs + SLV_STATUS1);
+
+	if (!(val & SLV_STATUS1_HAS_DA))
+		return -EFAULT;
+
+	i3c_bus_maintenance_lock(&master->base.bus);
+	ret = cdns_i3c_sec_master_request_mastership(&master->base);
+	i3c_bus_maintenance_unlock(&master->base.bus);
+
+	return ret;
+}
+
+static void
+cdns_i3c_master_mastership_request(struct cdns_i3c_master *master)
+{
+	int ret;
+
+	ret = cdns_i3c_sec_master_bus_init(master);
+	if (ret)
+		return;
+
+	ret = i3c_master_register(&master->base, master->parent,
+				  &cdns_i3c_master_ops, true);
+	if (ret)
+		dev_err(&master->base.dev, "Master register failed\n");
+}
+
+static void cdns_i3c_master_mastership_handoff(struct cdns_i3c_master *master)
+{
+	int ret;
+
+	struct i3c_dev_desc *dev;
+	u32 ibir = master->mastership.ibir;
+
+	dev = cdns_i3c_get_ibi_device(master, ibir);
+	if (!dev)
+		return;
+
+	ret = i3c_master_mastership_ack(&master->base, dev->info.dyn_addr);
+	if (ret)
+		dev_err(&master->base.dev, "Mastership handoff failed\n");
+}
+
+static void cdns_i3c_master_mastership(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      mastership.work);
+
+	switch (master->mastership.mr_type) {
+	case REQUEST:
+		cdns_i3c_master_mastership_request(master);
+		break;
+	case HANDOFF:
+		cdns_i3c_master_mastership_handoff(master);
+		break;
+	case TAKEOVER:
+		cdns_i3c_master_mastership_takeover(master);
+		break;
+	default:
+		break;
+	}
+}
+
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
 	struct resource *res;
+	bool secondary = false;
 	int ret, irq;
 	u32 val;
 
@@ -1572,6 +1935,9 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
 	INIT_WORK(&master->hj_work, cdns_i3c_master_hj);
+	INIT_WORK(&master->mastership.work,
+		  cdns_i3c_master_mastership);
+
 	writel(0xffffffff, master->regs + MST_IDR);
 	writel(0xffffffff, master->regs + SLV_IDR);
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
@@ -1581,6 +1947,10 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, master);
 
+	val = readl(master->regs + MST_STATUS0);
+	if (!(val & MST_STATUS0_MASTER_MODE))
+		secondary = true;
+
 	val = readl(master->regs + CONF_STATUS0);
 
 	/* Device ID0 is reserved to describe this master. */
@@ -1596,6 +1966,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	spin_lock_init(&master->ibi.lock);
 	master->ibi.num_slots = CONF_STATUS1_IBI_HW_RES(val);
+
 	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
 					 sizeof(*master->ibi.slots),
 					 GFP_KERNEL);
@@ -1604,15 +1975,31 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
-	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
+
+	if (secondary) {
+		ret = cdns_i3c_sec_master_bus_init(master);
+		if (ret)
+			goto err_postpone_init;
+	} else
+		writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
 	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &cdns_i3c_master_ops, false);
+				  &cdns_i3c_master_ops, secondary);
 	if (ret)
 		goto err_disable_sysclk;
 
 	return 0;
 
+err_postpone_init:
+	master->wq = alloc_workqueue("%s", 0, 0, pdev->name);
+	if (!master->wq)
+		return -ENOMEM;
+
+	master->parent = &pdev->dev;
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_IER);
+
+	return 0;
+
 err_disable_sysclk:
 	clk_disable_unprepare(master->sysclk);
 
@@ -1627,6 +2014,9 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
 	struct cdns_i3c_master *master = platform_get_drvdata(pdev);
 	int ret;
 
+	if (master->wq)
+		destroy_workqueue(master->wq);
+
 	ret = i3c_master_unregister(&master->base);
 	if (ret)
 		return ret;
@@ -1653,6 +2043,7 @@ static struct platform_driver cdns_i3c_master = {
 module_platform_driver(cdns_i3c_master);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("Cadence I3C master driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:cdns-i3c-master");
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
