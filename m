Return-Path: <SRS0=FhwC=PT=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAD_ENC_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF35C43387
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D040520874
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="js7jOZK6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="jH35kCVf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="fzA0X6fe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D040520874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkuWTEPRY6lZh2xUaXrpQsfZGGX9f7SumpyThRS3TXM=; b=js7jOZK6No6O1I
	KWaVf1csBQrfcGrcGbdiwbXWFk/dqrsvt5cqrtXFs14dA9wadWz/fZHnduZboY0f16GcJ65DxT8bD
	x9FP/+rZDmQrkOJkLfYfo1OWWLCPeKvtcrnulzilb/3/MqACey/+x4b4muT+AWRUpztMdKE7L8Tyt
	/m4YKHwl7d8ZSvsHSFd7jR3d02yAcY67jA8y1JncFAknwShB86nb/t5uZ1vbttDKk3b5ppIu09rb8
	d4xJL2BSWf4KsmZPcR1j1MBfQNSNf8ZzXI11PVQ5xzvIADs17Sz0AqWWm382ryThrVa2aCBq9B3Xo
	INBIxbSSI/zcYpIAASpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi0r4-0004xT-CZ; Fri, 11 Jan 2019 17:44:26 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi0r0-0004wP-NQ
 for linux-i3c@lists.infradead.org; Fri, 11 Jan 2019 17:44:24 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0BHfYSk007015; Fri, 11 Jan 2019 09:44:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=t+4Am41mkmEWTvdX7xLslay0/FqG7XNbaxrAerbz2JM=;
 b=jH35kCVf+WXoj5bkNYMvH1zNR7R9PFD77V2jjlGC2iC1ZwLg1B4Gitm1LF6j4tq3OQFx
 zHyV7cno3liswbzoh0T7QxwwHVIRVX7OhxBGJ+dYmU/SBP8q4A0Jyi9gpKYoCPTwY+BT
 /TdoQVkVbuec+OAcYL3st0XRY0YTweeZm86HwUm/a7pYaFj8GCpxL0PaI7RajS14H43i
 qhh6fBgZos5AP4DZIXsvvKwOUbggyYY3fgDcs0ntFqE7KIbeid4WxdFiHARi5yc4aiab
 /JKrSURJEzv+TXWilCMChKfnUMmi194AByOvH+O0rkWOgfJIeejNPjAmqL01N49ehMHM MQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2px0jqesb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 11 Jan 2019 09:44:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+4Am41mkmEWTvdX7xLslay0/FqG7XNbaxrAerbz2JM=;
 b=fzA0X6fetpRNlI0wUBUXmkegSZiAo0tLkz3ZG4IiDrYRHCBqDYF22jgAws5jZqeRDJK3kw5G0xRGs6pOI7VJuz9mU8GCrN6WFwqkpyjqTzam75pxkjTQVRpZbIWRzb3zRNAQG2E7KZRVtR3nq1q3FlWbzpTdS9I05F4fPtNOPVU=
