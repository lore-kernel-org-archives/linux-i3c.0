Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35179C67839
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2EA20645
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DqpscWJx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="cMQ9Il3U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="nnTjDNFk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2EA20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzS94Igz+cU9C50Zuhq1tnnSZiJkCUxUVINGdfYcXAc=; b=DqpscWJxBlEnXy
	vShUQQynDoTKEbImD2FOD9xR91RqpyxYViYTsekF4qAH+R+BkyNcpt/MnKjNqU4xgIvJnGsQ360Ld
	7ASj4lwK750draKTETmcVOVxwLZwvdnNmhgm2U47YK01CXPMhY8NnSTdRg4CQOOyA8xbwewdc4Oqp
	ex4kL/848qlNolG0qmrODJKjnL5dfJfvYBvAF/zt2SHPAHSJw94uisIz2wQ1CCTC1ulqkbjUd7XVo
	ULkPGKXT9YJ+cTpYdbz2J3hshk1vcymPxbMDhcV1K5qd3DYKELuYubqadD97GWUkFuVjVO2flbx8X
	GWaEC7weUtA7NIkhEcxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXQ7M-0006pr-JM; Thu, 13 Dec 2018 12:29:28 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQ7G-0006oL-NB
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:29:26 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wBDCQkgF028090; Thu, 13 Dec 2018 04:29:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=WLZxgqg16H3MWfHBJSC3LP9hE0/lPgnOjn7gXeaEWQs=;
 b=cMQ9Il3UqsVmfdWIHlvLaCrVZ+JtDQsDsa9mQ6TlOL0pOzj+O3jTYHIb4Qcp+7wGJ64n
 JviAtPb5q3d2J+RayBFUOtnSoqIPQa0/tJQ+jUXznomZQPJpAkF5MGU3HMMEd8pUAW3m
 RLyGY89QUHXupJm72TV0VebR0zRVmiAmhMkGNBmwO5uGTj+8bAr4qu6/60GLS9O+Tcys
 K1Kr0U413LfbMP3TnxaYW+2bhj1GlR5TzylVbUnA9YApI4/lmjIIolRuwi2ajcUpjkin
 +zVWyVAtrJa7FFbZHbdmPfc7cTqIdjO51cLsC4ssd40xZvgjYvThjccNZJnRfWOuxaM5 ug== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2054.outbound.protection.outlook.com [104.47.46.54])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2pbf1ujd27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 13 Dec 2018 04:29:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLZxgqg16H3MWfHBJSC3LP9hE0/lPgnOjn7gXeaEWQs=;
 b=nnTjDNFklR24/r/yPH+8sngdzdAeEAaZqRHwclqJ2pz/NlAD44F/PGFq6CfAh0QQmzhbjqgMUJAlp+J9aUe6jn0viivFDiA1XHJW/hQ9NYs8d+jdHoQ8BK10rCuMY6Mbv/47Dw5sivOZYZElcOSL+8roadpQ6QTfaf3YjdjA5lo=
