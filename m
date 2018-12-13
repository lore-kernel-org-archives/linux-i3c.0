Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485B9C67872
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F8420849
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDVE/FGi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="ci3EoKLM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Leh/AHeR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16F8420849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBGlPbwLTCRHpPGfFTDAlt+UgBOziawQJDJ5xfDnPXo=; b=HDVE/FGijUvoWh
	w9nJ0aQUOoB0L8ASv/VbOX8tLFDLG78TudVnVwuCCjAeKl38pEDpLDgFFBVb53rhKpVjHYZ3ZxkQX
	pLykk1kqglKyYFD0X1puHdKXq9MXDoaIh4wEzhtO6M3EYMejrpWwG0bdUDKZdFTxQvhG3sdll6YjW
	R5IcHkqtpMN6RF5+vbqjkeyuUqUGjKj3NGi5DxTdDSlW1jUi8f8ahmARLjMNN/VvQvFBDTwNdIU2j
	rKai57ChnsecWldRja0+FWG8Fqv1irEs/A9vXRu10i74XxzdH3Jw3o/7c8c5R9XJeLfTllnrdeQ0C
	I6n6wXIb5s/6kCwgDVVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXQ7K-0006pT-Gn; Thu, 13 Dec 2018 12:29:26 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQ7G-0006oJ-NC
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:29:25 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBDCQkgE028090; Thu, 13 Dec 2018 04:29:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=0xJNE+TFSXBE7Lw56UJYea6L4qwDC76Y0JWPPlCnOFs=;
 b=ci3EoKLMjP7ROQgGKbFnYIaSGwJKYThULELI8OYXRV+24RgmIvftklw+TCChzJM6J5Qr
 9FR6eDRBKlBbB5R8oYGcfrInVxvNQd9s5zp04gbJEYbQjS3Hbr4Gh7pSN6uxQCjWfAT1
 766lSJKJ9WH7/fEulTz3Rbjg57D46egFnE049QjENCQ+1ne8xBg0h6hfsJclV64/p5CY
 NVV6dSkbbMsuSlBaGFy0C9i4H4lbDAsdspA8SjmIGFly1IkvrWXSDuBq/0kzAPhWj+Z7
 I1gO1G6uawzscKCDD1HHBYQwXZa8FiUAoCeOtJC+VVJ/34TBPT5GnImLSEKKouc7lJVq Ig== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2051.outbound.protection.outlook.com [104.47.48.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2pbf1ujd29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Dec 2018 04:29:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xJNE+TFSXBE7Lw56UJYea6L4qwDC76Y0JWPPlCnOFs=;
 b=Leh/AHeRXC9DOS3oy0CTV2U2SLxwsGA2d6PcErY9CSH1WbmNlkd/CBQDNOHLRXxy+4DoDa8VJUOCovaYE22lxTN95SU3YdE4TdRudXLgAcyOOOsvvtIx76YtEkPNzxtLHon055uzKGMI/YdjABH9QY/H2+7V/VpskQcPGmf9uJ8=
Received: from BYAPR07CA0068.namprd07.prod.outlook.com (2603:10b6:a03:60::45)
 by DM5PR0701MB3718.namprd07.prod.outlook.com (2603:10b6:4:7e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.20; Thu, 13 Dec
 2018 12:29:10 +0000
Received: from BY2NAM05FT013.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::204) by BYAPR07CA0068.outlook.office365.com
 (2603:10b6:a03:60::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1425.19 via Frontend
 Transport; Thu, 13 Dec 2018 12:29:10 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT013.mail.protection.outlook.com (10.152.100.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1446.5 via Frontend Transport; Thu, 13 Dec 2018 12:29:09 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 wBDCT7SX018176
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 13 Dec 2018 04:29:08 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 13 Dec 2018 13:29:08 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 13 Dec 2018 13:29:07 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id wBDCT3ea016500;
 Thu, 13 Dec 2018 12:29:03 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id wBDCT3nK016496;
 Thu, 13 Dec 2018 12:29:03 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 2/2] i3c: master: cdns: add support for mastership request to
 Cadence I3C master driver.
Date: Thu, 13 Dec 2018 12:28:01 +0000
Message-ID: <00976cbba57354c162f94ee29ce31c9c9289d36a.1544703840.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <cover.1544703840.git.pgaj@cadence.com>
References: <cover.1544703840.git.pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(199004)(189003)(36092001)(47776003)(16586007)(356004)(54906003)(42186006)(106466001)(50466002)(105596002)(305945005)(8676002)(4326008)(316002)(48376002)(76176011)(110136005)(107886003)(336012)(186003)(7636002)(51416003)(26005)(36756003)(118296001)(486006)(5660300001)(246002)(478600001)(2616005)(446003)(8936002)(50226002)(26826003)(11346002)(4744004)(126002)(2906002)(426003)(86362001)(87636003)(14444005)(5024004)(476003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0701MB3718; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BY2NAM05FT013;
 1:PGkUKAd4+ODRp/wtrr66O9zIMvIVwTEfIpdg8vr9rLH8dGdhRXVjp8NPqXwPSdnj1ZAs4rrHU8piEn2XwTRw2ZdRGj9CMw1YT0BbeTYyudh/kDN8qDdqedGUog4c+G8S
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6e5cb1d-62fb-473b-b25c-08d660f6951c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060);
 SRVR:DM5PR0701MB3718; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3718;
 3:EHtc6FW/GvnSifPCm92May7umdoCGEfPKHjiMNPcQ0oym6jY/Q8dbLfR4x/51FWQrgnVJha5q84VYKQ2P5OBKP5YuMzEpMHBME9AbbGA8GvZxlGrnU/g40FAKIpblg34Ex7dpKjfdGc1PZ5Z64NIddLAJ7oIVIC1TeLA7OIbAMi6s3zu2Wn8ikIIZT47pMk8lWJ5Xhq1vQO9PGtcAlhI1WB9tov8GmBm9r02CY6jHOYFdM27aTAP5yiS9hFV8/5f2+nXZjw4NiGiSs1oCdXIq0OQS8rqkJOROU28Ou7rHwUObs+MQc0JUAEYVd1ubdIP0CCWcvw/48qpmQUj7UUhHQ5BkmzoyEr4AaJEANXL7Nk=;
 25:GSi5shwURlqgFs+hovo0vuaqJng7LDiiF7sY/+p8dReyL/WNoCgNS+KVssGS59dphe+SvKUcWxiiE6vgyYsBZs4On3LRRpEMY/927vGiigI1alB0IH/rbH2o6IcC48FQC0NyX3jo1sJoDjNoOBEebVS1wPsxFmVS84ZSAH8NkadPQFDSl2kUIyenubyVNYiXrkFEczEzGHvo/zg56E16rjPqnwcNFrXdnyMEiNczLsIf9nmUw50Sl1QpcxDvcQIgTZiNYKHIeE5hiRB0ukL5QLPVt75RUUyhxNykVUcejiSm5xDOnxRkEnMj0UAmKP5JKkfX9RDUdPP0R4ogELb2Ot4RwxSbEZp+O3IZbwRY9kk=
X-MS-TrafficTypeDiagnostic: DM5PR0701MB3718:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3718;
 31:gl4rUJqKPaVI6bzhu/bxempa7eqgLi/D2BFYa1jZubD4TA/m7YX/OJPWL7etc7Xq4IEJ6tuccQoerfW1Oau9ErOFnIXV/G+drpDOJtFnbMV+otq2GTcVZWsenJu4wQoecmH8dD0u0pwxmSLrCPAdPsJveD4UJKVtt3l4J2qYkPlE0bIQKmzGhbwltd1W4izSlBlK7XI9pGw79t8l2mn6g0xQP1N2R0lTMZOcqm7cMoA=;
 20:tD39FJavN8R64D1qM5uXrz5Zv6kebURAZaOm8XNx7DAi1wZ4X1TFeEov4aqlU3fMLiak7/qe6n3o6qFxUG6CvSeBTasuGHiTwmja3QzlEhKyGBWvXmEu/3sLEcg1r7XcpkJSqbD5JJPn3jn+tVxQMusO7WYwEBH+lc0i6jfss6BUDRuoghaFWWtgrPfsVBPzobTj29jv6PoCIIrIDQKXay5T5XtUCWrgH3dezmqIJzSMeiHK7mbIupcC0jNhuTYsSnPuGrfcttb6R0FjqAfZbGgGicxUCTF110rnx/xf8CuFk928TYSAXC+U/mU34PSGDP1dgQmS21VN9iFX8jKeSwAMnmsa3yWTXm+IAHeYqD+OK3fmQ2z/1raBapFeviKprTWRExTkbiiZqCSSfFKN8E+aRzykhJ6SjBaRgzFiCkKddtKnvxo/UQ/Dh/SS4xy+88cx8e3HSdGt/AYKAmhp4h68bOPWo5OJi4lsN8mW3Td+fM3fwRk4I4szWB9G8TSM
X-Microsoft-Antispam-PRVS: <DM5PR0701MB3718544632BE3C5FFF5D0F93C2A00@DM5PR0701MB3718.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3231475)(944501520)(52105112)(10201501046)(93006095)(93003095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:DM5PR0701MB3718; BCL:0; PCL:0; RULEID:; SRVR:DM5PR0701MB3718; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3718;
 4:B4geT5At4CPypY3TtH2EaOp89pu1uf12pL2TFIpt944sJK2Mql2uRSxNiiWygg/csByXkDqmVmlA6CekpAy+ieCXqEgQSyC25fuRa0G/Y55Kla6CjikdhsV83+L5MnIUj92tngKWeYO1sBVoEZcsRI8JIvGUcIz32Yw4FOacB5oKpJAs558aMpRNOHmuAHeG3RJ/1uts28eR+JArcutHG5p4lJORp4NUNlPwy2+uAyIUedg2IcoHWVBW5+y1LvkqZXdRulMu8Z/usq7DgUNfSg==
X-Forefront-PRVS: 088552DE73
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0701MB3718;
 23:rBTUutZkTOvFbV5Gl0UcOXtJgUxDx7LDOVBfMpo?=
 =?us-ascii?Q?xoC29ayZ1hGDZPxN+bZmdLUAx5VYfUHoYJhISmnq+8xGiRatMgo80TFkIwRz?=
 =?us-ascii?Q?eHBLrn2yAKZMAB30OtylRoy3EWLJF2SlKE7hcnnM3DlCdvkdmYHi6Hk3qejn?=
 =?us-ascii?Q?jJhe1AUDEzgRu+S/O6t6TrRfihFZxis5mYfZXwXQRIW3qMzVhVksltL2YXXp?=
 =?us-ascii?Q?b6x8tLXPnb73PQ2rvSvFQJcFGwtStxZFNgTfk8cSnxjVr3b5clkZU5uEh+uK?=
 =?us-ascii?Q?TVaq3dgSg8AKyON5I3cpivFJ1srmMmQhqcA6ddWIMlnrXWwqLk8B5Krw6ujY?=
 =?us-ascii?Q?mU8uWJPcMZQQsHg53A8wUFkv4e+ypUlD+SOyCpxdfm5qPzpZ9ND4UG7iOvH2?=
 =?us-ascii?Q?hAD7rzU/k4FTr+OeUwHz6LS8IBdTz1Meejv1z0CS8yvK5rlYnXo3mPdnyBJ3?=
 =?us-ascii?Q?tldhfsCyezojhv2hFv9QABkAUTH/jpY50wFJ1krzMFc2G4Uy2M6jH6WDnHjD?=
 =?us-ascii?Q?g5KTMiruHU9g68EciSzeOPwqBc4t4wOZ1L9E/qaeuLfEhCx5hdlizEvCkB8n?=
 =?us-ascii?Q?h/EK3X2+83l74KMTe7GImDHQzg1QR1yl0XRTUvmiVHJf1r/gvWNoPblHPylc?=
 =?us-ascii?Q?lgqTGq/bbFsNyHOZpJuzvKTkZuoTj/387K1DBrP66WwTJKj5PoZJma0Usuk8?=
 =?us-ascii?Q?Qd6jJO2Q7pMx1jAwiR8E2jvyKgPUWVScTF2RfwrtqLABDX0FL7mnlEmq27+i?=
 =?us-ascii?Q?gAF3Jr9ZDj2V3y+KwWVSHTSYcUWu1HBGbXg6/f3SLuynPxa4dZU88VpDBQmx?=
 =?us-ascii?Q?RrEHPOJKyeVYk9fvzFEWoR90UKq3aZljUqtEAkF5exQy3egEPUEMXjK5m3uT?=
 =?us-ascii?Q?1ytkPrSMr90rxClRHR8TlSz3eZAYh78ezhXQS+/AWlSdwV4rSUuivnfB7K1Z?=
 =?us-ascii?Q?paa8e8UBax/pR2J2RkUUsADzAXlue+IkaEArQLQZwRQrIUSnVMC9XBIY9Cf/?=
 =?us-ascii?Q?1nTfh/W7cUoM2VNiGUTNcrwZzxYyuHuglQhn6r4I1iiAUoQ93hdntJVsPxlM?=
 =?us-ascii?Q?zGZX18d3nXNH58ozVx+WBFOWDLSIsZBSpLEsznoEFJcMOSpIgsguyR9WB2UM?=
 =?us-ascii?Q?IRKHHtllZW+qu/NEgLWImDj4tsETwLmyyc5Tsp4fX+aEdQA4r5LxgB/sUpH1?=
 =?us-ascii?Q?7Gd12zedAdt/QBx1ji6cN7Gqgosz5A3AIr5nZWlTd4mqPppF6n12bxlP2Ug?=
 =?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: 8e2uA7CZ0EcvRPUUdXAC96hUFyJtT8u9KWoYpt/Uqc/n9xs2zHFFaa/Vd77oc9G1aae/bfD8ZAEH/H8MG6T9bpVM96pQ/aggGntl0+wxGflDx6bajmSfAcOYyTXkekkw+7DdXV5mBIxiygRBF1fR/ieJ/IaBdBvSPStai8He8phwRYynyeq8bEeUXTiLhPZ7EoYofVRwejEv69Zqy3Ksv1HB8OqrVIM0b+JV4ofjWpF8bmxwg3wQxq/mJmKifW/G93d8iuP7T88p5AN+yjzxpDyXxPva+26uKqzVf1j0CDGthWqu4PeemGqKcy5JGdx9
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3718;
 6:6hlxukWFg97W0j91Xw6l2HFWU8UPwZZd43xp/7qBlN3XAEJqD8HDHK/AmNDzLEoxEzMy4+qqn4Ah1xyOSSeQc4D+6xJZ/d9gGuNZgC4M6aBuBWQhJcxSHahcVwl3n92knDLGvIYqh+Q9nWSbZV/u4YsJjnAXt1kvEGW/fQOpgCdER4arwe/5mbkBn376GfI0oH2ucQZh18iXceKDeo0mHBzPr5MbL2EH9mdIQC1UOkA65ybu8RNUPSvfW5NMF6ARapUNgTvF1akwPS/zvcAlk6Va7WdOwOEADcBdMorC7hlpH3oVZ5nIjXLzlzUIkr8dyva4EO8JoFNIRXK+lWmj2NtzYV4TL34GVC7DynDBhKQLcFtGxKNKbOiAERGjc0VDl1e23KvXEXxkg3ceZhtH0bbZUAxkLhUGiQKvtGrjB1XVZgTC8Akf30DF/TEhERHs9NHnjYLF9X+tNKZRyjSSIw==;
 5:WasX2yC4Q+IaOJCCas8wJitXqOGgXISrhupmDjV1MtYLUmf1FG8EzkGgliLeYpQw80lAL1ldSV+ZjfeXhoteFLskwuiP/yTskq9XeOdXGU2MMLhuTNpbeZVZZ5PaivMCY7dt5fJgnylfUX51Lujuw8AHt+UnDSUBF+bNmyZCCEQ=;
 7:PQIysY7Q4mtne0RFlXH2Fu+Fv8nDDxrZjJz0pxgoMYeRt+lCOZPw+nIxaX9s+VKpYr7GBnQDd+SoNyYhOi10y7d9GnY3iGwC1+QDAghJPIcfY8ooL8pGHBFqMayMbNQhjxZUCCKXVQdG9egfXgJB6g==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3718;
 20:1Bzt6slHGW80Z95Q1ZnE0J0cBCdLGKiMzsfnBkqx2PtxE+DGJSzQAXfEsy0Dfuu1Egp9+jWHAVdbJ9ygn1LXl6Zn2O13IK5PVCQYVnWK22G11NH33WxOIiI34lr+L50/KN77pBCcdQuprg2Kt0XmCNkNGx8XSjx7NEmt35cgLq4IZWvca2l2tCR7l2jt7OIXSi8FgHzqlNLzF0z57fVtJPiKwp1Tp6v6Y/pCDlew+5NmDnbfXwJnTBR3z12aMZac
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2018 12:29:09.8786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e5cb1d-62fb-473b-b25c-08d660f6951c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0701MB3718
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-13_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812130112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_042922_932061_8CD91BE6 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch adds support for mastership request to Cadence I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 316 ++++++++++++++++++++++++++++++-----
 1 file changed, 271 insertions(+), 45 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 02a8297..a33f3a6 100644
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
@@ -390,6 +391,10 @@ struct cdns_i3c_xfer {
 
 struct cdns_i3c_master {
 	struct work_struct hj_work;
+	struct {
+		struct work_struct handover_work;
+		u32 ibir;
+	} mastership;
 	struct i3c_master_controller base;
 	u32 free_rr_slots;
 	unsigned int maxdevs;
@@ -664,6 +669,89 @@ static void cdns_i3c_master_unqueue_xfer(struct cdns_i3c_master *master,
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
+cdns_i3c_master_i2c_dev_rr_to_boardinfo(struct cdns_i3c_master *master,
+					unsigned int slot,
+					struct i2c_dev_boardinfo *info)
+{
+	u32 rr;
+
+	memset(info, 0, sizeof(*info));
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	info->base.addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	info->lvr = rr;
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
+	if (status & MST_STATUS0_MASTER_MODE)
+		return -EEXIST;
+
+	status = readl(master->regs + SLV_STATUS1);
+	if (status & SLV_STATUS1_MR_DIS)
+		return -EBUSY;
+
+	writel(readl(master->regs + CTRL) | CTRL_MST_INIT | CTRL_MST_ACK,
+	       master->regs + CTRL);
+
+	writel(SLV_INT_MR_DONE, master->regs + SLV_IER);
+
+	ret = readl_poll_timeout(master->regs + MST_STATUS0, status,
+				 status & MST_STATUS0_MASTER_MODE, 100,
+				 1000000);
+
+	return ret;
+}
+
+static void cdns_i3c_master_update_devs(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 val, newdevs;
+	int slot;
+	struct i3c_device_info i3c_info;
+	struct i2c_dev_boardinfo i2c_info;
+
+	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
+	for (slot = 1; slot <= master->maxdevs; slot++) {
+		val = readl(master->regs + DEV_ID_RR0(slot));
+
+		if ((newdevs & BIT(slot)) && (val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i3c_dev_rr_to_info(master, slot,
+							   &i3c_info);
+			i3c_master_add_i3c_dev_locked(m, i3c_info.dyn_addr);
+		} else if ((newdevs & BIT(slot)) &&
+			   !(val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i2c_dev_rr_to_boardinfo(master, slot,
+								&i2c_info);
+			i3c_master_add_i2c_dev(m, &i2c_info);
+		}
+	}
+}
+
 static enum i3c_error_code cdns_i3c_cmd_get_err(struct cdns_i3c_cmd *cmd)
 {
 	switch (cmd->error) {
@@ -945,6 +1033,8 @@ static int cdns_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 	return 0;
 }
 
+static int cdns_i3c_master_enable_mastership(struct i3c_dev_desc *dev);
+
 static int cdns_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -1045,22 +1135,6 @@ static void cdns_i3c_master_bus_cleanup(struct i3c_master_controller *m)
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
@@ -1259,15 +1333,17 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
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
 
@@ -1289,6 +1365,23 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
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
@@ -1366,27 +1459,79 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_MR:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
+			master->mastership.ibir = ibir;
+			queue_work(master->base.wq,
+				   &master->mastership.handover_work);
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
+	i3c_master_switch_operation_mode(&master->base, dev, I3C_SLAVE_MODE);
+}
+
+static void cdns_i3c_sec_master_takeover(struct cdns_i3c_master *master)
+{
+	writel(SLV_INT_MR_DONE, master->regs + SLV_ICR);
+	i3c_master_switch_operation_mode(&master->base,
+					 master->base.this, I3C_MASTER_MODE);
+}
+
+static void cdns_i3c_sec_master_event_up(struct cdns_i3c_master *master)
+{
+	u32 status;
+	u8 evts = 0;
+
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_ICR);
+	status = readl(master->regs + SLV_STATUS1);
+	if (!(status & SLV_STATUS1_MR_DIS))
+		evts |= I3C_CCC_EVENT_MR;
+	if (!(status & SLV_STATUS1_HJ_DIS))
+		evts |= I3C_CCC_EVENT_HJ;
+
+	i3c_secondary_master_events_enabled(&master->base, evts);
+}
+
 static irqreturn_t cdns_i3c_master_interrupt(int irq, void *data)
 {
 	struct cdns_i3c_master *master = data;
 	u32 status;
 
-	status = readl(master->regs + MST_ISR);
-	if (!(status & readl(master->regs + MST_IMR)))
-		return IRQ_NONE;
+	if (master->base.op_mode == I3C_SLAVE_MODE) {
+		status = readl(master->regs + SLV_ISR);
 
-	spin_lock(&master->xferqueue.lock);
-	cdns_i3c_master_end_xfer_locked(master, status);
-	spin_unlock(&master->xferqueue.lock);
+		if (!(status & readl(master->regs + SLV_IMR)))
+			return IRQ_NONE;
 
-	if (status & MST_INT_IBIR_THR)
-		cnds_i3c_master_demux_ibis(master);
+		if (status & SLV_INT_MR_DONE)
+			cdns_i3c_sec_master_takeover(master);
+
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
+
+		if (status & MST_INT_IBIR_THR)
+			cnds_i3c_master_demux_ibis(master);
+
+		if (status & MST_INT_MR_DONE)
+			cdns_i3c_master_bus_handoff(master);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1455,30 +1600,46 @@ static int cdns_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
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
+		/*
+		 * We only need 'SIR' slots to describe IBI-capable devices.
+		 * This slot may be used by mastership request interrupt,
+		 * We can ruse the same 'SIR' map entry.
+		 */
+		if (!master->ibi.slots[i] ||
+		    master->ibi.slots[i] == dev) {
 			master->ibi.slots[i] = dev;
+			*slot = i;
+			ret = 0;
 			break;
 		}
 	}
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
@@ -1487,6 +1648,37 @@ static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
 	return -ENOSPC;
 }
 
+static int cdns_i3c_master_enable_mastership(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	unsigned long flags;
+	u32 sircfg, sirmap;
+	int ret;
+
+	ret = cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi);
+	if (ret)
+		return -ENOSPC;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+	sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+	sircfg = SIR_MAP_DEV_ROLE(dev->info.bcr >> 6) |
+		 SIR_MAP_DEV_DA(dev->info.dyn_addr) |
+		 SIR_MAP_DEV_PL(dev->info.max_ibi_len) |
+		 SIR_MAP_DEV_ACK;
+
+	if (dev->info.bcr & I3C_BCR_MAX_DATA_SPEED_LIM)
+		sircfg |= SIR_MAP_DEV_SLOW;
+
+	sirmap |= SIR_MAP_DEV_CONF(data->ibi, sircfg);
+	writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	return 0;
+}
+
 static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -1529,6 +1721,9 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.request_ibi = cdns_i3c_master_request_ibi,
 	.free_ibi = cdns_i3c_master_free_ibi,
 	.recycle_ibi_slot = cdns_i3c_master_recycle_ibi_slot,
+	.request_mastership = cdns_i3c_sec_master_request_mastership,
+	.update_devs = cdns_i3c_master_update_devs,
+	.enable_mastership = cdns_i3c_master_enable_mastership
 };
 
 static void cdns_i3c_master_hj(struct work_struct *work)
@@ -1537,13 +1732,31 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 						      struct cdns_i3c_master,
 						      hj_work);
 
-	i3c_master_do_daa(&master->base);
+	if (!master->base.secondary)
+		i3c_master_do_daa(&master->base);
+}
+
+static void cdns_i3c_master_mastership_handover(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      mastership.handover_work);
+	struct i3c_dev_desc *dev;
+	u32 ibir = master->mastership.ibir;
+
+	dev = cdns_i3c_get_ibi_device(master, ibir);
+	if (!dev)
+		return;
+
+	if (i3c_master_mastership_ack(&master->base, &dev->info))
+		dev_err(&master->base.dev, "Mastership handover failed\n");
 }
 
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
 	struct resource *res;
+	bool secondary = false;
 	int ret, irq;
 	u32 val;
 
@@ -1585,15 +1798,22 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
 	INIT_WORK(&master->hj_work, cdns_i3c_master_hj);
+	INIT_WORK(&master->mastership.handover_work,
+		  cdns_i3c_master_mastership_handover);
 	writel(0xffffffff, master->regs + MST_IDR);
 	writel(0xffffffff, master->regs + SLV_IDR);
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
 			       dev_name(&pdev->dev), master);
+
 	if (ret)
 		goto err_disable_sysclk;
 
 	platform_set_drvdata(pdev, master);
 
+	val = readl(master->regs + MST_STATUS0);
+	if (!(val & MST_STATUS0_MASTER_MODE))
+		secondary = true;
+
 	val = readl(master->regs + CONF_STATUS0);
 
 	/* Device ID0 is reserved to describe this master. */
@@ -1609,6 +1829,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	spin_lock_init(&master->ibi.lock);
 	master->ibi.num_slots = CONF_STATUS1_IBI_HW_RES(val);
+
 	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
 					 sizeof(*master->ibi.slots),
 					 GFP_KERNEL);
@@ -1620,10 +1841,14 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
 	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &cdns_i3c_master_ops, false);
+				  &cdns_i3c_master_ops, secondary);
 	if (ret)
 		goto err_disable_sysclk;
 
+	if (secondary)
+		writel(SLV_INT_EVENT_UP,
+		       master->regs + SLV_IER);
+
 	return 0;
 
 err_disable_sysclk:
@@ -1666,6 +1891,7 @@ static struct platform_driver cdns_i3c_master = {
 module_platform_driver(cdns_i3c_master);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("Cadence I3C master driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:cdns-i3c-master");
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