Received: from CO2PR07CA0058.namprd07.prod.outlook.com (2603:10b6:100::26) by
 BYAPR07MB4407.namprd07.prod.outlook.com (2603:10b6:a02:c1::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.18; Fri, 11 Jan 2019 17:44:17 +0000
Received: from BY2NAM05FT053.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by CO2PR07CA0058.outlook.office365.com
 (2603:10b6:100::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1516.14 via Frontend
 Transport; Fri, 11 Jan 2019 17:44:17 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT053.mail.protection.outlook.com (10.152.100.190) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.10 via Frontend Transport; Fri, 11 Jan 2019 17:44:16 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x0BHiCga001990
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 11 Jan 2019 12:44:14 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 11 Jan 2019 18:44:12 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 11 Jan 2019 18:44:12 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x0BHiBxY001815;
 Fri, 11 Jan 2019 17:44:11 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x0BHiBE7001814;
 Fri, 11 Jan 2019 17:44:11 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 1/3] i3c: Add support for mastership request to I3C
 subsystem
Date: Fri, 11 Jan 2019 17:43:35 +0000
Message-ID: <1eca82e2d7bbff19597b78a3ce1ad62273015529.1547227861.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <cover.1547227861.git.pgaj@cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(36092001)(199004)(189003)(305945005)(476003)(126002)(2616005)(446003)(426003)(69596002)(106466001)(105596002)(336012)(76176011)(30864003)(478600001)(26826003)(51416003)(186003)(87636003)(68736007)(11346002)(86362001)(26005)(50466002)(48376002)(5660300001)(4326008)(486006)(107886003)(54906003)(42186006)(118296001)(36756003)(2906002)(16586007)(53936002)(6916009)(316002)(8676002)(81156014)(81166006)(47776003)(97736004)(8936002)(50226002)(2351001)(14444005)(6666004)(356004)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB4407; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BY2NAM05FT053;
 1:PIBWuANcEyf4S6080VIPJsdg+Vnep2w5cCO+2Hhjn7u2OUJDWKGpox+rnNMbbSX86t5irLDfc/WJcqb5ah5NJRw1JxMH/74CqJmHpD8MWfpzGRAEmxyxvL3cL5UACKeWC2a96PwqmC/60Y65EfZzVw==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d776adfb-0cb4-43b9-9e28-08d677ec68a5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060);
 SRVR:BYAPR07MB4407; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR07MB4407;
 3:Pu0jfy9fd6ruSTdBiGoFu/Wpo7ZInv6PwqLVblkldpm8PIh0xXB0wc1h6+2mZ9rzX5STCQkILHV/HUFmrkZ9jEEfuqItTc5f7D1EdqcSgAmQ62y5hGcYjt86dL7/hufIp7nrArI9w8tBVvPpP0nqU7MzAEMUvdQSdj+uyi1MyW3UE7mSWa+fn4mRjbgEpOYjoSwjJISJS81iUcPRff3Qp11Yb7qk0ElUa9khgY3/bWdIVa824E81kfeeFGPIuim1rfk+pgm+u4u3U0Ihqtmsfb3Dr7wcqiNpLMZhDYRCo3m/GJJCyJZo504W9XgIvpL4e6hsMNS95qzwWk6QYp08xmLeiFseEdYPaxCyejiZrlP0onunWmOP2tw/Rt7T1FxU;
 25:0htkPTNAJNT7zbLnR7e6JS2vnhzQB5e389sJVV1xxzYVPU5ofZ5wokBXWQZ/0WIMsKkiY53bd76rjCcmeN3UVHA1EN80x2rLQqj3eoaBDu1lETu4NSoLlSuna53g3ir4VLOe9SOR72tgz1NGCn/mb+f2dBvm5ksrCp5pfOk5HzoVSuo1fwOAUen8f/KyCHgRu/zynzFMEOj3Wpt3LrQAZnH7sZrsGcalXfIokK8c+DSswaj3si8YrAqZc2ID+gI4PxKLuVZ2wtOsDhdOX6zwlA18mpR32d03+wNqESZw+n5M0olqfYVvoae/KGuQ5NxVlrGDa4CoIjvz77rmsLOw1A==
X-MS-TrafficTypeDiagnostic: BYAPR07MB4407:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR07MB4407;
 31:4GCq2gRofiflde3oSGJ/OY++44NcyXc2ip+LLoxlmMV3Teg8j923/tkF0Bwh7nw38Avcv6Sl9xTeWjp1PjLeyA87OyOrPhS/1WQoaJOpnOP/mMv0XME0uOXe0Bo61jI0BN1gzT1beApGaDYvP40qVpi0MtaO3Hi6G9ia/UoxxhRdBZP1oKBr6DMUcyqljL0yOSokppQxCbG3j9jOWbjno1Ygt4pEK1wWQNB7VOs10vc=;
 20:J2ooztgNhDPh9/e/Yclc8UqRMgq7ZGSNcWOXRBNDIOkHA0LGUuEumOojBG4h5ww9XwmTJW+rBQSdNuEJK3JTcSOkGw1aAMU1acw0XTsu1Qb7SOYmC+SIAw8GpeFGY+xMiCwViXPfWNz64Ok8vA8hpVaO252Y3+9cEGvF3RBzktjJU9nxek2pqqYKE3vA4SDAEqlqfl1P8KviaTXCnIzst3HY2qq79dxrniGu12+T0tNo13zxhMcRC6uaN8wWNdA8wBjB/BoRfqM7iEMz3szVlg2YYXxOwesws9cOCTGu//dFRL89ow8OVNkvwyREAj6q9SIvfZp7BMYtsHPLNxT3ntPM6RUgZWa0Ib58wRbi2I3lvbabhrL+sUDwvyooJHhhzSJlghsUlw1DIpbAEfJ/rUruWFmtiR9IV8ePwLC8gQpmCaXyMvrVIZpvHQUNhda4vn2TqiZlQdS6e0wWCHVsmpwdHhvDbAsDj6G/eOzv9o4BBurxUpotAIUkm1JSmPep