Received: from BYAPR07CA0058.namprd07.prod.outlook.com (2603:10b6:a03:60::35)
 by MWHPR0701MB3724.namprd07.prod.outlook.com (2603:10b6:301:7e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1425.19; Thu, 13 Dec
 2018 12:29:08 +0000
Received: from BY2NAM05FT013.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::207) by BYAPR07CA0058.outlook.office365.com
 (2603:10b6:a03:60::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1425.19 via Frontend
 Transport; Thu, 13 Dec 2018 12:29:08 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT013.mail.protection.outlook.com (10.152.100.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1446.5 via Frontend Transport; Thu, 13 Dec 2018 12:29:07 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 wBDCT2j5018736
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 13 Dec 2018 07:29:05 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 13 Dec 2018 13:29:05 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 13 Dec 2018 13:29:04 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id wBDCT1hW016381;
 Thu, 13 Dec 2018 12:29:01 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id wBDCT1Ft016379;
 Thu, 13 Dec 2018 12:29:01 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>, <linux-i3c@lists.infradead.org>
Subject: [PATCH 1/2] i3c: Add support for mastership request to I3C subsystem
Date: Thu, 13 Dec 2018 12:28:00 +0000
Message-ID: <68ffa8026fb3cc32415058861ece07f158b00647.1544703840.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <cover.1544703840.git.pgaj@cadence.com>
References: <cover.1544703840.git.pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39850400004)(136003)(2980300002)(199004)(189003)(36092001)(36756003)(105596002)(87636003)(4326008)(478600001)(48376002)(68736007)(5660300001)(106466001)(50226002)(118296001)(81166006)(4744004)(356004)(97736004)(8676002)(53936002)(81156014)(305945005)(8936002)(107886003)(26826003)(186003)(26005)(42186006)(54906003)(110136005)(16586007)(316002)(446003)(14444005)(5024004)(426003)(486006)(336012)(476003)(86362001)(126002)(47776003)(50466002)(2906002)(76176011)(69596002)(2616005)(51416003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0701MB3724; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BY2NAM05FT013;
 1:wchWeWFWneVngc4N7M1lq95IL8fuNOlg+qis4mxUf9j5kFuEP+hYUhreLx/m9mmzZXTTqXFn9aJszFx8qZnsQDXYGZXd53gHmhyWqu/51TAATXbaq9+bZyYfzqD4qNLL
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f380ae5a-9483-4053-9603-08d660f693fe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
 SRVR:MWHPR0701MB3724; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3724;
 3:VTLceitr3lGQLn89o5KR4eKqsdxGl0GHTjBKyf5KZ9DO4rHyMk1mgDwRIfeygVvVvdo6ARCe/ji710v/k5LPVrLXQAeGDIApNR+ZaCFjPvx9WwOOX//fMhTfJ1ysNdRmsVL6W5+dEEqZRmLsBlo4UHUdDizSsyYbw4fC1gpwqT23QSSpjiRXZ/gspnVzPQ3A2sOC5BbcZFuMYqOW0KGySUWKegjWBZ3JX0zcykL7qomUKh8QK6wvnuMWU80K1Gj0sMeHM9sdaAtgX4/sM6W3WOkabyTSa56SAOA4MduatuS1hHKW06XtqEAOuaeCPlKVwQPx3WeqFiVNwumpK6iGVg==;
 25:7YlKKlN1CgpC94keNQ66cMEG2XIUbnH1f+V2hKHcvAqRbla/Rm9/SNVqVgMBFQfQ9MG+yLySPG5/sOqOb1Yrj3vzDMNs6rU5WWAeOXz9LEKX+6IjXseMYC1OP49oTm7pNI6MUuOZJNH1cVN6iXig9sNG5REYuRV2rjrWfG7UiX1UO/bb+YMajZqzqFKOhoeddlxQ3JWMp5t/ARogr7NF3lyovQKpwoVgc3LSlHMsbIcOBhPzrdP5y0qxHSwvALklnBIVs7lJJh8Q0JBhr5OjY54/eLhfxHopG1UJrE4O9jYMfcuIJE/54XrINhihvTBMOFNhpmyZmTEwrrQS78ZtlA==;
 31:wSvMhcdcWLrFkx4Im4fMvjylrS3rjxvyAPOvtjDZ1TdslH3Sxhj+dRnX7BJnEC8DAMtm15N4J+luUnxZONdhepGuGbgKtPK4i6Z5uPULpdfrhNGzAewTKqbmDfoY6kQYzS6H4vCw5Y241l7RTSfh1eXHcy+61DXwudou9jPBM1pEIgFrBaof1fENL5f85A3rQjtK+HwdXXtD6bNdiAz+hhPVDdjszgkKtECbzntdKG8=
X-MS-TrafficTypeDiagnostic: MWHPR0701MB3724:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3724;
 20:M+SGF/Nkhqn95EHkdYrOxddyAbs/37B8U6FzAqX3A799xuXvCJAwWKa/Yn1X7l14GjarIq2k9r5NLGpGFiCl6yc1sRPBtMjr6Hyx7JrpqVWYntVRVKzANOUvSLCBT8BfBGDqQwQ+3hye+GxGZkoULjA4D1uDWldjpSf9B3LN1fw1mX/b3qcBKWshGV+s17cUK5OUehCmXXz55j7M6JUeDeUUZUd8db+K6JSN2HeBLJMwhpC6mzTqx5iVKgM1idY5UroZ0/Dl9xnVEuNAw/YSs32ChnoZ2ZbnFoUY7MF6Jlfwkaxt9a6JLuFG4xNr4no5p+n98sUzUoLLGWNsFIuLNmhwrbVX0N7NvUbaPq97vt3kn36wF1pA2LoEbltfRacl7LpUaO8pZOOQNYXdeSzq5J3c4nrrKbQsnKVzQTj9PK2SZ61Qa2DKFXZsetGr1HtGLnLX8KIqoonSMOI+nSxIUOcCOXelLi7N7T0qkUMXZjPfxIgvW72lEmOWjy5b9/9H;
 4:R/tj9vsEwUqi3C8+Hp98YNQdZsrWgo3i04MLFZqT9U8d2W5fyf7if7wzGedwIAAuedP27FB9EOuwf2hQcwUdh8OrZOZbK2Yg0cx76lVDuLLQK5JZeiv91CpDi83p0dX8lYUa2aDIB+bYAUrVtGWsZNXCRq3sQL94ikuCMaoclcQsgpIQqxCGPnN/GBhkzYKh+WpP1OTNnCuTVhWdwfVYtepml/M5zmL280fwDA5deeOTWoPaiiwUMxs55QcVs561A/i/phWhJYQ5Xbt9N3nXDQ==
X-Microsoft-Antispam-PRVS: <MWHPR0701MB37246B99CFD2A28EFEFF5F1DC2A00@MWHPR0701MB3724.namprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93003095)(3231475)(944501520)(52105112)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR0701MB3724; BCL:0; PCL:0; RULEID:; SRVR:MWHPR0701MB3724; 
X-Forefront-PRVS: 088552DE73
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0701MB3724;
 23:hJgalH2tk14DKu60YZHriKIMkFqodc3d5psxScS?=
 =?us-ascii?Q?YoK5O4daQFRQKLUexGZ9lXb/Y2kMAVVL0SHZk/Sw3PArlKAZ5cLECfF0A+Wt?=
 =?us-ascii?Q?O1dpfZn7Nxelne6lqirOXJHbu8RO3sRxQLjICnaAH0dkxlSWtohV7nMouyse?=
 =?us-ascii?Q?eYgHL1H0BdR5rwVqXvqoss19pdDN+M7gkGLzfWIE5LCJJWsyfHSw4/BMujfM?=
 =?us-ascii?Q?VRTbjWzf3jYEdMFKt0/xjrzdljSAyQq4484IH+5/D3OFZDYHpoRlbxH1LU79?=
 =?us-ascii?Q?WAGeKP1Ut8smcoefXjPKNwr5rVFi86I0LhftZAmPQqypxyLH8u/fBm2yyC9T?=
 =?us-ascii?Q?sX5TmOzBZKtBUKIPlglCVoe6kUs7b/niNBJ/r06GKycI5uAx9oQweO5h/PKG?=
 =?us-ascii?Q?tShIwazdVl6wBnm+CKWImtsHFDPOa7NAlGpSznBoR5PgIxWeDlLiqk9xgDOP?=
 =?us-ascii?Q?m/bCTcBXWjwx3vNpSXdHqYi9f1yZPlBa+/vYZJQ0nYthGR5LhlDY4QrvrWEm?=
 =?us-ascii?Q?uYmZZZgwq6qML3u8JwQPpnpGvXazRUQXCWINys4hPSVac+3dkJv102KoEry5?=
 =?us-ascii?Q?Yhz9Ffbo938R3H11QZNQVmz6Lz+HEFFngGVUB5nU1uodSI3A5SvO/hpe4Y4h?=
 =?us-ascii?Q?w9q/2ZmWF42RNS2XyigTKMiPyPyDswXnxO3VrKsrby7uC2+CDARbzngjSfto?=
 =?us-ascii?Q?7EGHfLk/wpbvCmdkJ0iPjJz/+ngRw4p0pYbJU2gS1Kvscn1EgKjW7IWVKaYd?=
 =?us-ascii?Q?zrTJ1uNTN6m2P8t1kiM0bxh0W1EYJDJC/o+Ig05aHtFtMnrUzrIPMn0ivuEG?=
 =?us-ascii?Q?lQLU/VQpd9wU9UuZmCim4judR0nDe0dZixEdsUAreD9dS0w6iohnul91iXqR?=
 =?us-ascii?Q?D1x9p4Ojy42AM02eC3orLcdoIJu+DNYitAFaBDyBC8xMsfx6vu1Lz69feD0I?=
 =?us-ascii?Q?qj8vbSBhbd6UvWelQVqMs6HT56z7STfKVoidPxk55OdTWKqJM8Lk5zYhMxEn?=
 =?us-ascii?Q?bHu06uAYzh0aXr1qdFpV5AvNQfpFv2C+5c0wiW6BfQCeNYZbS8WWI2tW5dP2?=
 =?us-ascii?Q?rYdx+/t+wNgM1DBuyHhsLn+egVPNmuvXEscNqiRsfjrBAq1+JYJ0FMy3RFHD?=
 =?us-ascii?Q?2UUFEPNS2fRDgcp71RpPV9kn2F6Fn3LyQof4+wvCxnnyfjhOYLNdNwmZ086q?=
 =?us-ascii?Q?iB988i9fEMqZYex0Mol+kq4DI6Axlfb/fLRVR0FaxNYhpvDxL3wicRC2mfg?=
 =?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: 74Sqkcpb62K1LcWTZU8fYhO73kiOiXqzwebCC9wpqWwGIfxr8TzYzhoIpLjf2PscrpL4LUK2HtTsHcN2nEvylgTn4kbhjt+OBAiAph7yvsYKKsy50Tsu+sxWpjZdN8zSM82/VjgcP6z22pSvkL4as3HSin7ZgW+FxFI/UglTzNmfvPq8wW8dNz3cXfuSpX2ngPCTrfQVLgdq6d8tcfZJfi26ZH/aTxRLGwoPn2XuZcAwAI14mPNn4wI9CAfb7EEx4YBbIM/pqnch8AT7OF/OPKCvEmxU9NN4N8Zqa25nJ04IZqno3BZcPnaFmRKCOB3G
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3724;
 6:cbwrqVRw7sQKtgiIPDEbOyaMDNoj/OAUUwGSIeIsZc4HRWtCsS9CCZ6MuBc+2iAn2llEc6G5FyPWlFJGkriM4z6gAHV/jq39IzBcl9cPiBy1OLXfnkPMfTX6utpcfAvysG20tJ+hnJMCQ58La7dqKScLE8ZoBPxVCuASu1RZ7gi5JU16hPg/ARSplaAOVkhEMCRcaFQssOAXVfeVw65hbXD1rwUCuyWeFib5wsr8h9tJbqglF0ERWyVt40h/nOiZo8SCwEWFtOLulVHKS3yIubjkB8Y6nH20qSQOpPyZoqfboer3F2dSGatBGiDQhPFjt2iFgYe8S44QvXjfkvweMaJddifxZ9MQc+crYLNbNy3i+lZFI3tp/ovMCF0OLW79tPx0+qJcX7HkXaLYFtq9TbU8AUO2TSIYZGpxQwbnBoK+FiT3ldqanXeEThotLXGZJFMet29ipD6S34t+dJPIpw==;
 5:Hsc2nrOtBamN8Eb7ekehzSlSE/puwHXWUY7aQSWOLGt/YZa1Cs8JbDpz3cT335n+DAgoTTvjjxtCxvVwEZv46D5ftYggxHJrXQsCcwbQryCOQcYkukqRVDM9/uyNbClV3RQLZOJ2NLQU6iKt7GdG6icGDXNiAqJK/xmFJVEZWPg=;
 7:2R2YK3gY6fuigwIQGQZGUWNI3bB0s/a60X20LyWe/WA7u5SbWbMgygvUrRnDoyZThIQECrOxasgPrITbko5LQpOu9O+O1p93FA3yfc0qDhLM4w4fLRfOEoWzh2NmuQ5cqNtwDCSsjnPB7PaFgVvfow==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0701MB3724;
 20:xHmcE5Q70zXu1YEvhf3Z/hPQaiYJoXk7uWfPjB5cpzF3eEmtotk3Y07l3jER8N9T6INJ4A3ZI8erTIH1P3Q/iP+vdvq8mc1zPVItLsdPb2vvKz5xqgVRa/htcdgUuvQqUdU4XV7QjWE4AcvKtcpcyvumbXRlRYD5DQDTPtBes5RYGgpYl5eHz78aSjKOA/aM0/Dwufr2yt5+xFFIaFdroyvKs/jF/1vfcU9liEIAG6uX3tLe1UaX63V1sXqp9muZ
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2018 12:29:07.8004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f380ae5a-9483-4053-9603-08d660f693fe
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0701MB3724
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
X-CRM114-CacheID: sfid-20181213_042922_950848_CABD4F87 
X-CRM114-Status: GOOD (  14.22  )
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

This patch adds support for mastership request to I3C subsystem.

Mastership event is enabled for all the masters on the I3C bus
by default.

Mastership request occurs in the following cases:
- Mastership is requested automatically after secondary master
receives mastership ENEC event. This allows secondary masters to
initialize their bus
- If above procedure fails for some reason, user can force
mastership request through sysfs. Of course, mastership event
still has to be enabled on current master side
- Mastership is also requested automatically when device driver
tries to transfer data using master controller in slave mode.

There is still some limitation:
- I2C devices are not registered on secondary master side. I2C
devices received in DEFSLVS CCC command are added to device list
just to send back this information to the other master controllers
in case of bus handoff. We can add support for this in the future
if there is such use case.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c       | 260 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/i3c/master.h |  43 +++++++-
 2 files changed, 289 insertions(+), 14 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 68d6553..e98b600 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -460,6 +460,15 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
 	return 0;
 }
 