X-Microsoft-Antispam-PRVS: <BYAPR07MB4407B01C9A8666A07FD8EB3FC2850@BYAPR07MB4407.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BYAPR07MB4407;
 4:LErZf8DAz/kgz3eIm/hX9dzbwh6WQtXeN/KZYloadhqwe5j7+0SQgbENt0iOY0RBkSQd6os5ejEeQp1f/QVcesnCWm3ianWWrN6KtTu1rmZxUAbVyAHDVZ6nNmVLyuWDt14QMpukyJpTG8Np33trKUB3cqx+nBylGCirET4fUfTFwAXFMyrmyh6o2Iu9c29FvceB+BQYDBFiPIsJYVmT7ych2FvY1X/Wc+GKKEhok+mQ3nqL94N9nLZDFyLRW58rEzgplOb+wgaMnGOKiQFYGR2UyM1ASfGV0yGCYx158N5t2mObGekh6dyNfBCm7+wK
X-Forefront-PRVS: 09144DB0F7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR07MB4407;
 23:vIrwFQfcZZwvb20PzTmRDRc5tI8PPt9YQyXYXNXqw?=
 =?us-ascii?Q?eqeo11xUOoZEDv3gTl2412givWAPppF/Kj12YInupOgMUZKnq1+HknwZoLGB?=
 =?us-ascii?Q?4VgXLaEMlkXSb3TLXshey1ib0NiHJrwdiMEMERc3OG5hnHIbzlpH+Sp6NgnX?=
 =?us-ascii?Q?iqKT3mEhKn/d09Jcpsx/6FYgK9qamyFEyTxbVrOdGlUW4H3kIinHCviFeaY2?=
 =?us-ascii?Q?bVURt/kmxymQBtXcZMSe/wKEeZbVJV5cTbDCtWI+Fv9tj5w+X9bScJK8SlEz?=
 =?us-ascii?Q?9NAP5QNjFneg0v0NNqzXFsDcfMnXkhiUg0rvwS/0dN1nTRUAfSAZKB1xf7lV?=
 =?us-ascii?Q?IdbQEIkTMbHBvrM456B5zqkUWX/GyUFw9RraAQMRqGOXa2Wc+t+lsfaLRoFR?=
 =?us-ascii?Q?LAOvzinXgQwnDljwrEGutP/BVDJmWXiyczsuqVwsBMIYbuRxWhNtu9fvei6a?=
 =?us-ascii?Q?+G4Z8hcFz60Pt71aiZWADtMYF6wayXEn0GK26hbEPSqcT+cMTYpFjDhKwfMZ?=
 =?us-ascii?Q?lK+FGYsXpmiK3/4Amm814o59XEg0YfxZ+pFbitdqwJPoLrsHIa58AI8cxWYh?=
 =?us-ascii?Q?vBxVxxukcRSpbJgT05KrN0Vuka1Yw+ZVIe2Dkzf+vBeWKYAgMvsPZkVYYQnH?=
 =?us-ascii?Q?t3lQtPV1YXqhpQ0HdkHlMF+zX2zU2Wrm0C/GrgJgTuKhxHCFW+AnfJbDPaIe?=
 =?us-ascii?Q?duohb2/URTV5vBPDZmLxhJKeaXMueqc0fVPWjg3RvB9BU4msNJExkg1EonIG?=
 =?us-ascii?Q?wd2A9hd2Ex7TS4AtCJw97bm7TtTjlmrc1F8jXPb0w79hYWNE1TJvjD8f6j1g?=
 =?us-ascii?Q?V7hna/wloAUu8rYIbnMytXwcDL2K7A/nLyOBUodC7rNBzHyXlkeCqxEq8rNQ?=
 =?us-ascii?Q?pY39gdSuOVtvc3tONgbuYf1HwSrmOjq5G0DMXUdRldg72kjwp1Rv93ODHLlm?=
 =?us-ascii?Q?uYGT8lvzvCzJs3kXjSqnqrlQx2P8B8Z2lxt4AkVmYDoeMQSyQRakNdT6zewh?=
 =?us-ascii?Q?DW2uQS2E86YX0rIpK+ZnD6Uxg9RgVVKSy6TTEyR735K8g5AtO/MzkniwSTL0?=
 =?us-ascii?Q?MhRjseStJeRQA1hq2u5qBmTMDWQVSD9kFJKT+/qdQ5IvfWm7HfsWVpTmhAvj?=
 =?us-ascii?Q?hyL/p34wJI2r+1kN6iU0g4iW0F8b+bfzD/lecq4qfVQChFwVzwbX2Ue3p41Q?=
 =?us-ascii?Q?RSZjBdq352xzolKpbFmIDJ3hKN339AfXvb6sO6zP8PiQPZrVqpSWry3keY5c?=
 =?us-ascii?Q?vheUJgbyPtdVTkt7E1Zfa4ckjAM062EbkngI3yR?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ls77x1bxZf0DHPizSEMdi0/wr+Jk6yfOLn2tN3RysSSMLDdy5AEcPp0XSp0YYVr/S689+y6GHXF23QjChfwcx41f5yNMVUwD7vUkkZR6fLEldKqTyQg1efpOtFKjIgV5piSDZ/QsCJkEo1dR48Lwm9BIBr9I+e3kMF7GqzL6t+BTaV4r8NJ4wgVW/WsC8tF/lkfBdQMpObuh2iYTnTUnfpmzYNZyQE0x0pKOgjODGZyLCeq9Kx7Zd3ml8sey0MWXfOei3vv5/+brpPZ+63Xw4s0e+QedKJUjqc8h7aZ1SPAd9kXLnG74LDspPzgtYDaCvHihaaM5IRVHNEOO+3XcJjEWwpBqUSj9CJKMz6EO0b1jBreF/vGnsSPnmk5gpELRXBePm5tDayWzxaY5ydyLjruz18+t5qeKFg4YJmHDzjw=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR07MB4407;
 6:48hc6Os8F8nxHvS8Sx3RIK4pKUawc9gK1yF6ujLJXAB/NE7ST7elKs3+gBH4jTdq9KSz/hSDMDr+pDXRT1182kg7s1zAVGwmzAkEWGWGWHUzlnNmWlZhiHxp9O8D3LVRAvFHLXJWcJdQNJVdL5kJSAfG+5Tz/IhvtBOqutzZ8HpsW91Z0Oaka3I5Lt4MHheBogCWjK80paYCFpul3aI5OgFBUuVVJR6KRBBJhwnCnAAiFVdV6XbV0v1OJYoKqKZ/2TcX62jloo4MJGRydxGOl8lYK3j8QLs6aOeROET8FJOJIiMVwXXN1FiGlCUNqeNkweUJw+kZK1yfOVOTCCa+dttYSCTXWk+2sxjGLa/+kftxjeyDKlE+mga5hyzlLWL046shcKkSoIoTvhek8vIcEFSINpAWMMvSXTQ3aOuJEMRONUXbwIrB/UHHU0aT8PVdot2RQ8dDvHN4AGPGTwblwg==;
 5:QVeFGWytuh9K4g/DtwwxMLDD3jbgkncbwJruv4sLZWaAiyIppwlp6EcZkSv+Gsv42lYlMGyI7o+BZ0x8rYRjnvvAG2vvC/JOawXXx0kSJre6aD5YRUxNiXspUWBqTMYfazKGNOGA64Yg7fzEOoD0w4JnmhXsqE1ozoUP6bcyU1U7UniWG4ybky/0kSpjYTEQ0u3ySzgqYWQwzEDA2uXPIQ==;
 7:EQpTVZy8eoIuYPvYQNHuixMKqv3NixFmsPKi2Y0MgYQ4Zq2P/wh+SoJ7aXmyZlNDXy4P14rE2PTMFvqzjpRIJEO0t2i/ASMDyyhluPMn2r9feMab3bNp5A4QKOSNteBurd40cL1Zr5MNhgD8b+Ng7w==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BYAPR07MB4407;
 20:ENae9Yymqqr8wlY+h6JiQWJXNaDU/thjSsYIT2ljmuTttZHTtEbx6hLpnN4NZJsKiisYy+uOX78u15jUMaqzqMPge//nrhCDchBscX+Ao3uxcFvIxcysaNFIJv/BbV8JMGuW23KO0jNQAKIVcE5q88un6ry+6mYQuAk5iRpcKUE0VZReR2fHI0ABXIgcMzW+yVux7ugo1yXwOKKCpniZ8jleOCYNcXLK2UnXSIS4vpEqVc9J4ZfPAW9puhG40Sxj
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2019 17:44:16.8675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d776adfb-0cb4-43b9-9e28-08d677ec68a5
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4407
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-11_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_094422_879934_C3141A5F 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 psroka@cadence.com, rafalc@cadence.com, vitor.soares@synopsys.com
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

Changes in v2:
- Add mastership disable event hook
- Changed name of mastership enable event hook
- Add function to test if master owns the bus
- Removed op_mode
- Changed parameter of i3c_master_get_accmst_locked, no need to
  pass full i3c_device_info
- Removed redundant DEFSLVS command before GETACCMST
- Add i3c_master_bus_takeover function. There is a need to lock
  the bus before adding devices and no matter of the controller
  devices have to be added after mastership takeover.
- Add device registration during initialization on secondary master
  side. Devices received by DEFSLVS (if occured). If not, device
  initialization is deffered untill next mastership request.
---
 drivers/i3c/master.c       | 256 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/i3c/master.h |  29 ++++-
 2 files changed, 270 insertions(+), 15 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 68d6553..320d905 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -339,6 +339,37 @@ static int i3c_device_probe(struct device *dev)
 	return driver->probe(i3cdev);
 }
 
+static void i3c_master_enable_mr_events(struct i3c_dev_desc *i3cdev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(i3cdev);
+
+	if (!i3cdev)
+		return;
+
+	if (!master->ops->enable_mr_events)
+		return;
+
+	if (master->ops->enable_mr_events(i3cdev))
+		dev_warn(&master->dev,
+			 "Failed to enable mastership for device: %d%llx",
+			 master->bus.id, i3cdev->info.pid);
+}
+
+static void i3c_master_disable_mr_events(struct i3c_dev_desc *i3cdev)
+{
+	struct i3c_master_controller *master = i3c_dev_get_master(i3cdev);
+
+	if (!i3cdev)
+		return;
+
+	if (!master->ops->disable_mr_events)
+		return;
+
+	if (master->ops->disable_mr_events(i3cdev))
+		dev_warn(&master->dev,
+			 "Failed to disable mastership for device: %d%llx",
+			 master->bus.id, i3cdev->info.pid);
+}
 static int i3c_device_remove(struct device *dev)
 {
 	struct i3c_device *i3cdev = dev_to_i3cdev(dev);
@@ -351,6 +382,9 @@ static int i3c_device_remove(struct device *dev)
 
 	i3c_device_free_ibi(i3cdev);
 
+	if (I3C_BCR_DEVICE_ROLE(i3cdev->desc->info.bcr) == I3C_BCR_I3C_MASTER)
+		i3c_master_disable_mr_events(i3cdev->desc);
+
 	return ret;
 }
 