+static int i3c_master_request_mastership(struct i3c_master_controller *master)
+{
+	if (!master->ops->request_mastership)
+		return -ENOTSUPP;
+	if (master->ops->request_mastership(master))
+		return -EIO;
+	return 0;
+}
+
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
@@ -491,8 +500,15 @@ static ssize_t current_master_show(struct device *dev,
 				   char *buf)
 {
 	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	struct i3c_master_controller *master;
 	ssize_t ret;
 
+	if (!i3cbus->cur_master) {
+		master = container_of(i3cbus, struct i3c_master_controller, bus);
+		if (i3c_master_request_mastership(master))
+			return sprintf(buf, "unknown\n");
+	}
+
 	i3c_bus_normaluse_lock(i3cbus);
 	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
 		      i3cbus->cur_master->info.pid);
@@ -659,6 +675,11 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 	if (!cmd || !master)
 		return -EINVAL;
 
+	if (master->op_mode == I3C_SLAVE_MODE) {
+		if (i3c_master_request_mastership(master))
+			return -EIO;
+	}
+
 	if (WARN_ON(master->init_done &&
 		    !rwsem_is_locked(&master->bus.lock)))
 		return -EINVAL;
@@ -1371,6 +1392,7 @@ static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 						      dev->info.dyn_addr);
 		if (status != I3C_ADDR_SLOT_FREE)
 			return -EBUSY;
+
 		i3c_bus_set_addr_slot_status(&master->bus,
 					     dev->info.dyn_addr,
 					     I3C_ADDR_SLOT_I3C_DEV);
@@ -1491,6 +1513,46 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
 }
 
 /**
+ * i3c_master_get_accmst_locked() - send a GETACCMST CCC command
+ * @master: master used to send frames on the bus
+ * @info: I3C device information
+ *
+ * Send a GETACCMST CCC command.
+ *
+ * This should be called if the curent master acknowledges bus takeover.
+ *
+ * This function must be called with the bus lock held in write mode.
+ *
+ * Return: 0 in case of success, a positive I3C error code if the error is
+ * one of the official Mx error codes, and a negative error code otherwise.
+ */
+int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
+				 const struct i3c_device_info *info)
+{
+	struct i3c_ccc_getaccmst *accmst;
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	accmst = i3c_ccc_cmd_dest_init(&dest, info->dyn_addr, sizeof(*accmst));
+	if (!accmst)
+		return -ENOMEM;
+
+	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
+
+	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
+
+	if (ret)
+		return ret;
+
+	if (dest.payload.len != sizeof(*accmst))
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_get_accmst_locked);
+
+/**
  * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
  * @master: master doing the DAA
  *
@@ -1554,11 +1616,8 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 	struct i3c_dev_desc *i3cdev;
 	int ret;
 
-	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
-		return -EINVAL;
-
-	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
-	    master->secondary)
+	if (master->op_mode == I3C_MASTER_MODE &&
+	    !i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
 		return -EINVAL;
 
 	if (master->this)
@@ -1569,7 +1628,8 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 		return PTR_ERR(i3cdev);
 
 	master->this = i3cdev;
-	master->bus.cur_master = master->this;
+	if (master->op_mode == I3C_MASTER_MODE)
+		master->bus.cur_master = master->this;
 
 	ret = i3c_master_attach_i3c_dev(master, i3cdev);
 	if (ret)
@@ -1727,6 +1787,12 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	}
 
 	/*
+	 * Don't reset addresses if this is secondary master.
+	 * Secondary masters can't do DAA.
+	 */
+	if (master->secondary)
+		return 0;
+	/*
 	 * Reset all dynamic address that may have been assigned before
 	 * (assigned by the bootloader for example).
 	 */