@@ -460,6 +494,26 @@ static int i3c_bus_init(struct i3c_bus *i3cbus)
 	return 0;
 }
 
+static int i3c_master_request_mastership(struct i3c_master_controller *master)
+{
+	if (WARN_ON(master->init_done &&
+	    !rwsem_is_locked(&master->bus.lock)))
+		return -EINVAL;
+
+	if (!master->ops->request_mastership)
+		return -ENOTSUPP;
+
+	if (master->ops->request_mastership(master))
+		return -EIO;
+
+	return 0;
+}
+
+static bool i3c_master_owns_bus(struct i3c_master_controller *master)
+{
+	return master->bus.cur_master == master->this;
+}
+
 static const char * const i3c_bus_mode_strings[] = {
 	[I3C_BUS_MODE_PURE] = "pure",
 	[I3C_BUS_MODE_MIXED_FAST] = "mixed-fast",
@@ -491,8 +545,19 @@ static ssize_t current_master_show(struct device *dev,
 				   char *buf)
 {
 	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	struct i3c_master_controller *master;
 	ssize_t ret;
 
+	if (!i3cbus->cur_master) {
+		master = container_of(i3cbus,
+				      struct i3c_master_controller, bus);
+		i3c_bus_normaluse_lock(i3cbus);
+		ret = i3c_master_request_mastership(master);
+		if (ret)
+			return sprintf(buf, "unknown\n");
+		i3c_bus_normaluse_unlock(i3cbus);
+	}
+
 	i3c_bus_normaluse_lock(i3cbus);
 	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
 		      i3cbus->cur_master->info.pid);
@@ -663,6 +728,12 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
 		    !rwsem_is_locked(&master->bus.lock)))
 		return -EINVAL;
 
+	if (!i3c_master_owns_bus(master)) {
+		ret = i3c_master_request_mastership(master);
+		if (ret)
+			return ret;
+	}
+
 	if (!master->ops->send_ccc_cmd)
 		return -ENOTSUPP;
 
@@ -1491,6 +1562,46 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
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
+				 u8 addr)
+{
+	struct i3c_ccc_getaccmst *accmst;
+	struct i3c_ccc_cmd_dest dest;
+	struct i3c_ccc_cmd cmd;
+	int ret;
+
+	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
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
@@ -1554,12 +1665,9 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 	struct i3c_dev_desc *i3cdev;
 	int ret;
 
-	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
-		return -EINVAL;
-
-	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
-	    master->secondary)
-		return -EINVAL;
+	if (!master->secondary)
+		if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
+			return -EINVAL;
 
 	if (master->this)
 		return -EINVAL;
@@ -1569,7 +1677,8 @@ int i3c_master_set_info(struct i3c_master_controller *master,
 		return PTR_ERR(i3cdev);
 
 	master->this = i3cdev;
-	master->bus.cur_master = master->this;
+	if (!master->secondary)
+		master->bus.cur_master = master->this;
 
 	ret = i3c_master_attach_i3c_dev(master, i3cdev);
 	if (ret)
@@ -1727,6 +1836,13 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
 	}
 
 	/*
+	 * Don't reset addresses if this is secondary master.
+	 * Secondary masters can't do DAA.
+	 */
+	if (master->secondary)
+		return 0;
+
+	/*
 	 * Reset all dynamic address that may have been assigned before
 	 * (assigned by the bootloader for example).
 	 */
@@ -1789,6 +1905,44 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_dev_desc *refdev)
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
@@ -1832,6 +1986,9 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 	if (ret)
 		goto err_free_dev;
 
+	if (I3C_BCR_DEVICE_ROLE(newdev->info.bcr) == I3C_BCR_I3C_MASTER)
+		i3c_master_enable_mr_events(newdev);
+
 	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
 	if (olddev) {
 		newdev->boardinfo = olddev->boardinfo;
@@ -2103,6 +2260,12 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
 	}
 
 	i3c_bus_normaluse_lock(&master->bus);
+	if (!i3c_master_owns_bus(master)) {
+		ret = i3c_master_request_mastership(master);
+		if (ret)
+			return ret;
+	}
+
 	dev = i3c_master_find_i2c_dev_by_addr(master, addr);
 	if (!dev)
 		ret = -ENOENT;
@@ -2390,18 +2553,44 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 	     !ops->recycle_ibi_slot))
 		return -EINVAL;
 
+	if (ops->request_mastership &&
+	    (!ops->update_devs || !ops->enable_mr_events ||
+	     !ops->disable_mr_events))
+		return -EINVAL;
+
 	return 0;
 }
 
 /**
+ * i3c_master_bus_takeover() - register new I3C devices on bus takeover
+ * @master: master used to send frames on the bus
+ *
+ * This function is useful when devices were not added
+ * during initialization or when new device joined the bus
+ * which was under control of different master.
+ */
+void i3c_master_bus_takeover(struct i3c_master_controller *master)
+{
+	i3c_bus_maintenance_lock(&master->bus);
+	master->ops->update_devs(master);
+	i3c_bus_maintenance_unlock(&master->bus);
+
+	/*
+	 * We can register I3C devices received from master by DEFSLVS.
+	 */
+	i3c_bus_normaluse_lock(&master->bus);
+	i3c_master_register_new_i3c_devs(master);
+	i3c_bus_normaluse_unlock(&master->bus);
+}
+EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
+
+/**
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
@@ -2424,10 +2613,6 @@ int i3c_master_register(struct i3c_master_controller *master,
 	struct i2c_dev_boardinfo *i2cbi;
 	int ret;
 
-	/* We do not support secondary masters yet. */
-	if (secondary)
-		return -ENOTSUPP;
-
 	ret = i3c_master_check_ops(ops);
 	if (ret)
 		return ret;