@@ -1738,6 +1804,7 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	ret = i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
 				      I3C_CCC_EVENT_SIR | I3C_CCC_EVENT_MR |
 				      I3C_CCC_EVENT_HJ);
+
 	if (ret && ret != I3C_ERROR_M2)
 		goto err_bus_cleanup;
 
@@ -1789,6 +1856,44 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
 	return NULL;
 }
 
+int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
+			   struct i2c_dev_boardinfo *info)
+{
+	enum i3c_addr_slot_status status;
+	struct device *dev = &master->dev;
+	struct i2c_dev_boardinfo *boardinfo;
+	struct i2c_dev_desc *i2cdev;
+	int ret;
+
+	status = i3c_bus_get_addr_slot_status(&master->bus,
+					      info->base.addr);
+	if (status != I3C_ADDR_SLOT_FREE)
+		return -EBUSY;
+
+	boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
+	if (!boardinfo)
+		return -ENOMEM;
+
+	i3c_bus_set_addr_slot_status(&master->bus,
+				     info->base.addr,
+				     I3C_ADDR_SLOT_I2C_DEV);
+
+	boardinfo->base.addr = info->base.addr;
+	boardinfo->lvr = info->lvr;
+
+	i2cdev = i3c_master_alloc_i2c_dev(master, boardinfo);
+	if (IS_ERR(i2cdev))
+		return PTR_ERR(i2cdev);
+
+	ret = i3c_master_attach_i2c_dev(master, i2cdev);
+	if (ret) {
+		i3c_master_free_i2c_dev(i2cdev);
+		return ret;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_add_i2c_dev);
+
 /**
  * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
  * @master: master used to send frames on the bus
@@ -1832,6 +1937,15 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto err_free_dev;
 
+	if (I3C_BCR_DEVICE_ROLE(newdev->info.bcr) == I3C_BCR_I3C_MASTER &&
+	    master->ops->enable_mastership) {
+		if (master->ops->enable_mastership(newdev)) {
+			dev_warn(&master->dev,
+				 "Failed to enable mastership for device: %d%llx",
+				 master->bus.id, newdev->info.pid);
+		}
+	}
+
 	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
 	if (olddev) {
 		newdev->boardinfo = olddev->boardinfo;
@@ -2102,6 +2216,11 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 			return -ENOTSUPP;
 	}
 
+	if (master->op_mode == I3C_SLAVE_MODE) {
+		if (i3c_master_request_mastership(master))
+			return -EIO;
+	}
+
 	i3c_bus_normaluse_lock(&master->bus);
 	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
 	if (!dev)
@@ -2393,15 +2512,31 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 	return 0;
 }
 
+static void i3c_master_bus_takeover(struct work_struct *work)
+{
+	struct i3c_master_controller *master;
+
+	master = container_of(work, struct i3c_master_controller, mastership);
+
+	i3c_bus_maintenance_lock(&master->bus);
+	master->ops->update_devs(master);
+	i3c_bus_maintenance_unlock(&master->bus);
+	/*
+	 * We can register I3C devices received from master by DEFSLVS.
+	 */
+	master->init_done = true;
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_master_register_new_i3c_devs(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+}
+
 /**
  * i3c_master_register() - register an I3C master
  * @master: master used to send frames on the bus
  * @parent: the parent device (the one that provides this I3C master
  *	    controller)
  * @ops: the master controller operations
- * @secondary: true if you are registering a secondary master. Will return
- *	       -ENOTSUPP if set to true since secondary masters are not yet
- *	       supported
+ * @secondary: true if you are registering a secondary master.
  *
  * This function takes care of everything for you:
  *
@@ -2424,10 +2559,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	struct i2c_dev_boardinfo *i2cbi;
 	int ret;
 
-	/* We do not support secondary masters yet. */
-	if (secondary)
-		return -ENOTSUPP;
-
 	ret = i3c_master_check_ops(ops);
 	if (ret)
 		return ret;
@@ -2439,6 +2570,7 @@ int i3c_master_register(struct i3c_master_controller *master,
 	master->dev.release = i3c_masterdev_release;
 	master->ops = ops;
 	master->secondary = secondary;
+	master->op_mode = secondary ? I3C_SLAVE_MODE : I3C_MASTER_MODE;
 	INIT_LIST_HEAD(&master->boardinfo.i2c);
 	INIT_LIST_HEAD(&master->boardinfo.i3c);
 
@@ -2497,6 +2629,13 @@ int i3c_master_register(struct i3c_master_controller *master,
 		goto err_del_dev;
 
 	/*
+	 * We can stop here. Devices will be attached after bus takeover.
+	 * Secondary masters can't do DAA.
+	 */
+	if (master->secondary)
+		return 0;
+
+	/*
 	 * We're done initializing the bus and the controller, we can now
 	 * register I3C devices dicovered during the initial DAA.
 	 */
@@ -2521,6 +2660,95 @@ int i3c_master_register(struct i3c_master_controller *master,
 EXPORT_SYMBOL_GPL(i3c_master_register);
 
 /**
+ * i3c_master_switch_operation_mode() - changes operation mode of the controller
+ * @master: master used to send frames on the bus
+ * @new_master: the device that takes control of the bus
+ * @op_mode: the master new operation mode
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
+				     struct i3c_dev_desc *new_master,
+				     enum i3c_op_mode new_op_mode)
+{
+	if (master->op_mode == new_op_mode)
+		return -EEXIST;
+
+	master->op_mode = new_op_mode;
+
+	if (new_op_mode == I3C_SLAVE_MODE) {
+		master->bus.cur_master = new_master;
+	} else {
+		master->bus.cur_master = master->this;
+		INIT_WORK(&master->mastership, i3c_master_bus_takeover);
+		queue_work(master->wq, &master->mastership);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_switch_operation_mode);
+
+/**
+ * i3c_master_mastership_ack() - performs operations before bus handover.
+ * @master: master used to send frames on the bus
+ * @info: I3C device information
+ *
+ * Basically, it sends DEFSLVS command to ensure new master is taking
+ * the bus with complete list of devices and then acknowledges bus takeover.
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_master_mastership_ack(struct i3c_master_controller *master,
+			      const struct i3c_device_info *info)
+{
+	int ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_defslvs_locked(master);
+	i3c_bus_maintenance_unlock(&master->bus);
+	if (ret)
+		return ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_get_accmst_locked(master, info);
+	i3c_bus_maintenance_unlock(&master->bus);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
+
+static void i3c_secondary_master_bus_init(struct work_struct *work)
+{
+	struct i3c_master_controller *master;
+
+	master = container_of(work, struct i3c_master_controller, mastership);
+
+	if (i3c_master_request_mastership(master))
+		dev_err(&master->dev, "Mastership failed.");
+}
+
+/**
+ * i3c_secondary_master_events_enabled() - event from current master
+ * @master: master used to send frames on the bus
+ * @evts: enabled events
+ *
+ * This function allows to perform required operations after current
+ * master enables particular events on the bus.
+ */
+void i3c_secondary_master_events_enabled(struct i3c_master_controller *master,
+					 u8 evts)
+{
+	if ((evts & I3C_CCC_EVENT_MR) &&
+	    !master->init_done) {
+		INIT_WORK(&master->mastership, i3c_secondary_master_bus_init);
+		queue_work(master->wq, &master->mastership);
+	}
+}
+EXPORT_SYMBOL_GPL(i3c_secondary_master_events_enabled);
+
+/**
  * i3c_master_unregister() - unregister an I3C master
  * @master: master used to send frames on the bus
  *
@@ -2552,6 +2780,11 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 	if (!master || !xfers)
 		return -EINVAL;
 
+	if (master->op_mode == I3C_SLAVE_MODE) {
+		if (i3c_master_request_mastership(master))
+			return -EIO;
+	}
+
 	if (!master->ops->priv_xfers)
 		return -ENOTSUPP;
 
@@ -2657,5 +2890,6 @@ static void __exit i3c_exit(void)
 module_exit(i3c_exit);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("I3C core");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f13fd8b..ada956a 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -282,6 +282,16 @@ enum i3c_addr_slot_status {
 };
 
 /**
+ * enum i3c_op_mode - I3C controller operation mode
+ * @I3C_SLAVE_MODE: I3C controller operates in slave mode
+ * @I3C_MASTER_MODE: I3C controller operates in master mode
+ */
+enum i3c_op_mode {
+	I3C_SLAVE_MODE,
+	I3C_MASTER_MODE
+};
+
+/**
  * struct i3c_bus - I3C bus object
  * @cur_master: I3C master currently driving the bus. Since I3C is multi-master
  *		this can change over the time. Will be used to let a master
@@ -418,6 +428,20 @@ struct i3c_bus {
  *		      for a future IBI
  *		      This method is mandatory only if ->request_ibi is not
  *		      NULL.
+ * @update_devs: updates device list. Called after bus takeover. Secondary
+ *               master can't perform DAA procedure. This function allows to
+ *               update devices received from previous bus owner in DEFSLVS
+ *               command. Useful also when new device joins the bus controlled
+ *               by secondary master, main master will be able to add
+ *               this device after mastership takeover.
+ * @request_mastership: requests bus mastership. By default called by secondary
+ *                      master after ENEC CCC is received and when devices were
+ *                      not fully initialized yet. Mastership is also requested
+ *                      when device driver wants to transfer data using master
+ *                      in slave mode.
+ * @enable_mastership: enable the Mastership for specified device. Mastership
+ *                     does not require handler. Mastership is enabled for all
+ *                     masters by default.
  */
 struct i3c_master_controller_ops {
 	int (*bus_init)(struct i3c_master_controller *master);
@@ -445,6 +469,9 @@ struct i3c_master_controller_ops {
 	int (*disable_ibi)(struct i3c_dev_desc *dev);
 	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
 				 struct i3c_ibi_slot *slot);
+	void (*update_devs)(struct i3c_master_controller *master);
+	int (*request_mastership)(struct i3c_master_controller *master);
+	int (*enable_mastership)(struct i3c_dev_desc *dev);
 };
 
 /**
@@ -458,6 +485,7 @@ struct i3c_master_controller_ops {
  * @ops: master operations. See &struct i3c_master_controller_ops
  * @secondary: true if the master is a secondary master
  * @init_done: true when the bus initialization is done
+ * @op_mode: controller operation mode
  * @boardinfo.i3c: list of I3C  boardinfo objects
  * @boardinfo.i2c: list of I2C boardinfo objects
  * @boardinfo: board-level information attached to devices connected on the bus
@@ -467,6 +495,7 @@ struct i3c_master_controller_ops {
  *	in a thread context. Typical examples are Hot Join processing which
  *	requires taking the bus lock in maintenance, which in turn, can only
  *	be done from a sleep-able context
+ * @mastership: work for switching operation mode after bus takeover
  *
  * A &struct i3c_master_controller has to be registered to the I3C subsystem
  * through i3c_master_register(). None of &struct i3c_master_controller fields
@@ -480,12 +509,14 @@ struct i3c_master_controller {
 	const struct i3c_master_controller_ops *ops;
 	unsigned int secondary : 1;
 	unsigned int init_done : 1;
+	enum i3c_op_mode op_mode;
 	struct {
 		struct list_head i3c;
 		struct list_head i2c;
 	} boardinfo;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
+	struct work_struct mastership;
 };
 
 /**
@@ -523,7 +554,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
 
 int i3c_master_get_free_addr(struct i3c_master_controller *master,
 			     u8 start_addr);
-
+int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
+			   struct i2c_dev_boardinfo *info);
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
@@ -536,6 +568,15 @@ int i3c_master_register(struct i3c_master_controller *master,
 			const struct i3c_master_controller_ops *ops,
 			bool secondary);
 int i3c_master_unregister(struct i3c_master_controller *master);
+int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
+				 const struct i3c_device_info *info);
+int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
+				     struct i3c_dev_desc *new_master,
+				     enum i3c_op_mode new_op_mode);
+int i3c_master_mastership_ack(struct i3c_master_controller *master,
+			      const struct i3c_device_info *info);
+void i3c_secondary_master_events_enabled(struct i3c_master_controller *master,
+					 u8 evts);
 
 /**
  * i3c_dev_get_master_data() - get master private data attached to an I3C
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