@@ -2497,6 +2682,16 @@ int i3c_master_register(struct i3c_master_controller *master,
 		goto err_del_dev;
 
 	/*
+	 * Try to attach devices received by DEFSLVS.
+	 * Secondary masters can't do DAA.
+	 */
+	if (master->secondary) {
+		i3c_bus_normaluse_lock(&master->bus);
+		master->ops->update_devs(master);
+		i3c_bus_normaluse_unlock(&master->bus);
+	}
+
+	/*
 	 * We're done initializing the bus and the controller, we can now
 	 * register I3C devices dicovered during the initial DAA.
 	 */
@@ -2521,6 +2716,32 @@ int i3c_master_register(struct i3c_master_controller *master,
 EXPORT_SYMBOL_GPL(i3c_master_register);
 
 /**
+ * i3c_master_mastership_ack() - performs operations before bus handover.
+ * @master: master used to send frames on the bus
+ * @addr: I3C device address
+ *
+ * Basically, it sends DEFSLVS command to ensure new master is taking
+ * the bus with complete list of devices and then acknowledges bus takeover.
+ *
+ * Return: 0 in case of success, a negative error code otherwise.
+ */
+int i3c_master_mastership_ack(struct i3c_master_controller *master,
+			      u8 addr)
+{
+	int ret;
+
+	i3c_bus_maintenance_lock(&master->bus);
+	ret = i3c_master_get_accmst_locked(master, addr);
+	i3c_bus_maintenance_unlock(&master->bus);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i3c_master_mastership_ack);
+
+
+/**
  * i3c_master_unregister() - unregister an I3C master
  * @master: master used to send frames on the bus
  *
@@ -2544,6 +2765,7 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 int nxfers)
 {
 	struct i3c_master_controller *master;
+	int ret;
 
 	if (!dev)
 		return -ENOENT;
@@ -2552,6 +2774,12 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 	if (!master || !xfers)
 		return -EINVAL;
 
+	if (!i3c_master_owns_bus(master)) {
+		ret = i3c_master_request_mastership(master);
+		if (ret)
+			return ret;
+	}
+
 	if (!master->ops->priv_xfers)
 		return -ENOTSUPP;
 
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index f13fd8b..16e7995 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -418,6 +418,21 @@ struct i3c_bus {
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
+ * @enable_mr_events: enable the Mastership event for specified device.
+ *                    Mastership does not require handler. Mastership is enabled
+ *                    for all masters by default.
+ * @disable_mr_events: disable the Mastership event for specified device.
  */
 struct i3c_master_controller_ops {
 	int (*bus_init)(struct i3c_master_controller *master);
@@ -445,6 +460,10 @@ struct i3c_master_controller_ops {
 	int (*disable_ibi)(struct i3c_dev_desc *dev);
 	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
 				 struct i3c_ibi_slot *slot);
+	void (*update_devs)(struct i3c_master_controller *master);
+	int (*request_mastership)(struct i3c_master_controller *master);
+	int (*enable_mr_events)(struct i3c_dev_desc *dev);
+	int (*disable_mr_events)(struct i3c_dev_desc *dev);
 };
 
 /**
@@ -523,7 +542,8 @@ int i3c_master_defslvs_locked(struct i3c_master_controller *master);
 
 int i3c_master_get_free_addr(struct i3c_master_controller *master,
 			     u8 start_addr);
-
+int i3c_master_add_i2c_dev(struct i3c_master_controller *master,
+			   struct i2c_dev_boardinfo *info);
 int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 				  u8 addr);
 int i3c_master_do_daa(struct i3c_master_controller *master);
@@ -536,6 +556,13 @@ int i3c_master_register(struct i3c_master_controller *master,
 			const struct i3c_master_controller_ops *ops,
 			bool secondary);
 int i3c_master_unregister(struct i3c_master_controller *master);
+int i3c_master_get_accmst_locked(struct i3c_master_controller *master,
+				 u8 addr);
+int i3c_master_mastership_ack(struct i3c_master_controller *master,
+			      u8 addr);
+void i3c_secondary_master_events_enabled(struct i3c_master_controller *master,
+					 u8 evts);
+void i3c_master_bus_takeover(struct i3c_master_controller *master);
 
 /**
  * i3c_dev_get_master_data() - get master private data attached to an I3C
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
